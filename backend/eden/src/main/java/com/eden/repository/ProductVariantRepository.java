package com.eden.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import com.eden.model.product.ProductVariant;

public interface ProductVariantRepository extends JpaRepository<ProductVariant, Long> {
    @Override
    @EntityGraph(attributePaths = {"product"})
    Optional<ProductVariant> findById(Long id);

    @EntityGraph(attributePaths = "product")
    List<ProductVariant> findAllByProductId(Long productId);
}
