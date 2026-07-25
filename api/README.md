# T-Store API

Spring Boot REST API backend for the T-Store e-commerce application.

## Tech Stack

| Layer       | Technology                   |
|-------------|------------------------------|
| Framework   | Spring Boot 3.3.x            |
| Language    | Java 21                      |
| Security    | Spring Security + JWT (JJWT) |
| Database    | PostgreSQL                   |
| ORM         | Spring Data JPA / Hibernate  |
| Build tool  | Maven (Maven Wrapper)        |
| Testing     | JUnit 5 + H2 (in-memory)     |

## Project Structure

```
api/
├── src/
│   ├── main/
│   │   ├── java/com/tstore/api/
│   │   │   ├── TStoreApiApplication.java   # Entry point
│   │   │   ├── config/                     # Security, CORS, beans
│   │   │   ├── controller/                 # REST controllers
│   │   │   ├── dto/                        # Request / response DTOs
│   │   │   ├── exception/                  # Custom exceptions & handler
│   │   │   ├── model/                      # JPA entities
│   │   │   ├── repository/                 # Spring Data repositories
│   │   │   └── service/                    # Business logic
│   │   └── resources/
│   │       └── application.properties
│   └── test/
│       ├── java/com/tstore/api/
│       └── resources/
│           └── application-test.properties
└── pom.xml
```

## Getting Started

### Prerequisites

- Java 21+
- PostgreSQL 14+
- Maven 3.9+ (or use the included wrapper `./mvnw`)

### 1. Configure the database

Create a PostgreSQL database:

```sql
CREATE DATABASE tstore;
```

Update credentials in `src/main/resources/application.properties` if needed.

### 2. Run the application

```bash
./mvnw spring-boot:run
```

The API will start on **http://localhost:8080**.

### 3. Health check

```
GET http://localhost:8080/api/v1/health
```

## API Base URL

```
http://localhost:8080/api/v1
```

## Running Tests

```bash
./mvnw test
```

Tests use an H2 in-memory database — no PostgreSQL required.
