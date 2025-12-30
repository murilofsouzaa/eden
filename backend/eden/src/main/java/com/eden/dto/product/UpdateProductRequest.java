package com.eden.dto.product;

import com.eden.model.product.ProductCategories;
import com.eden.model.product.ProductStatus;
import jakarta.validation.constraints.NotBlank;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public record UpdateProductRequest(
        String title,
        String description,
        BigDecimal price,
        int stock,
        ProductCategories category,
        String imgURL,
        ProductStatus status,
        LocalDateTime updatedAt
) {
}
