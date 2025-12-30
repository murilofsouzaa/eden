package com.eden.controller;

import com.eden.dto.product.CreateProductRequest;
import com.eden.dto.product.ProductResponse;
import com.eden.model.product.Product;
import com.eden.model.product.ProductCategories;
import com.eden.service.ProductService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/products")
public class ProductController {

    private ProductService productService;

    public ProductController(ProductService productService){
        this.productService = productService;
    }

    @GetMapping("/all")
    public ResponseEntity<List<ProductResponse>> getAllProducts(){
        return ResponseEntity.ok(productService.getAllProducts());
    }

    @GetMapping("/all/available")
    public ResponseEntity<List<ProductResponse>> getAllAvailableProducts(){
       return ResponseEntity.ok(productService.getAllAvailableProducts());
    }

    @GetMapping("/all/category/{category}")
    public ResponseEntity<List<ProductResponse>> getAllProductsByCategory(@PathVariable String category){
        ProductCategories enumCategory = ProductCategories.valueOf(category.toUpperCase());
        return ResponseEntity.ok(productService.getAllProductsByCategory(enumCategory));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ProductResponse> getProductById(@PathVariable Long id){
        return ResponseEntity.ok(productService.getProductById(id));
    }

    @PostMapping
    public ResponseEntity<ProductResponse> createProduct(@RequestBody CreateProductRequest productRequest){
        return ResponseEntity.ok(productService.createProduct(productRequest));
    }

}
