package com.eden.controller;

import com.eden.dto.product.CreateProductRequest;
import com.eden.dto.product.ProductResponse;
import com.eden.dto.product.UpdateProductRequest;
import com.eden.model.product.Product;
import com.eden.model.product.ProductCategories;
import com.eden.service.ProductService;
import com.eden.service.UserService;
import jakarta.persistence.Entity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;

@RestController
@RequestMapping("/products")
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService){
        this.productService = productService;
    }

    @GetMapping("/all")
    public ResponseEntity<List<ProductResponse>> getAllProducts(){
        return ResponseEntity.ok(productService.getAllProducts());
    }

    @GetMapping("/available")
    public ResponseEntity<List<ProductResponse>> getAllAvailableProducts(){
       return ResponseEntity.ok(productService.getAllAvailableProducts());
    }

    @GetMapping("/category/{category}")
    public ResponseEntity<List<ProductResponse>> getAllProductsByCategory(@PathVariable String category){
        ProductCategories enumCategory = ProductCategories.valueOf(category.toUpperCase());
        return ResponseEntity.ok(productService.getAllProductsByCategory(enumCategory));
    }


    @GetMapping("/{id}")
    public ResponseEntity<ProductResponse> getProductById(@PathVariable Long id){
        return ResponseEntity.ok(productService.getProductById(id));
    }

    @GetMapping("/filter/price")
    public ResponseEntity<List<ProductResponse>> getAllProductsBetweenPrice(
            @RequestParam(required = false) BigDecimal minPrice,
            @RequestParam(required = false) BigDecimal maxPrice){
        return ResponseEntity.ok(productService.getAllProductsBetweenPrice(minPrice, maxPrice));
    }

    @GetMapping("/filter/{part}")
    public ResponseEntity<List<ProductResponse>> getAllProductsByTextPart(@PathVariable String part){
        return ResponseEntity.ok(productService.getAllProductsByTextPart(part));
    }

    @PostMapping
    public ResponseEntity<ProductResponse> createProduct(@RequestBody CreateProductRequest productRequest){
        return ResponseEntity.ok(productService.createProduct(productRequest));
    }

    @PutMapping("/{id}")
    public ResponseEntity<ProductResponse> updateProduct(Long id, @RequestBody UpdateProductRequest updateProductRequest){
        return ResponseEntity.ok(productService.updateProduct(id, updateProductRequest));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<ProductResponse> deleteProduct (@PathVariable Long id){
        return ResponseEntity.ok(productService.deleteProduct(id));
    }

}
