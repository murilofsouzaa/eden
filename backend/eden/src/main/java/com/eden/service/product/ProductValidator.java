package com.eden.service.product;

import com.eden.dto.product.CreateProductRequest;
import com.eden.repository.ProductRepository;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;

@Component
public class ProductValidator {
    
    private final ProductRepository productRepository;
    
    public ProductValidator(ProductRepository productRepository){
        this.productRepository = productRepository;
    }

    public void validate(CreateProductRequest request) {
        if (request.price() == null || request.price().compareTo(BigDecimal.ZERO) <= 0) {
            throw new IllegalArgumentException("Price must be greater than zero");
        }
        if (request.stock() < 0) {
            throw new IllegalArgumentException("Stock cannot be negative");
        }
        if (request.title() == null || request.title().isBlank()) {
            throw new IllegalArgumentException("Title is required");
        }
    }

    public void validateIfProductExists(Long productId){
        if(!productRepository.existsById(productId)){
            throw new RuntimeException("Product not found!");
        }
    }


}
