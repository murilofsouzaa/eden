package com.moutfit.controllers;

import com.moutfit.dto.product.ProductRequestDTO;
import com.moutfit.dto.product.ProductResponseDTO;
import com.moutfit.models.Product;
import com.moutfit.repository.ProductRepository;
import com.moutfit.services.ProductService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/products")
public class ProductController {

    ProductService productService;
    ProductRepository productRepository;

    public ProductController(ProductService productService, ProductRepository productRepository) {
        this.productService = productService;
        this.productRepository = productRepository;
    }

    @GetMapping("/{id}")
    public ProductResponseDTO getProductById(@PathVariable Integer id){
        return productService.getProductById(id);
    }

    @PostMapping
    public ResponseEntity<ProductResponseDTO> createProduct(@RequestBody ProductRequestDTO productRequestDTO){
        ProductResponseDTO productResponseDTO = productService.add(productRequestDTO);
        return ResponseEntity.ok(productResponseDTO);
    }

    @PutMapping("/{id}")
    public void updateProduct(@PathVariable Integer id){
        productService.updateById(id);
    }

    @DeleteMapping("/{id}")
    public void deleteProduct(@PathVariable Integer id){
        productRepository.deleteById(id);
    }

}

