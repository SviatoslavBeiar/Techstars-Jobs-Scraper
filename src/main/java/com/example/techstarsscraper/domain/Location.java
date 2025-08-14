package com.example.techstarsscraper.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "location")
@Getter @Setter
@ToString(onlyExplicitlyIncluded = true)
public class Location {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    @Column(length = 255)
    private String city;

    @Column(name = "state_region", length = 255)
    private String stateRegion;

    @Column(length = 255)
    private String country;


    @Lob
    @Column(columnDefinition = "text")
    private String raw;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "job_posting_id")
    private JobPosting jobPosting;
}
