package com.eden.config;

import com.eden.models.UserModel;
import com.eden.repository.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Profile({"dev"})
@Configuration
public class DataSeeder {

    @Bean
    public CommandLineRunner initDatabase(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        return args -> {
            if (userRepository.count() == 0) {
                UserModel admin = new UserModel();
                admin.setName("admin");
                admin.setEmail("admin@eden.com");
                admin.setPassword(passwordEncoder.encode("123"));
                admin.setRole("ROLE_ADMIN");
                admin.setPhone("1199999999");
                admin.setAddress("Rua Teste");
                admin.setCity("Teste City");
                admin.setState("TS");
                admin.setZip("00000-000");
                admin.setCountry("Brasil");

                userRepository.save(admin);
                System.out.println("Usuário ADMIN criado automaticamente: user: admin / pass: 123");
            }
        };
    }
}