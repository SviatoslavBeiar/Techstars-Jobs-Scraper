package com.example.techstarsscraper.repo;

import com.example.techstarsscraper.domain.JobPosting;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface JobPostingRepository extends JpaRepository<JobPosting, Long> {

    Optional<JobPosting> findByJobUrl(String jobUrl);

    @EntityGraph(attributePaths = {"locations", "tags"})
    @Query("select jp from JobPosting jp order by jp.id")
    List<JobPosting> findAllWithChildren();
}
