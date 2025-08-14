# Build stage
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn -q -e -DskipTests dependency:go-offline
COPY src src
RUN mvn -q -DskipTests package spring-boot:repackage


# Run stage
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=build /app/target/techstars-scraper-0.1.0.jar app.jar
ENV DB_URL=jdbc:postgresql://db:5432/techstars
ENV DB_USER=postgres
ENV DB_PASSWORD=postgres
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
