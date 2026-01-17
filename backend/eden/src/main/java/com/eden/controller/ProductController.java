package com.eden.controller;

import com.eden.dto.product.CreateProductRequest;
import com.eden.dto.product.ProductResponse;
import com.eden.dto.product.UpdateProductRequest;
import com.eden.model.order.OrderStatus;
import com.eden.model.product.Product;
import com.eden.model.product.ProductCategories;
import com.eden.model.product.ProductGender;
import com.eden.service.product.ProductService;
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
    //TODO add pagination
    @GetMapping
    public ResponseEntity<List<ProductResponse>> getAllProducts(){
        return ResponseEntity.ok(productService.getAllProducts());
    }

    //TODO add pagination
    @GetMapping("/available")
    public ResponseEntity<List<ProductResponse>> getAllAvailableProducts(){
       return ResponseEntity.ok(productService.getAllAvailableProducts());
    }

    @GetMapping("/category/{category}")
    public ResponseEntity<List<ProductResponse>> getAllProductsByCategory(@PathVariable String category){
        ProductCategories enumCategory = ProductCategories.valueOf(category.toUpperCase());
        return ResponseEntity.ok(productService.getAllProductsByCategory(enumCategory));
    }

    @GetMapping("/gender/{gender}")
    public ResponseEntity<List<ProductResponse>> getAllProductsByGender(@PathVariable String gender){
        ProductGender enumGender = ProductGender.valueOf(gender.toUpperCase());
        return ResponseEntity.ok(productService.getAllProductsByGender(enumGender));
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

    @GetMapping("/best-sellers")
    public ResponseEntity<List<ProductResponse>> getBestSellers(
        @RequestParam(defaultValue = "DELIVERED") OrderStatus status){
        return ResponseEntity.ok(productService.getBestSellers(status));
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
