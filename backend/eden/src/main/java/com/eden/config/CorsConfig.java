package com.eden.config;

import java.nio.file.Path;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class CorsConfig implements WebMvcConfigurer {

    //CorsRegistry é um "gerenciador" das regras do CORS GLOBALMENTE
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("http://localhost:5175", "http://localhost:5173", "http://localhost:5174")
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                .allowedHeaders("*")
                .allowCredentials(true);
    }

    //O spring só conhece arquivos estáticos dentro de resources/public ou resources/assets, como as imagens estao dentro
    //de frontend/public/assets, o spring não faz ideia desses arquivos 
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry resourceRegistry) {
        Path clothesDir = Path.of(System.getProperty("user.dir"), "frontend", "public", "clothes");

        //Path é classe que representa um arquivo ou um diretório no sistema
        //em vez de usar string como "/home/murilo/project/file.txt"
        //usamos "Path path = Path.of("/home/murilo/project/file.txt")"

        //Path.of constrói um caminho seguro e estruturado. Exemplo no windows o caminho é separado por \ e no linux /

        //System.getProperty("user.dir") pega a pasta raíz de onde a aplicação está rodando
        //No final fica algo assim (/home/murilo/Documents/eden/)frontend/public/clothes

        String clothesLocation = clothesDir.toUri().toString();

        //Tranforma em URI: file:///home/murilo/project/frontend/public/clothes/
        // pois se fosse "/home/murilo/frontend/public/clothes" o spring espera algo com exemplo file:/// (file, classpath, etc)
        if (!clothesLocation.endsWith("/")) {
            clothesLocation = clothesLocation + "/";
        }

        //Aqui força o final ter barra, pois se for file:///home/murilo/clothes X
        //file:///home/murilo/clothes/ Correto

        resourceRegistry.addResourceHandler("/clothes/**") //Aqui está dizendo: qualquer coisa que vier depois de /clothes/
                .addResourceLocations(clothesLocation); //vá nesse caminho
    }
}