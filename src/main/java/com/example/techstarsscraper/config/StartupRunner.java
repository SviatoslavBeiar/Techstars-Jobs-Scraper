package com.example.techstarsscraper.config;

import com.example.techstarsscraper.service.ScrapeService;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

@Component
public class StartupRunner implements ApplicationRunner {

    private final ScrapeService scrapeService;
    private final ScraperProperties props;

    public StartupRunner(ScrapeService scrapeService, ScraperProperties props) {
        this.scrapeService = scrapeService;
        this.props = props;
    }

    @Override
    public void run(ApplicationArguments args) {
        if (props.isAutoRun()) {
            try {
                System.out.println("Auto-run enabled; starting scrape...");
                scrapeService.runScrape();
            } catch (Exception ex) {

                System.err.println("Auto-run failed: " + ex.getMessage());
            }
        }
    }
}
