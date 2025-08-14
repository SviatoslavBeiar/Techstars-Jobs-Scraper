# Techstars Jobs Scraper

Spring Boot app that scrapes job postings from jobs.techstars.com by **Job function**, stores them in PostgreSQL via JPA, and exports results to a SQL dump.

## Features
- Filter by *Job function* (e.g., **Software Engineering**)
- Fetches details: position, organization, logo URL, function, locations, posted date (epoch), HTML description, tags
- Multithreaded detail fetching
- REST endpoints (`/api/jobs`, `/api/jobs/scrape`)
- SQL dump with schema + data
- Docker Compose db, selenium, app

By default the app auto-runs a scrape for `Software Engineering` and writes an SQL dump to `data/software-engineering-dump.sql`.

See **INSTALL.md** for full setup and configuration.
