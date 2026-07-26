package com.tstore.api.config;

import org.neo4j.driver.Driver;
import org.neo4j.driver.GraphDatabase;
import org.neo4j.harness.Neo4j;
import org.neo4j.harness.Neo4jBuilders;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.io.File;

@Configuration
@ConditionalOnProperty(name = "app.neo4j.embedded.enabled", havingValue = "true", matchIfMissing = true)
public class EmbeddedNeo4jConfig {

    @Bean(destroyMethod = "close")
    public Neo4j embeddedNeo4jServer() {
        File dataDir = new File("data/neo4j");
        return Neo4jBuilders.newInProcessBuilder()
                .withWorkingDir(dataDir.toPath())
                .build();
    }

    @Bean
    public Driver neo4jDriver(Neo4j neo4jServer) {
        return GraphDatabase.driver(neo4jServer.boltURI());
    }
}
