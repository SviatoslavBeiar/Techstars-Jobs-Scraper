package com.example.techstarsscraper.repo;

import com.example.techstarsscraper.domain.Location;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LocationRepository extends JpaRepository<Location, Long> {}
