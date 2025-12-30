package com.eden.repository;

import com.eden.dto.product.ProductResponse;
import com.eden.model.product.Product;
import com.eden.model.product.ProductCategories;
import com.eden.model.product.ProductStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    List<ProductResponse> findByCategory(ProductCategories category);
    @Query("SELECT p FROM Product p WHERE p.price >= :min AND p.price <= :max")
    List<ProductResponse> findByPriceBetween(@Param("min") BigDecimal minPrice, @Param("max") BigDecimal maxPrice);
    List<ProductResponse> findByTitleContainingIgnoreCase(String part);
    List<ProductResponse> findByStatus(ProductStatus status);
}
