# T-Store API

Spring Boot REST API backend for the T-Store e-commerce application.

## Tech Stack

| Layer       | Technology                    |
|-------------|-------------------------------|
| Framework   | Spring Boot 3.3.x             |
| Language    | Java 21                       |
| Security    | Spring Security + JWT (JJWT)  |
| Database    | Neo4j (graph database)        |
| ORM         | Spring Data Neo4j             |
| Build tool  | Maven (Maven Wrapper)         |
| Testing     | JUnit 5 + Neo4j Test Harness  |

---

## Architecture — Feature-Based

The API follows a **feature-based (vertical slice) architecture**.
Instead of grouping code by technical layer (`controller/`, `service/`, etc.),
all code related to a feature lives together in one package.

```
features/
  <feature>/
    <Feature>Controller.java      ← REST endpoints
    <Feature>Service.java         ← Business logic
    <Feature>Repository.java      ← Spring Data Neo4j repository
    <Feature>Node.java            ← @Node (graph node / domain model)
    dto/
      <Feature>Request.java       ← Incoming request body
      <Feature>Response.java      ← Outgoing response body
    exception/
      <Feature>Exception.java     ← Feature-specific exceptions (optional)
```

> **Graph modelling note**: domain types are annotated with `@Node` (instead
> of `@Entity`) and relationships are expressed using `@Relationship`.
> Spring Data Neo4j repositories extend `Neo4jRepository<T, ID>` instead of
> `JpaRepository`.

---

## Project Structure

```
api/
├── mvnw                                       ← Maven wrapper (no local Maven needed)
├── pom.xml
├── README.md
└── src/
    ├── main/
    │   ├── java/com/tstore/api/
    │   │   ├── TStoreApiApplication.java      ← Entry point
    │   │   │
    │   │   ├── config/                        ← App-wide configuration beans
    │   │   │   └── SecurityConfig.java        ← JWT + Spring Security setup
    │   │   │
    │   │   ├── shared/                        ← Code shared across all features
    │   │   │   ├── dto/
    │   │   │   │   └── ApiResponse.java       ← Generic typed response wrapper
    │   │   │   └── exception/
    │   │   │       ├── ApiError.java          ← Error response payload
    │   │   │       ├── GlobalExceptionHandler.java
    │   │   │       └── ResourceNotFoundException.java
    │   │   │
    │   │   └── features/                      ← One folder per feature ★
    │   │       │
    │   │       ├── health/
    │   │       │   └── HealthController.java
    │   │       │
    │   │       ├── auth/                      ← Registration, login, JWT issuance
    │   │       │   ├── AuthController.java
    │   │       │   ├── AuthService.java
    │   │       │   ├── UserNode.java              ← @Node
    │   │       │   ├── UserRepository.java        ← Neo4jRepository
    │   │       │   └── dto/
    │   │       │       ├── RegisterRequest.java
    │   │       │       ├── LoginRequest.java
    │   │       │       └── AuthResponse.java
    │   │       │
    │   │       ├── product/                   ← Product catalogue
    │   │       │   ├── ProductController.java
    │   │       │   ├── ProductService.java
    │   │       │   ├── ProductNode.java            ← @Node
    │   │       │   ├── ProductRepository.java      ← Neo4jRepository
    │   │       │   └── dto/
    │   │       │       ├── ProductRequest.java
    │   │       │       └── ProductResponse.java
    │   │       │
    │   │       ├── category/                  ← Product categories & subcategories
    │   │       │   ├── CategoryController.java
    │   │       │   ├── CategoryService.java
    │   │       │   ├── CategoryNode.java           ← @Node
    │   │       │   ├── CategoryRepository.java     ← Neo4jRepository
    │   │       │   └── dto/
    │   │       │       ├── CategoryRequest.java
    │   │       │       └── CategoryResponse.java
    │   │       │
    │   │       ├── cart/                      ← Shopping cart (per-user)
    │   │       │   ├── CartController.java
    │   │       │   ├── CartService.java
    │   │       │   ├── CartNode.java               ← @Node
    │   │       │   ├── CartRepository.java         ← Neo4jRepository
    │   │       │   └── dto/
    │   │       │       ├── CartRequest.java
    │   │       │       └── CartResponse.java
    │   │       │
    │   │       ├── order/                     ← Order placement & history
    │   │       │   ├── OrderController.java
    │   │       │   ├── OrderService.java
    │   │       │   ├── OrderNode.java              ← @Node
    │   │       │   ├── OrderRepository.java        ← Neo4jRepository
    │   │       │   └── dto/
    │   │       │       ├── OrderRequest.java
    │   │       │       └── OrderResponse.java
    │   │       │
    │   │       └── user/                      ← User profile & settings
    │   │           ├── UserController.java
    │   │           ├── UserService.java
    │   │           ├── UserProfileRepository.java  ← Neo4jRepository
    │   │           └── dto/
    │   │               ├── UserProfileRequest.java
    │   │               └── UserProfileResponse.java
    │   │
    │   └── resources/
    │       └── application.properties
    │
    └── test/
        ├── java/com/tstore/api/
        └── resources/
            └── application-test.properties    ← H2 in-memory DB for tests
```

---

## What Goes Where

| Code type              | Location                                      |
|------------------------|-----------------------------------------------|
| REST controller        | `features/<feature>/<Feature>Controller.java` |
| Business logic         | `features/<feature>/<Feature>Service.java`    |
| Graph node (domain)    | `features/<feature>/<Feature>Node.java`       |
| Neo4j repository       | `features/<feature>/<Feature>Repository.java` |
| Request / response DTO | `features/<feature>/dto/`                     |
| Feature-specific error | `features/<feature>/exception/` (optional)    |
| Global config (beans)  | `config/`                                     |
| Shared utilities / DTOs| `shared/`                                     |

---

## Getting Started

### Prerequisites

- Java 21+
- Neo4j 5+ (Community or Enterprise)

### 1. Start Neo4j

The quickest way is via Docker:

```bash
docker run \
  --name tstore-neo4j \
  -p 7474:7474 -p 7687:7687 \
  -e NEO4J_AUTH=neo4j/password \
  neo4j:5
```

Or install Neo4j Desktop from https://neo4j.com/download/

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

Tests use the **Neo4j Test Harness** (embedded Neo4j) — no running Neo4j
instance is needed during testing.
