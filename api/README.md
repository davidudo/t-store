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

---

## Architecture — Feature-Based

The API follows a **feature-based (vertical slice) architecture**.
Instead of grouping code by technical layer (`controller/`, `service/`, etc.),
all code related to a feature lives together in one package.

```
features/
  <feature>/
    <Feature>Controller.java   ← REST endpoints
    <Feature>Service.java      ← Business logic
    <Feature>Repository.java   ← Data access (Spring Data)
    <Feature>Entity.java       ← JPA entity / domain model
    dto/
      <Feature>Request.java    ← Incoming request body
      <Feature>Response.java   ← Outgoing response body
    exception/
      <Feature>Exception.java  ← Feature-specific exceptions (optional)
```

> Each feature is self-contained. You can open a single folder and find
> everything you need — no jumping between `controller/`, `service/`, and
> `repository/` directories.

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
    │   │       │   ├── UserEntity.java
    │   │       │   ├── UserRepository.java
    │   │       │   └── dto/
    │   │       │       ├── RegisterRequest.java
    │   │       │       ├── LoginRequest.java
    │   │       │       └── AuthResponse.java
    │   │       │
    │   │       ├── product/                   ← Product catalogue
    │   │       │   ├── ProductController.java
    │   │       │   ├── ProductService.java
    │   │       │   ├── ProductEntity.java
    │   │       │   ├── ProductRepository.java
    │   │       │   └── dto/
    │   │       │       ├── ProductRequest.java
    │   │       │       └── ProductResponse.java
    │   │       │
    │   │       ├── category/                  ← Product categories & subcategories
    │   │       │   ├── CategoryController.java
    │   │       │   ├── CategoryService.java
    │   │       │   ├── CategoryEntity.java
    │   │       │   ├── CategoryRepository.java
    │   │       │   └── dto/
    │   │       │       ├── CategoryRequest.java
    │   │       │       └── CategoryResponse.java
    │   │       │
    │   │       ├── cart/                      ← Shopping cart (per-user)
    │   │       │   ├── CartController.java
    │   │       │   ├── CartService.java
    │   │       │   ├── CartEntity.java
    │   │       │   ├── CartRepository.java
    │   │       │   └── dto/
    │   │       │       ├── CartRequest.java
    │   │       │       └── CartResponse.java
    │   │       │
    │   │       ├── order/                     ← Order placement & history
    │   │       │   ├── OrderController.java
    │   │       │   ├── OrderService.java
    │   │       │   ├── OrderEntity.java
    │   │       │   ├── OrderRepository.java
    │   │       │   └── dto/
    │   │       │       ├── OrderRequest.java
    │   │       │       └── OrderResponse.java
    │   │       │
    │   │       └── user/                      ← User profile & settings
    │   │           ├── UserController.java
    │   │           ├── UserService.java
    │   │           ├── UserProfileRepository.java
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
| JPA entity             | `features/<feature>/<Feature>Entity.java`     |
| Spring Data repository | `features/<feature>/<Feature>Repository.java` |
| Request / response DTO | `features/<feature>/dto/`                     |
| Feature-specific error | `features/<feature>/exception/` (optional)    |
| Global config (beans)  | `config/`                                     |
| Shared utilities / DTOs| `shared/`                                     |

---

## Getting Started

### Prerequisites

- Java 21+
- PostgreSQL 14+

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
