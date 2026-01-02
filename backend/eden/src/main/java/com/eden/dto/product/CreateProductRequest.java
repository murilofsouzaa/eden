package com.eden.dto.product;

import com.eden.model.product.ProductCategories;
import com.eden.model.product.ProductStatus;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public record CreateProductRequest(
        @NotNull
        String title,
        @NotNull
        String description,
        @NotNull
        BigDecimal price,
        @NotNull
        int stock,
        @NotNull
        ProductCategories category,
        String imgURL,

        @NotNull
        ProductStatus status
) {
}
