package com.example.techstarsscraper.scrape;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.stereotype.Component;

import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.Duration;
import java.util.*;
import java.util.stream.Collectors;
import java.util.Base64;

@Component
public class SeleniumListScraper implements AutoCloseable {

    private WebDriver driver;
    private WebDriverWait wait;

    public void init(boolean headless) {
        if (driver != null) return;

        // URL селениум-хаба з docker-compose (можеш перекинути в @Value, якщо хочеш)
        String remote = Optional.ofNullable(System.getenv("SELENIUM_REMOTE_URL"))
                .orElse("http://selenium:4444/wd/hub");

        try {
            ChromeOptions options = new ChromeOptions();
            if (headless) options.addArguments("--headless=new");
            options.addArguments("--no-sandbox", "--disable-dev-shm-usage");
            // ЖОДНОГО ChromeDriver тут — лише RemoteWebDriver до контейнера selenium
            driver = new RemoteWebDriver(new URL(remote), options);
            wait = new WebDriverWait(driver, Duration.ofSeconds(20));
        } catch (Exception e) {
            throw new IllegalStateException("Cannot init RemoteWebDriver at " + remote, e);
        }
    }

    private String filterUrlForFunction(String functionName) {
        String json = "{\"job_functions\":[\"" + functionName.replace("\"","\\\"") + "\"]}";
        String b64 = Base64.getEncoder().encodeToString(json.getBytes(StandardCharsets.UTF_8));
        return "https://jobs.techstars.com/jobs?filter=" + URLEncoder.encode(b64, StandardCharsets.UTF_8);
    }

    public List<String> findJobLinksForFunction(String functionName) {
        Objects.requireNonNull(driver, "Call init() first");
        String url = filterUrlForFunction(functionName);
        driver.get(url);

        try { wait.until(d -> "complete".equals(((JavascriptExecutor) d).executeScript("return document.readyState"))); } catch (Exception ignored) {}

        // cookie banner
        try {
            new WebDriverWait(driver, Duration.ofSeconds(5))
                    .until(ExpectedConditions.elementToBeClickable(
                            By.xpath("//button[contains(.,'Accept') or contains(.,'Agree') or contains(.,'Got it')]"))).click();
        } catch (Exception ignored) {}

        // чек, що з’явилися лінки або лічильник
        try {
            wait.until(ExpectedConditions.or(
                    ExpectedConditions.presenceOfAllElementsLocatedBy(By.cssSelector("a[href^='/companies/'][href*='/jobs/']")),
                    ExpectedConditions.presenceOfElementLocated(By.xpath("//*[contains(.,'Showing') and contains(.,'jobs')]"))
            ));
        } catch (TimeoutException ignored) {}

        // load more
        for (int i = 0; i < 40; i++) {
            try {
                WebElement loadMore = new WebDriverWait(driver, Duration.ofSeconds(3))
                        .until(ExpectedConditions.elementToBeClickable(
                                By.xpath("//button[contains(.,'Load more')] | //a[contains(.,'Load more')]")));
                ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView({block:'center'});", loadMore);
                loadMore.click();
                try { Thread.sleep(600); } catch (InterruptedException ignored) {}
            } catch (TimeoutException e) {
                break;
            } catch (ElementClickInterceptedException e) {
                ((JavascriptExecutor) driver).executeScript("window.scrollBy(0, 300);");
                try { Thread.sleep(400); } catch (InterruptedException ignored) {}
            }
        }

        List<WebElement> anchors = driver.findElements(
                By.cssSelector("a[href^='/companies/'][href*='/jobs/'], a[href*='jobs.techstars.com/companies/'][href*='/jobs/']")
        );

        List<String> hrefs = anchors.stream()
                .map(a -> a.getAttribute("href"))
                .filter(Objects::nonNull)
                .map(String::trim)
                .filter(h -> !h.isEmpty())
                .distinct()
                .collect(Collectors.toCollection(ArrayList::new));

        // fallback без JS, якщо щось пішло не так
        if (hrefs.isEmpty()) {
            try {
                Document doc = Jsoup.connect(url)
                        .userAgent("Mozilla/5.0 (compatible; TechstarsScraper/0.1)")
                        .timeout(15000)
                        .get();

                hrefs = doc.select("a[href^=/companies/][href*=/jobs/], a[href*=jobs.techstars.com/companies/][href*=/jobs/]")
                        .stream()
                        .map(el -> el.hasAttr("href") ? (el.absUrl("href").isEmpty() ? el.attr("href") : el.absUrl("href")) : null)
                        .filter(Objects::nonNull)
                        .map(String::trim)
                        .filter(h -> !h.isEmpty())
                        .distinct()
                        .collect(Collectors.toCollection(ArrayList::new));
            } catch (Exception e) {
                System.err.println("List fallback via Jsoup failed: " + e.getMessage());
            }
        }

        System.out.printf("Function '%s': collected %d internal job links%n", functionName, hrefs.size());
        return hrefs;
    }

    @Override
    public void close() {
        if (driver != null) {
            driver.quit();
            driver = null;
        }
    }
}
