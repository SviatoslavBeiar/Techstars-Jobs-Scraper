package com.example.techstarsscraper.service;

import com.example.techstarsscraper.dto.JobPostingDto;
import com.example.techstarsscraper.mapper.JobPostingMapper;
import com.example.techstarsscraper.repo.JobPostingRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class JobQueryService {

    private final JobPostingRepository repo;
    private final JobPostingMapper mapper;

    public JobQueryService(JobPostingRepository repo, JobPostingMapper mapper) {
        this.repo = repo;
        this.mapper = mapper;
    }

    @Transactional(readOnly = true)
    public List<JobPostingDto> getAll() {
        return repo.findAllWithChildren().stream()
                .map(mapper::toDto)
                .toList();
    }
}
