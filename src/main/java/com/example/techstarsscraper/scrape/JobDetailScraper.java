package com.example.techstarsscraper.scrape;

import com.example.techstarsscraper.domain.JobPosting;
import com.example.techstarsscraper.domain.Location;
import com.example.techstarsscraper.domain.Tag;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.safety.Safelist;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.net.SocketTimeoutException;
import java.net.URI;
import java.time.Instant;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

@Component
public class JobDetailScraper {

    private static final Logger log = LoggerFactory.getLogger(JobDetailScraper.class);

    private static final int TIMEOUT_MS = 20000;
    private static final int MAX_HTML_LEN = 200_000;
    private static final int VARCHAR_LIMIT = 255;
    private static final int MAX_RETRIES = 2;

    private static final String UA =
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 " +
                    "(KHTML, like Gecko) Chrome/120.0 Safari/537.36";

    private static final Pattern COMPANY_SLUG_FROM_JOB =
            Pattern.compile("https?://[^/]+/companies/([^/]+)/jobs/");

    private final ObjectMapper mapper = new ObjectMapper();

    public Optional<JobPosting> scrape(String url, String laborFunction) {
        if (url == null || url.isBlank()) return Optional.empty();

        JobPosting jp = new JobPosting();
        jp.setJobUrl(clamp(url, VARCHAR_LIMIT));
        if (laborFunction != null) {
            jp.setLaborFunction(clamp(laborFunction, VARCHAR_LIMIT));
        }
        try { jp.setCreatedAt(Instant.now()); } catch (Throwable ignore) {}
        jp.setPositionName("Unknown");

        try {
            enrich(jp);
            if (isBlank(jp.getPositionName())) {
                jp.setPositionName("Unknown");
            }
        } catch (Exception e) {
            log.warn("Detail scrape failed for {} -> {}", url, e.getMessage());
        }
        return Optional.of(jp);
    }

    public void enrich(JobPosting jp) {
        String url = jp.getJobUrl();
        if (url == null || url.isBlank()) {
            log.warn("JobPosting has empty jobUrl");
            return;
        }
        try {
            Document doc = fetch(url);
            JsonNode ld = readJsonLd(doc);

            extractPositionName(doc, ld, jp);
            extractOrg(doc, ld, jp, url);
            extractLogoUrl(doc, ld, jp, url);
            extractPostedDate(doc, ld, jp);
            extractDescription(doc, jp);
            extractLocations(doc, ld, jp);
            extractTags(doc, ld, jp);
        } catch (Exception e) {
            log.warn("Detail enrichment failed for {}", url, e);
        }
    }


    private Document fetch(String url) throws Exception {
        int attempt = 0;
        while (true) {
            attempt++;
            try {
                Connection conn = Jsoup.connect(url)
                        .userAgent(UA)
                        .referrer("https://www.google.com/")
                        .header("Accept-Language", "en-US,en;q=0.8")
                        .timeout(TIMEOUT_MS)
                        .followRedirects(true)
                        .maxBodySize(3 * 1024 * 1024) // 3MB
                        .ignoreHttpErrors(true);

                return conn.get();
            } catch (SocketTimeoutException te) {
                if (attempt > MAX_RETRIES) {
                    log.warn("Timeout fetching {} (attempt {}): {}", url, attempt, te.toString());
                    throw te;
                }
                log.info("Retrying fetch {} after timeout (attempt {}): {}", url, attempt, te.toString());
            } catch (IOException ioe) {
                if (attempt > MAX_RETRIES) {
                    log.warn("IO error fetching {} (attempt {}): {}", url, attempt, ioe.toString());
                    throw ioe;
                }
                log.info("Retrying fetch {} after IO error (attempt {}): {}", url, attempt, ioe.toString());
            }
        }
    }


    private void extractPositionName(Document doc, JsonNode ld, JobPosting jp) {
        String title = null;

        Element h1 = doc.selectFirst("main h1, h1");
        if (h1 != null) title = h1.text();

        if (isBlank(title) && ld != null) {
            if (ld.hasNonNull("title")) title = ld.get("title").asText();
            if (isBlank(title) && ld.hasNonNull("jobTitle"))
                title = ld.get("jobTitle").asText();
        }

        if (isBlank(title)) {
            Element og = doc.selectFirst("meta[property=og:title][content]");
            if (og != null) title = og.attr("content");
        }

        if (isBlank(title) && doc.title() != null) {
            title = doc.title().replaceFirst("\\s*\\|\\s*Techstars\\s*$", "");
        }

        if (!isBlank(title)) {
            title = title.trim();
            if (equalsIgnoreCaseAny(title,
                    "This site can’t be reached",
                    "This site can't be reached",
                    "Page not found",
                    "Not Found")) {
                return;
            }
            jp.setPositionName(clamp(title, VARCHAR_LIMIT));
        }
    }

    private void extractOrg(Document doc, JsonNode ld, JobPosting jp, String jobUrl) {
        Element moreLink = doc.selectFirst("a:matchesOwn((?i)^\\s*See more open positions at\\b)");
        if (moreLink != null) {
            String href = clamp(absUrl(moreLink, "href"), VARCHAR_LIMIT);
            String text = moreLink.text();
            String company = text.replaceFirst("(?i)^\\s*See more open positions at\\s+", "").trim();
            if (!href.isBlank()) jp.setOrganizationUrl(href);
            if (!company.isBlank()) jp.setOrganizationTitle(clamp(company, VARCHAR_LIMIT));
        }

        if ((isBlank(jp.getOrganizationTitle()) || isBlank(jp.getOrganizationUrl())) && ld != null) {
            JsonNode org = firstNonNull(ld.get("hiringOrganization"), ld.get("organization"));
            if (org != null) {
                if (isBlank(jp.getOrganizationTitle()) && org.hasNonNull("name")) {
                    jp.setOrganizationTitle(clamp(org.get("name").asText().trim(), VARCHAR_LIMIT));
                }
                if (isBlank(jp.getOrganizationUrl()) && org.hasNonNull("url")) {
                    jp.setOrganizationUrl(clamp(org.get("url").asText().trim(), VARCHAR_LIMIT));
                }
                if (isBlank(jp.getOrganizationUrl()) && org.hasNonNull("sameAs")) {
                    jp.setOrganizationUrl(clamp(org.get("sameAs").asText().trim(), VARCHAR_LIMIT));
                }
            }
        }

        if (isBlank(jp.getOrganizationUrl())) {
            Matcher m = COMPANY_SLUG_FROM_JOB.matcher(jobUrl);
            if (m.find()) {
                String slug = m.group(1);
                String orgUrl = "https://jobs.techstars.com/companies/" + slug + "#content";
                jp.setOrganizationUrl(clamp(orgUrl, VARCHAR_LIMIT));
                if (isBlank(jp.getOrganizationTitle())) {
                    jp.setOrganizationTitle(clamp(slug.replace('-', ' '), VARCHAR_LIMIT));
                }
            }
        }
    }

    private void extractLogoUrl(Document doc, JsonNode ld, JobPosting jp, String jobUrl) {
        if (!isBlank(jp.getLogoUrl())) return;

        String logo = null;

        if (ld != null) {
            JsonNode org = firstNonNull(ld.get("hiringOrganization"), ld.get("organization"));
            if (org != null && org.has("logo")) {
                JsonNode lg = org.get("logo");
                if (lg.isTextual()) {
                    logo = lg.asText();
                } else {
                    String u = text(lg, "url");
                    if (isBlank(u)) u = text(lg, "contentUrl");
                    logo = u;
                }
            }
        }

        if (isBlank(logo)) {
            Element og = doc.selectFirst("meta[property=og:image][content]");
            if (og != null) logo = og.attr("content");
        }
        if (isBlank(logo)) {
            Element tw = doc.selectFirst("meta[name=twitter:image][content]");
            if (tw != null) logo = tw.attr("content");
        }

        if (isBlank(logo)) {
            Element img = doc.selectFirst("img[alt~=(?i)logo][src]");
            if (img != null) logo = absUrl(img, "src");
        }

        if (isBlank(logo)) {
            Element icon = doc.selectFirst("link[rel~=(?i)icon][href]");
            if (icon != null) logo = absUrl(icon, "href");
        }

        if (isBlank(logo)) {
            String origin = originOf(jobUrl != null ? jobUrl : doc.location());
            if (!isBlank(origin)) logo = origin + "/favicon.ico";
        }

        if (!isBlank(logo)) {

            logo = resolveUrl(doc.location(), logo);

            try {
                URI u = new URI(logo);
                String scheme = Optional.ofNullable(u.getScheme()).orElse("").toLowerCase(Locale.ROOT);
                if (!scheme.equals("http") && !scheme.equals("https")) {
                    logo = null;
                }
            } catch (Exception ignore) { logo = null; }

            if (!isBlank(logo)) {
                jp.setLogoUrl(clamp(logo, VARCHAR_LIMIT));
            }
        }
    }

    private void extractPostedDate(Document doc, JsonNode ld, JobPosting jp) {

        Element time = doc.selectFirst("time[datetime]");
        if (time != null) {
            String iso = time.attr("datetime").trim();
            parseAndSetEpoch(jp, iso);
            if (jp.getPostedDateEpoch() != null) return;
        }


        Element meta = doc.selectFirst("meta[property=article:published_time][content]");
        if (meta != null) {
            parseAndSetEpoch(jp, meta.attr("content").trim());
            if (jp.getPostedDateEpoch() != null) return;
        }


        if (ld != null) {
            for (String k : new String[]{"datePosted", "datePublished", "dateCreated"}) {
                if (ld.hasNonNull(k)) {
                    parseAndSetEpoch(jp, ld.get(k).asText());
                    if (jp.getPostedDateEpoch() != null) return;
                }
            }
        }
    }

    private void parseAndSetEpoch(JobPosting jp, String iso) {
        if (isBlank(iso)) return;
        try {
            jp.setPostedDateEpoch(OffsetDateTime.parse(iso, DateTimeFormatter.ISO_OFFSET_DATE_TIME)
                    .toInstant().getEpochSecond());
            return;
        } catch (Exception ignore) {}
        try {
            jp.setPostedDateEpoch(Instant.parse(iso).getEpochSecond());
            return;
        } catch (Exception ignore) {}
        try {
            jp.setPostedDateEpoch(OffsetDateTime.parse(iso, DateTimeFormatter.ISO_DATE_TIME)
                    .toInstant().getEpochSecond());
            return;
        } catch (Exception ignore) {}
        try {
            LocalDate d = LocalDate.parse(iso, DateTimeFormatter.ISO_DATE);
            jp.setPostedDateEpoch(d.atStartOfDay(ZoneOffset.UTC).toEpochSecond());
        } catch (Exception ignore) {}
    }


    private void extractDescription(Document doc, JobPosting jp) {
        doc.select("script,style,nav,header,footer,svg,form,button,link,meta").remove();

        Element main = Optional.ofNullable(doc.selectFirst("main article"))
                .orElseGet(() -> doc.selectFirst("main [itemprop=description]"));
        if (main == null) main = doc.selectFirst("main");
        if (main == null) main = doc.body();

        Elements secHeads = main.select("h2:matchesOwn(About the Role|About You|Responsibilities|Requirements|Benefits|Interview)");
        String html;
        if (!secHeads.isEmpty()) {
            html = secHeads.stream()
                    .map(h -> {
                        Element parent = h.parent() != null ? h.parent() : h;
                        return parent.outerHtml();
                    })
                    .distinct()
                    .collect(Collectors.joining("\n"));
        } else {
            Element afterH1 = main.selectFirst("h1 ~ *");
            html = (afterH1 != null ? afterH1.outerHtml() : main.outerHtml());
        }

        Safelist allow = Safelist.relaxed()
                .addTags("h2", "h3", "h4")
                .addAttributes(":all", "href")
                .addProtocols("a", "href", "http", "https");
        html = Jsoup.clean(html, doc.baseUri(), allow);
        if (html.length() > MAX_HTML_LEN) html = html.substring(0, MAX_HTML_LEN);
        jp.setDescriptionHtml(html);
    }


    private void extractLocations(Document doc, JsonNode ld, JobPosting jp) {
        Set<String> seen = new HashSet<>();


        try {
            if (ld != null) {
                JsonNode jobLoc = ld.get("jobLocation");
                if (jobLoc != null) {
                    if (jobLoc.isArray()) for (JsonNode n : jobLoc) addLocationFromLdNode(n, jp, seen);
                    else addLocationFromLdNode(jobLoc, jp, seen);
                }
            }
        } catch (Exception ignore) { }


        List<String> rawCandidates = new ArrayList<>();

        rawCandidates.addAll(textMatches(doc, "(?i)^\\s*Remote\\s*$"));
        rawCandidates.addAll(textMatches(doc, "(?i)\\b(United States|USA|US|Europe|Ireland|India|Canada|United Kingdom|UK|UAE|United Arab Emirates|Poland|Portugal|Germany|France|Spain|Italy|Netherlands|Mexico|Brazil|Australia|New Zealand|Singapore)\\b"));

        for (Element el : doc.select(":matchesOwn((?i)\\bLocation[s]?\\s*[:\\-])")) {
            Element sib = el.nextElementSibling();
            if (sib != null && sib.hasText()) rawCandidates.add(sib.text());

            String t = el.ownText();
            if (t == null || t.isBlank()) t = el.text();
            if (t != null) {
                Matcher m = Pattern.compile("(?i)\\bLocation[s]?\\s*[:\\-]\\s*(.+)").matcher(t);
                if (m.find()) rawCandidates.add(m.group(1));
            }
        }

        String scopeText = Optional.ofNullable(doc.selectFirst("main")).orElse(doc.body()).text();
        Matcher paren = Pattern.compile("(?i)(On[- ]?site|Hybrid)\\s*\\(([^)\\n\\r]{1,80})\\)").matcher(scopeText);
        while (paren.find()) rawCandidates.add(paren.group(2));

        for (String rawOrig : rawCandidates) {
            if (rawOrig == null) continue;
            String raw = rawOrig.trim();
            if (raw.isEmpty()) continue;

            if (raw.contains("·")) {
                for (String part : raw.split("\\s*·\\s*")) {
                    handleLocationCandidate(jp, seen, part);
                }
                continue;
            }
            handleLocationCandidate(jp, seen, raw);
        }
    }

    private String contextCountryFromExisting(JobPosting jp) {
        if (jp.getLocations() == null) return null;
        String only = null;
        for (Location loc : jp.getLocations()) {
            if (loc == null) continue;
            String c = loc.getCountry();
            if (c == null || c.isBlank()) continue;
            if (!isBlank(loc.getCity()) || !isBlank(loc.getStateRegion())) continue;
            if (only == null) only = c;
            else if (!only.equalsIgnoreCase(c)) return null;
        }
        return only;
    }


    private boolean looksLikeCity(String raw) {
        if (raw == null) return false;
        String r = raw.trim();
        if (r.isEmpty() || r.matches(".*\\d.*")) return false;
        if (pickRegionToken(r) != null) return false;
        if (r.length() <= 40 && Character.isUpperCase(r.charAt(0))) {
            String up = r.toUpperCase(Locale.ROOT);
            return !(up.equals("HTML") || up.equals("CSS") || up.equals("TAILWIND"));
        }
        return false;
    }

    private boolean isSalaryLike(String s) {
        if (s == null) return false;
        String t = s.trim();
        if (t.isEmpty()) return false;

        if (t.matches("(?i).*(\\$|USD|EUR|GBP|£|€)\\s*\\d{1,3}(?:[.,]\\d{3})*(?:\\s*[kK])?(?:\\s*[-–]\\s*\\d{1,3}(?:[.,]\\d{3})*(?:\\s*[kK])?)?.*")) return true;
        if (t.matches("(?i).*\\b\\d{2,3}\\s*[kK]\\b(?:\\s*[-–]\\s*\\d{2,3}\\s*[kK]\\b)?(\\s*/\\s*year|\\s*per\\s*year|\\s*yr|\\s*/\\s*month|\\s*mo)?\\b.*")) return true;
        if (t.matches("(?i).*\\b(compensation|salary|annual|per\\s*year|/\\s*year|yr|annum|equity|OTE)\\b.*")) return true;

        return false;
    }

    private boolean looksLikeLocation(String raw) {
        if (raw == null) return false;
        String s = raw.trim();
        if (s.isEmpty()) return false;
        if (isSalaryLike(s)) return false;
        if (s.length() > 80) return false;
        if (s.matches(".*\\d.*")) return false;
        if (s.matches("(?i).*(http|www\\.).*")) return false;
        if (s.matches("(?i).*(position|located|within|expected|team|office).*")) return false; // речення

        if (s.matches("(?i).*(\\bUnited States\\b|\\bUSA\\b|\\bUS\\b|\\bUnited Kingdom\\b|\\bUK\\b|\\bEurope\\b|\\bIreland\\b|\\bIndia\\b|\\bCanada\\b|\\bUAE\\b|\\bUnited Arab Emirates\\b|\\bPoland\\b|\\bPortugal\\b|\\bGermany\\b|\\bFrance\\b|\\bSpain\\b|\\bItaly\\b|\\bNetherlands\\b|\\bMexico\\b|\\bBrazil\\b|\\bAustralia\\b|\\bNew Zealand\\b|\\bSingapore\\b|\\bEMEA\\b|\\bAPAC\\b|\\bLATAM\\b|\\bDACH\\b|\\bBenelux\\b).*"))
            return true;
        if (s.matches("^[\\p{L} .'\u2019-]+,\\s*[\\p{L} .'\u2019-]+(,\\s*[\\p{L} .'\u2019-]+)?$")) return true;
        if (s.matches("^[\\p{L} .'\u2019-]+,\\s*[A-Z]{2}$")) return true;

        return looksLikeCity(s);
    }

    private void handleLocationCandidate(JobPosting jp, Set<String> seen, String rawInput) {
        if (rawInput == null) return;
        String raw = rawInput.trim();
        if (raw.isEmpty()) return;

        raw = raw.replaceAll("^\\(|\\)$", "");
        raw = raw.replaceFirst("(?i)^\\s*(Remote|On[- ]?site|Hybrid)\\s*,?\\s*", "");
        raw = raw.replaceAll("\\s{2,}", " ").trim();

        if (raw.equalsIgnoreCase("Remote")) return;
        if (isSalaryLike(raw)) return;
        if (raw.length() > 80) return;
        if (!looksLikeLocation(raw)) return;

        String region = pickRegionToken(raw);
        if (region != null && !region.equalsIgnoreCase(raw)) raw = region;

        String key = norm(raw);
        if (key.isEmpty() || !seen.add(key)) return;

        Location l = new Location();
        l.setRaw(clamp(raw, VARCHAR_LIMIT));

        String[] parts = raw.split("\\s*,\\s*");
        if (parts.length >= 3) {
            l.setCity(clamp(parts[0], VARCHAR_LIMIT));
            l.setStateRegion(clamp(parts[1], VARCHAR_LIMIT));
            l.setCountry(clamp(parts[2], VARCHAR_LIMIT));
            jp.addLocation(l);
            return;
        }

        if (parts.length == 2) {
            String right = parts[1];
            String maybeRegion = pickRegionToken(right);
            if (maybeRegion != null || right.matches("^[A-Z]{2}$")) {
                l.setCity(clamp(parts[0], VARCHAR_LIMIT));
                if (maybeRegion != null) {
                    l.setCountry(clamp(maybeRegion, VARCHAR_LIMIT));
                } else {
                    l.setStateRegion(clamp(right, VARCHAR_LIMIT));
                }
                jp.addLocation(l);
            }
            return;
        }

        String ctxCountry = contextCountryFromExisting(jp);
        if (ctxCountry != null && looksLikeCity(raw) && pickRegionToken(raw) == null) {
            l.setCity(clamp(raw, VARCHAR_LIMIT));
            l.setCountry(clamp(ctxCountry, VARCHAR_LIMIT));
            jp.addLocation(l);
            return;
        }

        String asRegion = pickRegionToken(raw);
        if (asRegion != null) {
            l.setCountry(clamp(asRegion, VARCHAR_LIMIT));
            jp.addLocation(l);
        }
    }

    private String pickRegionToken(String raw) {
        if (raw == null) return null;
        String r = raw.toLowerCase(Locale.ROOT);

        if (r.matches(".*\\b(united\\s+states|\\busa\\b|\\bus\\b)\\b.*")) return "United States";
        if (r.matches(".*\\b(united\\s+kingdom|\\buk\\b)\\b.*"))        return "United Kingdom";
        if (r.matches(".*\\b(united\\s+arab\\s+emirates|\\buae\\b)\\b.*")) return "United Arab Emirates";
        if (r.matches(".*\\bnew\\s+zealand\\b.*"))                      return "New Zealand";
        if (r.matches(".*\\bcanada\\b.*"))                              return "Canada";
        if (r.matches(".*\\bindia\\b.*"))                               return "India";
        if (r.matches(".*\\bireland\\b.*"))                             return "Ireland";
        if (r.matches(".*\\bmexico\\b.*"))                              return "Mexico";
        if (r.matches(".*\\bbrazil\\b.*"))                              return "Brazil";
        if (r.matches(".*\\bgermany\\b.*"))                             return "Germany";
        if (r.matches(".*\\bfrance\\b.*"))                              return "France";
        if (r.matches(".*\\bspain\\b.*"))                               return "Spain";
        if (r.matches(".*\\bitaly\\b.*"))                               return "Italy";
        if (r.matches(".*\\bnetherlands\\b.*"))                         return "Netherlands";
        if (r.matches(".*\\baustralia\\b.*"))                           return "Australia";
        if (r.matches(".*\\bsingapore\\b.*"))                           return "Singapore";
        if (r.matches(".*\\bpoland\\b.*"))                              return "Poland";
        if (r.matches(".*\\bportugal\\b.*"))                            return "Portugal";

        if (r.matches(".*\\b(emea)\\b.*"))                              return "Europe";
        if (r.matches(".*\\b(apac)\\b.*"))                              return "Asia-Pacific";
        if (r.matches(".*\\b(latam)\\b.*"))                             return "Latin America";
        if (r.matches(".*\\b(dach)\\b.*"))                              return "Germany";
        if (r.matches(".*\\b(benelux)\\b.*"))                           return "Netherlands";

        if (r.matches(".*\\beurope\\b.*"))                              return "Europe";
        return null;
    }

    private void addLocationFromLdNode(JsonNode n, JobPosting jp, Set<String> seen) {
        JsonNode addr = null;
        if (n.has("address")) addr = n.get("address");
        if (n.has("jobLocation")) {
            JsonNode jl = n.get("jobLocation");
            if (jl != null && jl.has("address")) addr = jl.get("address");
        }
        if (addr == null || addr.isNull()) return;

        String city = text(addr, "addressLocality");
        String region = text(addr, "addressRegion");
        String country = text(addr, "addressCountry");

        String raw = Arrays.asList(city, region, country).stream()
                .filter(s -> s != null && !s.isBlank())
                .collect(Collectors.joining(", "));
        if (raw.isBlank()) raw = text(addr, "streetAddress");

        String key = norm(raw);
        if (!key.isEmpty() && seen.add(key)) {
            Location l = new Location();
            l.setCity(clamp(emptyToNull(city), VARCHAR_LIMIT));
            l.setStateRegion(clamp(emptyToNull(region), VARCHAR_LIMIT));
            l.setCountry(clamp(emptyToNull(country), VARCHAR_LIMIT));
            l.setRaw(clamp(raw, VARCHAR_LIMIT));
            jp.addLocation(l);
        }
    }

    private void extractTags(Document doc, JsonNode ld, JobPosting jp) {
        Set<String> tags = new LinkedHashSet<>();

        Element headerLine = doc.selectFirst("main h1 + *");
        if (headerLine != null) {
            String[] parts = headerLine.text().split(",");
            for (String p : parts) {
                String t = p.trim();
                if (!t.isEmpty() && looksLikeCategory(t)) tags.add(t);
            }
        }

        if (doc.selectFirst(":matchesOwn((?i)\\bRemote\\b)") != null) tags.add("Remote");
        if (doc.selectFirst(":matchesOwn((?i)On[- ]site|Onsite)") != null) tags.add("On-site");
        if (doc.selectFirst(":matchesOwn((?i)Hybrid)") != null) tags.add("Hybrid");

        Matcher pay1 = Pattern.compile("(USD|EUR|GBP)\\s?[\\d.,kK]+\\s?-\\s?[\\d.,kK]+\\s?/\\s?(year|yr|month|mo)", Pattern.CASE_INSENSITIVE)
                .matcher(doc.text());
        if (pay1.find()) tags.add(pay1.group());
        Matcher pay2 = Pattern.compile("\\b\\d{2,3}\\s*[kK]\\b\\s?(?:[-–]\\s?\\d{2,3}\\s*[kK]\\b)?\\s*(?:/\\s*(year|yr|month|mo))?", Pattern.CASE_INSENSITIVE)
                .matcher(doc.text());
        if (pay2.find()) tags.add(pay2.group());

        if (ld != null) {
            for (String k : List.of("employmentType", "industry", "occupationalCategory")) {
                JsonNode v = ld.get(k);
                if (v == null || v.isNull()) continue;
                if (v.isArray()) v.forEach(n -> addIfNotBlank(tags, n.asText()));
                else addIfNotBlank(tags, v.asText());
            }
        }

        if (!tags.isEmpty()) {
            if (jp.getTags() != null) {
                try { jp.getTags().clear(); } catch (Exception ignore) {}
            }
            for (String t : tags) {
                Tag tag = new Tag();
                tag.setName(clamp(t, VARCHAR_LIMIT));
                jp.addTag(tag);
            }
        }
    }


    private JsonNode readJsonLd(Document doc) {
        Elements scripts = doc.select("script[type=application/ld+json]");
        for (Element s : scripts) {
            String json = s.data();
            if (json == null || json.isBlank()) continue;
            try {
                JsonNode node = mapper.readTree(json);


                if (node.isArray()) {
                    for (JsonNode n : node) {
                        JsonNode jp = pickJobPostingNode(n);
                        if (jp != null) return jp;
                    }
                }


                JsonNode graph = node.get("@graph");
                if (graph != null && graph.isArray()) {
                    for (JsonNode n : graph) {
                        JsonNode jp = pickJobPostingNode(n);
                        if (jp != null) return jp;
                    }
                }


                JsonNode single = pickJobPostingNode(node);
                if (single != null) return single;

            } catch (Exception ignore) { }
        }
        return null;
    }

    private JsonNode pickJobPostingNode(JsonNode n) {
        if (n == null) return null;
        JsonNode t = n.get("@type");
        if (t == null) return null;
        if (t.isArray()) {
            for (JsonNode x : t) {
                if ("JobPosting".equalsIgnoreCase(x.asText())) return n;
            }
            return null;
        }
        return "JobPosting".equalsIgnoreCase(t.asText()) ? n : null;
    }

    private String absUrl(Element el, String attr) {
        if (el == null) return "";
        String abs = el.absUrl(attr);
        if (abs == null || abs.isBlank()) return el.attr(attr);
        return abs;
    }


    private static String resolveUrl(String base, String maybeRelative) {
        if (isBlank(maybeRelative)) return maybeRelative;
        try {
            URI u = new URI(maybeRelative);
            if (u.isAbsolute()) return maybeRelative;
        } catch (Exception ignore) {}
        try {
            return new URI(base).resolve(maybeRelative).toString();
        } catch (Exception e) {
            return maybeRelative;
        }
    }


    private static String originOf(String url) {
        try {
            URI u = new URI(url);
            String port = (u.getPort() == -1) ? "" : ":" + u.getPort();
            return u.getScheme() + "://" + u.getHost() + port;
        } catch (Exception e) {
            return null;
        }
    }

    private static String text(JsonNode node, String field) {
        return node != null && node.hasNonNull(field) ? node.get(field).asText().trim() : null;
    }

    private static JsonNode firstNonNull(JsonNode... nodes) {
        for (JsonNode n : nodes) if (n != null && !n.isNull()) return n;
        return null;
    }

    private static String emptyToNull(String s) {
        return (s == null || s.isBlank()) ? null : s;
    }

    private static boolean isBlank(String s) {
        return s == null || s.isBlank();
    }

    private static String norm(String s) {
        return s == null ? "" : s.trim().toLowerCase(Locale.ROOT);
    }

    private static boolean looksLikeCategory(String s) {
        if (s == null) return false;
        String n = s.toLowerCase(Locale.ROOT);
        return n.contains("engineering") || n.contains("software") || n.contains("data")
                || n.contains("product") || n.contains("design") || n.contains("ai")
                || n.contains("ml") || n.contains("ops") || n.contains("frontend")
                || n.contains("backend") || n.contains("full stack") || n.contains("qa")
                || n.contains("security");
    }

    private static boolean equalsIgnoreCaseAny(String s, String... options) {
        if (s == null) return false;
        for (String o : options) if (s.equalsIgnoreCase(o)) return true;
        return false;
    }

    private static String clamp(String s, int max) {
        if (s == null) return null;
        String t = s.trim();
        if (t.length() <= max) return t;
        return t.substring(0, max);
    }

    private static void addIfNotBlank(Set<String> set, String v) {
        if (v != null) {
            String t = v.trim();
            if (!t.isEmpty()) set.add(t);
        }
    }

    private static List<String> textMatches(Document doc, String regex) {
        return doc.select(":matchesOwn(" + regex + ")").stream()
                .map(Element::text)
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .distinct()
                .collect(Collectors.toList());
    }
}
