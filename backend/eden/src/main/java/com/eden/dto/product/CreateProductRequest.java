package com.eden.dto.product;

import com.eden.model.product.ProductCategories;
import com.eden.model.product.ProductStatus;
import jakarta.validation.constraints.NotBlank;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public record CreateProductRequest(
        @NotBlank
        String title,
        @NotBlank
        String description,
        @NotBlank
        BigDecimal price,
        @NotBlank
        int stock,
        @NotBlank
        ProductCategories category,

        String imgURL,

        @NotBlank
        ProductStatus status,
        @NotBlank
        LocalDateTime createdAt
) {
}
