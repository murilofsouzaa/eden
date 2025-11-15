package com.moutfit.controllers;

import com.moutfit.dto.product.ProductResponseDTO;
import com.moutfit.models.Product;
import com.moutfit.repository.ProductRepository;
import com.moutfit.services.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/products")
public class ProductController {

    ProductService productService;
    ProductRepository productRepository;

    public ProductController(ProductService productService, ProductRepository productRepository) {
        this.productService = productService;
        this.productRepository = productRepository;
    }

    @GetMapping(name = "/{id}")
    public Integer getProductById(@PathVariable Integer id){
        return productService.getProductById(id).getId();
    }

    @PostMapping(name = "/{id}")
    public void updateProduct(@PathVariable Integer id){
        productService.updateProduct(id);
    }

}

