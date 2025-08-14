# Install & Run

## Prerequisites
- Java 17+
- Maven 3.9+
- Docker (for Postgres) or an existing PostgreSQL instance
- Chrome installed (Selenium uses chromedriver)

## 1) run 3 services with docker (Database, app, selenium)
```bash
cp .env.example .env
docker compose build app      # build the Spring Boot image (runs Maven inside)
docker compose up -d          # start all services
```
db – PostgreSQL 16 on 5432

selenium – Chrome (Selenium Grid standalone) on 4444 (internal)

app – Spring Boot API on 8080


## 2) Build
```bash
./mvnw -q -DskipTests package
```

## 3) Run
```bash
java -jar target/techstars-scraper-0.1.0.jar
```
The scraper will auto-run and export an SQL dump to `data/software-engineering-dump.sql`.

### Configuration (application.yml)
- `scraper.functions`: list of job functions to scrape
- `scraper.use-selenium`: enable Selenium list-page rendering
- `scraper.headless`: run headless Chrome
- `scraper.max-threads`: threads for detail pages
- `scraper.sql-dump-path`: SQL export path

### Environment variables
- `DB_URL` (default: `jdbc:postgresql://localhost:5432/techstars`)
- `DB_USER` (default: `postgres`)
- `DB_PASSWORD` (default: `postgres`)

## 4) REST API
- `GET /api/jobs` – list stored jobs
- `POST /api/jobs/scrape` – trigger a new scrape

## 5) SQL dump
The app generates a portable SQL file that includes table creation DDL and INSERTs. Import into Postgres with:
```bash
psql -h localhost -U postgres -d techstars -f data/software-engineering-dump.sql
```

> **Note:** Selector paths can drift as the website evolves. If scraping stops working, update the CSS/XPath in `SeleniumListScraper` and `JobDetailScraper`.
