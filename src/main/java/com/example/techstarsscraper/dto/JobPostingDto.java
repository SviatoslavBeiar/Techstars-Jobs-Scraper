package com.example.techstarsscraper.dto;

import java.time.Instant;
import java.util.List;

public record JobPostingDto(
        Long id,
        String jobUrl,
        String positionName,
        String organizationUrl,
        String logoUrl,
        String organizationTitle,
        String laborFunction,
        Long postedDateEpoch,
        String descriptionHtml,
        Instant createdAt,
        List<LocationDto> locations,
        List<TagDto> tags
) {}
