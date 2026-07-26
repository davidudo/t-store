# T-Store API

This directory is a **Spring Boot 3.3.5** backend REST API for the **T-Store** e-commerce application, written in **Java 21** with **Maven**.

## Tech stack

| Concern       | Choice                                                           |
|---------------|------------------------------------------------------------------|
| **Framework** | Spring Boot 3.3.5 (`spring-boot-starter-web`)                    |
| **Database**  | Neo4j (graph DB) via Spring Data Neo4j, with an **embedded mode** for zero-setup local dev (no Docker required) |
| **Auth**      | Spring Security + JWT (jjwt 0.12.6)                               |
| **Build**     | Maven (includes `mvnw` wrapper)                                   |
| **Dev tools** | Lombok, DevTools (auto-restart), Actuator (health/info endpoints) |

## Project layout

```
api/
├── pom.xml                                          # Maven config (dependencies, plugins)
├── mvnw / .mvn/                                     # Maven wrapper (no global install needed)
├── src/main/java/com/tstore/api/
│   ├── TStoreApiApplication.java                    # Entry point (@SpringBootApplication)
│   ├── config/
│   │   ├── SecurityConfig.java                      # Spring Security + JWT config
│   │   └── EmbeddedNeo4jConfig.java                 # Embedded Neo4j setup
│   ├── shared/
│   │   ├── dto/ApiResponse.java                     # Standard API response wrapper
│   │   └── exception/                               # Global exception handling
│   ├── features/
│   │   ├── health/HealthController.java             # Health check endpoint
│   │   ├── auth/                                    # Auth feature (placeholder)
│   │   ├── product/                                 # Product feature (placeholder)
│   │   ├── category/                                # Category feature (placeholder)
│   │   ├── cart/                                    # Cart feature (placeholder)
│   │   ├── order/                                   # Order feature (placeholder)
│   │   └── user/                                    # User feature (placeholder)
│   └── resources/
│       └── application.properties                   # All config (server, DB, JWT, logging)
└── src/test/                                        # Tests
```

## Running the API

```bash
cd api
./mvnw spring-boot:run
```

The server starts on `http://localhost:8080`. Neo4j runs in embedded mode by default — no external database server needed.

## Configuration (`application.properties`)

- **Server port:** `8080`
- **Neo4j:** Embedded by default (`app.neo4j.embedded.enabled=true`). Switch to `false` and configure `spring.neo4j.*` for a standalone/cloud Neo4j instance.
- **JWT:** Secret key + 24-hour expiration (`app.jwt.secret`, `app.jwt.expiration-ms`)
- **Actuator:** Exposes `health` and `info` endpoints only.
