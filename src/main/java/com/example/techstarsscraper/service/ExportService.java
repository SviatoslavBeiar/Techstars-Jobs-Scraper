package com.example.techstarsscraper.service;

import com.example.techstarsscraper.domain.JobPosting;
import com.example.techstarsscraper.domain.Location;
import com.example.techstarsscraper.domain.Tag;
import com.example.techstarsscraper.repo.JobPostingRepository;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

@Service
public class ExportService {

    private final JobPostingRepository jobs;

    public ExportService(JobPostingRepository jobs) {
        this.jobs = jobs;
    }

    public void exportToSql(String outputPath) {
        try {
            Path path = Path.of(outputPath);
            Files.createDirectories(path.getParent());
            StringBuilder sb = new StringBuilder();
            sb.append("-- Generated SQL dump with schema and data\n");
            sb.append("DROP TABLE IF EXISTS tag;\n");
            sb.append("DROP TABLE IF EXISTS location;\n");
            sb.append("DROP TABLE IF EXISTS job_posting;\n");
            sb.append("CREATE TABLE job_posting (\n")
              .append("  id BIGSERIAL PRIMARY KEY,\n")
              .append("  jobUrl TEXT NOT NULL UNIQUE,\n")
              .append("  positionName VARCHAR(512) NOT NULL,\n")
              .append("  organizationUrl TEXT,\n")
              .append("  logoUrl TEXT,\n")
              .append("  organizationTitle VARCHAR(512),\n")
              .append("  laborFunction VARCHAR(256),\n")
              .append("  postedDateEpoch BIGINT,\n")
              .append("  descriptionHtml TEXT,\n")
              .append("  createdAt TIMESTAMP\n")
              .append(");\n");
            sb.append("CREATE TABLE location (\n")
              .append("  id BIGSERIAL PRIMARY KEY,\n")
              .append("  city VARCHAR(255),\n")
              .append("  stateRegion VARCHAR(255),\n")
              .append("  country VARCHAR(255),\n")
              .append("  raw VARCHAR(512),\n")
              .append("  job_posting_id BIGINT REFERENCES job_posting(id) ON DELETE CASCADE\n")
              .append(");\n");
            sb.append("CREATE TABLE tag (\n")
              .append("  id BIGSERIAL PRIMARY KEY,\n")
              .append("  name VARCHAR(255),\n")
              .append("  job_posting_id BIGINT REFERENCES job_posting(id) ON DELETE CASCADE\n")
              .append(");\n\n");

            List<JobPosting> all = jobs.findAll();
            for (JobPosting j : all) {
                sb.append(String.format("INSERT INTO job_posting (id, jobUrl, positionName, organizationUrl, logoUrl, organizationTitle, laborFunction, postedDateEpoch, descriptionHtml, createdAt) VALUES (DEFAULT, %s, %s, %s, %s, %s, %s, %s, %s, NOW());\n",
                        q(j.getJobUrl()), q(j.getPositionName()), q(j.getOrganizationUrl()), q(j.getLogoUrl()),
                        q(j.getOrganizationTitle()), q(j.getLaborFunction()), j.getPostedDateEpoch() == null ? "NULL" : j.getPostedDateEpoch().toString(),
                        q(j.getDescriptionHtml())
                ));
                sb.append("SELECT currval(pg_get_serial_sequence('job_posting','id')) INTO TEMP TABLE last_id;\n"); // Postgres-specific; simplified demo
                sb.append("-- NOTE: Adjust identity retrieval if running outside PostgreSQL psql environment.\n");
                for (Location loc : j.getLocations()) {
                    sb.append(String.format("INSERT INTO location (city, stateRegion, country, raw, job_posting_id) VALUES (%s, %s, %s, %s, (SELECT * FROM last_id));\n",
                            q(loc.getCity()), q(loc.getStateRegion()), q(loc.getCountry()), q(loc.getRaw())));
                }
                for (Tag t : j.getTags()) {
                    sb.append(String.format("INSERT INTO tag (name, job_posting_id) VALUES (%s, (SELECT * FROM last_id));\n", q(t.getName())));
                }
                sb.append("DROP TABLE last_id;\n\n");
            }

            Files.writeString(path, sb.toString());
        } catch (IOException e) {
            throw new RuntimeException("Failed to write SQL dump: " + e.getMessage(), e);
        }
    }

    private String q(String value) {
        if (value == null) return "NULL";
        return "'" + value.replace("'", "''") + "'";
    }
}
