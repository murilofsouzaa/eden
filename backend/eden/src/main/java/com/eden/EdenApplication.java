package com.eden;

import java.nio.file.Path;

import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class EdenApplication {

	public static void main(String[] args) {
		SpringApplication.run(EdenApplication.class, args);
	}


	//Testando o user.dir e o path
	@Bean
	public ApplicationRunner runner(){
		return args ->{
			 Path baseDir = Path.of(System.getProperty("user.dir"))
                   .getParent()
                   .getParent();

			Path clothesDir = baseDir.resolve("frontend")
                         .resolve("public")
                         .resolve("clothes");

			System.out.println(baseDir);
			System.out.println(clothesDir);
			 
		};
	}

}
