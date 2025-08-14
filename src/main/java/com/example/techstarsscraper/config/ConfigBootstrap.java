package com.example.techstarsscraper.config;

import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableConfigurationProperties(ScraperProperties.class)
public class ConfigBootstrap {}
