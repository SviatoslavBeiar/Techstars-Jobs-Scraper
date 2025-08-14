package com.example.techstarsscraper.service;

import com.example.techstarsscraper.config.ScraperProperties;
import com.example.techstarsscraper.domain.JobPosting;
import com.example.techstarsscraper.repo.JobPostingRepository;
import com.example.techstarsscraper.scrape.JobDetailScraper;
import com.example.techstarsscraper.scrape.SeleniumListScraper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.concurrent.*;
import java.util.stream.Collectors;

@Service
public class ScrapeService {

    private final ScraperProperties props;
    private final SeleniumListScraper listScraper;
    private final JobDetailScraper detailScraper;
    private final JobPostingRepository jobs;
    private final ExportService exporter;

    public ScrapeService(ScraperProperties props,
                         SeleniumListScraper listScraper,
                         JobDetailScraper detailScraper,
                         JobPostingRepository jobs,
                         ExportService exporter) {
        this.props = props;
        this.listScraper = listScraper;
        this.detailScraper = detailScraper;
        this.jobs = jobs;
        this.exporter = exporter;
    }

    @Transactional
    public void runScrape() {
        if (props.getFunctions() == null || props.getFunctions().isEmpty()) {
            System.out.println("No functions configured; skipping scraping.");
            return;
        }

        if (props.isUseSelenium()) listScraper.init(props.isHeadless());

        int poolSize = Math.max(1, props.getMaxThreads());
        ExecutorService executor = Executors.newFixedThreadPool(poolSize);

        try {
            int totalSaved = 0, totalUpdated = 0;

            for (String fn : props.getFunctions()) {
                List<String> links = props.isUseSelenium()
                        ? listScraper.findJobLinksForFunction(fn)
                        : List.of();

                links = links.stream().filter(Objects::nonNull).distinct().toList();
                System.out.printf("Function '%s': found %d job links%n", fn, links.size());


                int totalTimeoutSec = Math.max(20, props.getDetailTimeoutSeconds() + 30);

                List<Future<Optional<JobPosting>>> futures = links.stream()
                        .map(url -> executor.submit(() -> detailScraper.scrape(url, fn)))
                        .toList();

                List<JobPosting> scraped = new ArrayList<>();
                for (int i = 0; i < futures.size(); i++) {
                    String url = links.get(i);
                    Future<Optional<JobPosting>> f = futures.get(i);
                    try {
                        Optional<JobPosting> opt = f.get(totalTimeoutSec, TimeUnit.SECONDS);
                        opt.ifPresent(scraped::add);
                    } catch (TimeoutException te) {
                        System.err.println("Timeout scraping detail (cancelled): " + url);
                        f.cancel(true);
                    } catch (ExecutionException ee) {
                        System.err.println("Detail error: " + url + " -> " + (ee.getCause() != null ? ee.getCause().getMessage() : ee.getMessage()));
                    } catch (InterruptedException ie) {
                        Thread.currentThread().interrupt();
                        System.err.println("Interrupted while scraping: " + url);
                    }
                }

                Map<String, JobPosting> unique = scraped.stream()
                        .collect(Collectors.toMap(JobPosting::getJobUrl, j -> j, (a, b) -> a));

                int savedThisFn = 0, updatedThisFn = 0;

                for (JobPosting fresh : unique.values()) {
                    if (isBlank(fresh.getJobUrl())) continue;

                    var existingOpt = jobs.findByJobUrl(fresh.getJobUrl());
                    if (existingOpt.isEmpty()) {
                        jobs.save(fresh);
                        savedThisFn++;
                    } else {
                        JobPosting existing = existingOpt.get();
                        if (merge(existing, fresh)) {
                            jobs.save(existing);
                            updatedThisFn++;
                        }
                    }
                }

                totalSaved += savedThisFn;
                totalUpdated += updatedThisFn;
                System.out.printf("Function '%s': saved %d new jobs, updated %d existing%n",
                        fn, savedThisFn, updatedThisFn);
            }

            exporter.exportToSql(props.getSqlDumpPath());
            System.out.printf("All done. Saved new: %d, updated: %d. SQL exported to %s%n",
                    totalSaved, totalUpdated, props.getSqlDumpPath());

        } finally {
            executor.shutdownNow();
            try { executor.awaitTermination(10, TimeUnit.SECONDS); } catch (InterruptedException ignored) {}
            try { listScraper.close(); } catch (Exception ignored) {}
        }
    }



    private static boolean isBlank(String s) { return s == null || s.isBlank(); }
    private static boolean notBlank(String s) { return !isBlank(s); }

    private boolean merge(JobPosting target, JobPosting fresh) {
        boolean changed = false;

        if (notBlank(fresh.getPositionName())
                && (isBlank(target.getPositionName()) || "Unknown".equalsIgnoreCase(target.getPositionName()))) {
            target.setPositionName(fresh.getPositionName()); changed = true;
        }
        if (notBlank(fresh.getOrganizationTitle()) && isBlank(target.getOrganizationTitle())) {
            target.setOrganizationTitle(fresh.getOrganizationTitle()); changed = true;
        }
        if (notBlank(fresh.getOrganizationUrl()) && isBlank(target.getOrganizationUrl())) {
            target.setOrganizationUrl(fresh.getOrganizationUrl()); changed = true;
        }
        if (notBlank(fresh.getLogoUrl()) && isBlank(target.getLogoUrl())) {
            target.setLogoUrl(fresh.getLogoUrl()); changed = true;
        }
        if (fresh.getPostedDateEpoch() != null && target.getPostedDateEpoch() == null) {
            target.setPostedDateEpoch(fresh.getPostedDateEpoch()); changed = true;
        }
        if (notBlank(fresh.getDescriptionHtml()) && isBlank(target.getDescriptionHtml())) {
            target.setDescriptionHtml(fresh.getDescriptionHtml()); changed = true;
        }

        if ((target.getLocations() == null || target.getLocations().isEmpty())
                && fresh.getLocations() != null && !fresh.getLocations().isEmpty()) {
            target.getLocations().clear();
            fresh.getLocations().forEach(lSrc -> {
                var l = new com.example.techstarsscraper.domain.Location();
                l.setRaw(lSrc.getRaw());
                l.setCity(lSrc.getCity());
                l.setStateRegion(lSrc.getStateRegion());
                l.setCountry(lSrc.getCountry());
                target.addLocation(l);
            });
            changed = true;
        }

        if ((target.getTags() == null || target.getTags().isEmpty())
                && fresh.getTags() != null && !fresh.getTags().isEmpty()) {
            target.getTags().clear();
            fresh.getTags().forEach(tSrc -> {
                var t = new com.example.techstarsscraper.domain.Tag();
                t.setName(tSrc.getName());
                target.addTag(t);
            });
            changed = true;
        }

        return changed;
    }
}
