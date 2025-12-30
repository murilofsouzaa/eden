package com.eden.repository;

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
    List<Product> findByCategory(ProductCategories category);
    @Query("SELECT p FROM Product p WHERE p.price >= :min AND p.price <= :max")
    List<Product> findByPriceBetween(@Param("min") BigDecimal minPrice, @Param("max") BigDecimal maxPrice);
    List<Product> findByTitleContainingIgnoreCase(String part);
    List<Product> findByStatus(ProductStatus status);

    Long id(Long id);
}
