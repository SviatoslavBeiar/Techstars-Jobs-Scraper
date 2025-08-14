package com.example.techstarsscraper.mapper;

import com.example.techstarsscraper.domain.JobPosting;
import com.example.techstarsscraper.domain.Location;
import com.example.techstarsscraper.domain.Tag;
import com.example.techstarsscraper.dto.JobPostingDto;
import com.example.techstarsscraper.dto.LocationDto;
import com.example.techstarsscraper.dto.TagDto;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface JobPostingMapper {

    JobPostingDto toDto(JobPosting j);


    LocationDto toDto(Location l);
    TagDto toDto(Tag t);
}
