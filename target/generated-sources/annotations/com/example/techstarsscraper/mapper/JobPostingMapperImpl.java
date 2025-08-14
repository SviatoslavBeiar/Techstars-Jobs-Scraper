package com.example.techstarsscraper.mapper;

import com.example.techstarsscraper.domain.JobPosting;
import com.example.techstarsscraper.domain.Location;
import com.example.techstarsscraper.domain.Tag;
import com.example.techstarsscraper.dto.JobPostingDto;
import com.example.techstarsscraper.dto.LocationDto;
import com.example.techstarsscraper.dto.TagDto;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2025-08-14T10:00:15+0200",
    comments = "version: 1.5.5.Final, compiler: javac, environment: Java 23 (Oracle Corporation)"
)
@Component
public class JobPostingMapperImpl implements JobPostingMapper {

    @Override
    public JobPostingDto toDto(JobPosting j) {
        if ( j == null ) {
            return null;
        }

        Long id = null;
        String jobUrl = null;
        String positionName = null;
        String organizationUrl = null;
        String logoUrl = null;
        String organizationTitle = null;
        String laborFunction = null;
        Long postedDateEpoch = null;
        String descriptionHtml = null;
        Instant createdAt = null;
        List<LocationDto> locations = null;
        List<TagDto> tags = null;

        id = j.getId();
        jobUrl = j.getJobUrl();
        positionName = j.getPositionName();
        organizationUrl = j.getOrganizationUrl();
        logoUrl = j.getLogoUrl();
        organizationTitle = j.getOrganizationTitle();
        laborFunction = j.getLaborFunction();
        postedDateEpoch = j.getPostedDateEpoch();
        descriptionHtml = j.getDescriptionHtml();
        createdAt = j.getCreatedAt();
        locations = locationSetToLocationDtoList( j.getLocations() );
        tags = tagSetToTagDtoList( j.getTags() );

        JobPostingDto jobPostingDto = new JobPostingDto( id, jobUrl, positionName, organizationUrl, logoUrl, organizationTitle, laborFunction, postedDateEpoch, descriptionHtml, createdAt, locations, tags );

        return jobPostingDto;
    }

    @Override
    public LocationDto toDto(Location l) {
        if ( l == null ) {
            return null;
        }

        Long id = null;
        String city = null;
        String stateRegion = null;
        String country = null;
        String raw = null;

        id = l.getId();
        city = l.getCity();
        stateRegion = l.getStateRegion();
        country = l.getCountry();
        raw = l.getRaw();

        LocationDto locationDto = new LocationDto( id, city, stateRegion, country, raw );

        return locationDto;
    }

    @Override
    public TagDto toDto(Tag t) {
        if ( t == null ) {
            return null;
        }

        Long id = null;
        String name = null;

        id = t.getId();
        name = t.getName();

        TagDto tagDto = new TagDto( id, name );

        return tagDto;
    }

    protected List<LocationDto> locationSetToLocationDtoList(Set<Location> set) {
        if ( set == null ) {
            return null;
        }

        List<LocationDto> list = new ArrayList<LocationDto>( set.size() );
        for ( Location location : set ) {
            list.add( toDto( location ) );
        }

        return list;
    }

    protected List<TagDto> tagSetToTagDtoList(Set<Tag> set) {
        if ( set == null ) {
            return null;
        }

        List<TagDto> list = new ArrayList<TagDto>( set.size() );
        for ( Tag tag : set ) {
            list.add( toDto( tag ) );
        }

        return list;
    }
}
