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
        Path baseDir = Path.of(System.getProperty("user.dir"))
                   .getParent()
                   .getParent();

        Path publicDir = baseDir.resolve("frontend")
                         .resolve("public");

        registerStaticDirectory(resourceRegistry, "/clothes/**", publicDir.resolve("clothes"));
        registerStaticDirectory(resourceRegistry, "/acessories/**", publicDir.resolve("acessories"));
    }

    private void registerStaticDirectory(ResourceHandlerRegistry resourceRegistry, String handlerPattern, Path directory) {
        String location = directory.toUri().toString();

        //Path é classe que representa um arquivo ou um diretório no sistema
        //em vez de usar string como "/home/murilo/project/file.txt"
        //usamos "Path path = Path.of("/home/murilo/project/file.txt")"

        //Path.of constrói um caminho seguro e estruturado. Exemplo no windows o caminho é separado por \ e no linux /

        //Tranforma em URI: file:///home/murilo/project/frontend/public/clothes/
        // pois se fosse "/home/murilo/frontend/public/clothes" o spring espera algo com exemplo file:/// (file, classpath, etc)
        if (!location.endsWith("/")) {
            location = location + "/";
        }

        resourceRegistry.addResourceHandler(handlerPattern)
                .addResourceLocations(location);
    }
}