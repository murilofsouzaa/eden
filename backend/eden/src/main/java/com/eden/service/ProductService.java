package com.eden.service;

import com.eden.dto.product.CreateProductRequest;
import com.eden.dto.product.ProductResponse;
import com.eden.model.product.Product;
import com.eden.model.product.ProductCategories;
import com.eden.model.product.ProductStatus;
import com.eden.repository.ProductRepository;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
public class ProductService {

    ProductRepository productRepository;

    public ProductService(ProductRepository productRepository){
        this.productRepository = productRepository;
    }

    public ProductResponse createProduct(CreateProductRequest createProductRequest){
        Product product = new Product();
        product.setTitle(createProductRequest.title());
        product.setDescription(createProductRequest.description());
        product.setPrice(createProductRequest.price());
        product.setStock(createProductRequest.stock());
        product.setCreatedAt(createProductRequest.createdAt());
        product.setImgURL(createProductRequest.imgURL());

        productRepository.save(product);

        return new ProductResponse(
                product.getId(),
                product.getTitle(),
                product.getDescription(),
                product.getCreatedAt()
        );
    }

    public Product getProductById(Long id){
        return productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found!"));
    }

    public List<Product> getAllProducts(){
        return productRepository.findAll();
    }

    public List<Product> getAllAvailableProducts(){
        return productRepository.findByStatus(ProductStatus.AVAILABLE);
    }

    public List<Product> getAllProductsByCategory(ProductCategories category){
        return productRepository.findByCategory(category);
    }

    public List<Product> getAllProductsBetweenPrice(BigDecimal minPrice, BigDecimal maxPrice){
        return productRepository.findByPriceBetween(minPrice, maxPrice);
    }

    public List<Product> getAllProductsByTextPart(String part){
       return productRepository.findByTitleContainingIgnoreCase(part);
    }

}

