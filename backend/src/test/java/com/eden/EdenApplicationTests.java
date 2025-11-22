package com.eden;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;

@SpringBootTest
@TestPropertySource(properties = {
        // 1. Variáveis Gerais Resolvidas
        "APP_NAME=eden-test",
        "spring.application.name=eden-test",

        // 2. Sobrescrever o DataSource para H2 em memória (Evita o problema do placeholder DB_URL)
        "spring.datasource.url=jdbc:h2:mem:testdb",
        "spring.datasource.username=sa",
        "spring.datasource.password=",

        // 3. Sobrescrever o Driver Class (Resolve o erro do PostgreSQL driver)
        "spring.datasource.driver-class-name=org.h2.Driver",

        // 4. Sobrescrever Dialeto e DDL para H2
        "spring.jpa.database-platform=org.hibernate.dialect.H2Dialect",
        "spring.jpa.hibernate.ddl-auto=create-drop"
})
class EdenApplicationTests {

    @Test
    void contextLoads() {
    }
}