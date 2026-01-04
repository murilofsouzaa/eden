package com.eden.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.nio.file.Path;

@Configuration
public class CorsConfig implements WebMvcConfigurer {
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("http://localhost:5175", "http://localhost:5173", "http://localhost:5174")
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                .allowedHeaders("*")
                .allowCredentials(true);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        Path clothesDir = Path.of(System.getProperty("user.dir"), "frontend", "public", "clothes");
        String clothesLocation = clothesDir.toUri().toString();
        if (!clothesLocation.endsWith("/")) {
            clothesLocation = clothesLocation + "/";
        }

        registry.addResourceHandler("/clothes/**")
                .addResourceLocations(clothesLocation);
    }
}