package com.example.techstarsscraper.domain;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.Instant;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "job_posting")
@Getter @Setter
@ToString(onlyExplicitlyIncluded = true)
public class JobPosting {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true, length = 1024)
    @ToString.Include
    private String jobUrl;

    private String positionName;

    @Column(length = 1024)
    private String organizationUrl;

    @Column(length = 1024)
    private String logoUrl;

    private String organizationTitle;

    private String laborFunction;

    private Long postedDateEpoch;


    @Column(columnDefinition = "text")
    private String descriptionHtml;

    private Instant createdAt = Instant.now();

    @OneToMany(mappedBy = "jobPosting", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonManagedReference("job-locations")
    private Set<Location> locations = new LinkedHashSet<>();

    @OneToMany(mappedBy = "jobPosting", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonManagedReference("job-tags")
    private Set<Tag> tags = new LinkedHashSet<>();


    public void addLocation(Location l) {
        if (l == null) return;
        l.setJobPosting(this);
        locations.add(l);
    }

    public void addTag(Tag t) {
        if (t == null) return;
        t.setJobPosting(this);
        tags.add(t);
    }
}
