package com.example.techstarsscraper.web;

import com.example.techstarsscraper.dto.JobPostingDto;
import com.example.techstarsscraper.service.JobQueryService;
import com.example.techstarsscraper.service.ScrapeService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/jobs")
public class JobController {

    private final JobQueryService queryService;
    private final ScrapeService scrapeService;

    public JobController(JobQueryService queryService, ScrapeService scrapeService) {
        this.queryService = queryService;
        this.scrapeService = scrapeService;
    }

    @GetMapping
    public List<JobPostingDto> all() {
        return queryService.getAll();
    }

    @PostMapping("/scrape")
    public ResponseEntity<Map<String, String>> triggerScrape() {
        scrapeService.runScrape();
        return ResponseEntity.accepted().body(Map.of("status", "started"));
    }
}
