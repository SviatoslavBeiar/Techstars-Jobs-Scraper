package com.example.techstarsscraper.config;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.validation.annotation.Validated;

import java.util.List;

@Validated
@ConfigurationProperties(prefix = "scraper")
public class ScraperProperties {

    private List<@NotBlank String> functions;

    private boolean useSelenium = true;

    private boolean useSeleniumForDetails = true;

    private boolean headless = true;

    @Min(1)
    private int maxThreads = 8;

    @Min(1)
    private int detailTimeoutSeconds = 30;

    private boolean autoRun = false;


    private String sqlDumpPath = "data/export.sql";

    public List<String> getFunctions() { return functions; }
    public void setFunctions(List<String> functions) { this.functions = functions; }

    public boolean isUseSelenium() { return useSelenium; }
    public void setUseSelenium(boolean useSelenium) { this.useSelenium = useSelenium; }

    public boolean isUseSeleniumForDetails() { return useSeleniumForDetails; }
    public void setUseSeleniumForDetails(boolean useSeleniumForDetails) { this.useSeleniumForDetails = useSeleniumForDetails; }

    public boolean isHeadless() { return headless; }
    public void setHeadless(boolean headless) { this.headless = headless; }

    public int getMaxThreads() { return maxThreads; }
    public void setMaxThreads(int maxThreads) { this.maxThreads = maxThreads; }

    public int getDetailTimeoutSeconds() { return detailTimeoutSeconds; }
    public void setDetailTimeoutSeconds(int detailTimeoutSeconds) { this.detailTimeoutSeconds = detailTimeoutSeconds; }

    public boolean isAutoRun() { return autoRun; }
    public void setAutoRun(boolean autoRun) { this.autoRun = autoRun; }

    public String getSqlDumpPath() { return sqlDumpPath; }
    public void setSqlDumpPath(String sqlDumpPath) { this.sqlDumpPath = sqlDumpPath; }
}
