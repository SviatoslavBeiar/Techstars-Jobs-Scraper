package com.example.techstarsscraper.dto;

public record LocationDto(
        Long id,
        String city,
        String stateRegion,
        String country,
        String raw
) {}
