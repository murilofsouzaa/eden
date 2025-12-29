package com.eden.repository;

import com.eden.model.product.Product;
import com.eden.model.product.ProductStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.math.BigDecimal;
import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findByCategory(String category);
    List<Product> findByPriceBetween(BigDecimal minPrice, BigDecimal maxPrice);
    List<Product> findByTitleContainingIgnoreCase(String containPart);
    List<Product> findByStatus(ProductStatus status);
}
