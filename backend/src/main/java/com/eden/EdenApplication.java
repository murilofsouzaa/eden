package com.eden;

import io.github.cdimascio.dotenv.Dotenv;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class EdenApplication {

    public static void main(String[] args) {

        Dotenv dotenv = Dotenv.configure()
                .directory("./backend")
                .load();
        System.setProperty("APP_NAME", dotenv.get("APP_NAME"));
        System.setProperty("DB_URL", dotenv.get("DB_URL"));
        System.setProperty("DB_USERNAME", dotenv.get("DB_USERNAME"));
        System.setProperty("DB_PASSWORD", dotenv.get("DB_PASSWORD"));
        System.setProperty("SC_USERNAME", dotenv.get("SC_USERNAME"));
        System.setProperty("SC_PASSWORD", dotenv.get("SC_PASSWORD"));

        SpringApplication.run(EdenApplication.class, args);
    }
}
