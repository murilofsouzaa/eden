package com.eden.service;

import com.eden.dto.product.CreateProductRequest;
import com.eden.dto.product.ProductResponse;
import com.eden.dto.product.UpdateProductRequest;
import com.eden.model.product.Product;
import com.eden.model.product.ProductCategories;
import com.eden.model.product.ProductStatus;
import com.eden.repository.ProductRepository;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class ProductService {

    final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository){
        this.productRepository = productRepository;
    }

    public ProductResponse createProduct(CreateProductRequest createProductRequest){
        Product product = new Product();
        product.setTitle(createProductRequest.title());
        product.setDescription(createProductRequest.description());
        product.setPrice(createProductRequest.price());
        product.setStock(createProductRequest.stock());
        product.setCategory(createProductRequest.category());
        product.setStatus(createProductRequest.status());
        product.setCreatedAt(LocalDateTime.now());
        product.setImgURL(createProductRequest.imgURL());

        productRepository.save(product);

        return new ProductResponse(
                product.getId(),
                product.getTitle(),
                product.getDescription(),
                product.getPrice(),
                product.getStock(),
                product.getCategory(),
                product.getStatus(),
                product.getCreatedAt()
        );
    }

        public ProductResponse updateProduct(Long id, UpdateProductRequest updateProductRequest){
            Product updateProduct = productRepository.findById(id)
                    .orElseThrow(() -> new RuntimeException("Product not found!"));

            updateProduct.setTitle(updateProductRequest.title());
            updateProduct.setDescription(updateProductRequest.description());
            updateProduct.setPrice(updateProductRequest.price());
            updateProduct.setStock(updateProductRequest.stock());
            updateProduct.setCategory(updateProductRequest.category());
            updateProduct.setImgURL(updateProductRequest.imgURL());
            updateProduct.setStatus(updateProductRequest.status());
            updateProduct.setUpdatedAt(updateProductRequest.updatedAt());

            productRepository.save(updateProduct);

            return new ProductResponse(
                    updateProduct.getId(),
                    updateProduct.getTitle(),
                    updateProduct.getDescription(),
                    updateProduct.getPrice(),
                    updateProduct.getStock(),
                    updateProduct.getCategory(),
                    updateProduct.getStatus(),
                    updateProduct.getCreatedAt()
            );
    }

    public ProductResponse deleteProduct(Long id){
        Product product  = productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found!"));

        productRepository.delete(product);

        return new ProductResponse(
                product.getId(),
                product.getTitle(),
                product.getDescription(),
                product.getPrice(),
                product.getStock(),
                product.getCategory(),
                product.getStatus(),
                product.getCreatedAt()
        );

    }

    public ProductResponse getProductById(Long id){
        return productRepository.findById(id)
                .map(product -> new ProductResponse(
                        product.getId(),
                        product.getTitle(),
                        product.getDescription(),
                        product.getPrice(),
                        product.getStock(),
                        product.getCategory(),
                        product.getStatus(),
                        product.getCreatedAt()
                ))
                .orElseThrow(() -> new RuntimeException("Product not found!"));
    }

    public List<ProductResponse> getAllProducts() {
        return productRepository.findAll()
                .stream()
                .map(product -> new ProductResponse(
                        product.getId(),
                        product.getTitle(),
                        product.getDescription(),
                        product.getPrice(),
                        product.getStock(),
                        product.getCategory(),
                        product.getStatus(),
                        product.getCreatedAt()
                ))
                .toList();
    }

    public List<ProductResponse> getAllAvailableProducts(){
        return productRepository.findByStatus(ProductStatus.AVAILABLE)
                .stream()
                .map(product -> new ProductResponse(
                        product.getId(),
                        product.getTitle(),
                        product.getDescription(),
                        product.getPrice(),
                        product.getStock(),
                        product.getCategory(),
                        product.getStatus(),
                        product.getCreatedAt()
                )).toList();
    }

    public List<ProductResponse> getAllProductsByCategory(ProductCategories category){
        return productRepository.findByCategory(category)
                .stream()
                .map(product -> new ProductResponse(
                        product.getId(),
                        product.getTitle(),
                        product.getDescription(),
                        product.getPrice(),
                        product.getStock(),
                        product.getCategory(),
                        product.getStatus(),
                        product.getCreatedAt()
                )).toList();
    }

    public List<ProductResponse> getAllProductsBetweenPrice(BigDecimal minPrice, BigDecimal maxPrice){
        return productRepository.findByPriceBetween(minPrice, maxPrice)
                .stream()
                .map(product -> new ProductResponse(
                        product.getId(),
                        product.getTitle(),
                        product.getDescription(),
                        product.getPrice(),
                        product.getStock(),
                        product.getCategory(),
                        product.getStatus(),
                        product.getCreatedAt()
                )).toList();
    }

    public List<ProductResponse> getAllProductsByTextPart(String part){
       return productRepository.findByTitleContainingIgnoreCase(part)
               .stream()
               .map(product -> new ProductResponse(
                       product.getId(),
                       product.getTitle(),
                       product.getDescription(),
                       product.getPrice(),
                       product.getStock(),
                       product.getCategory(),
                       product.getStatus(),
                       product.getCreatedAt()
               )).toList();
    }

}

