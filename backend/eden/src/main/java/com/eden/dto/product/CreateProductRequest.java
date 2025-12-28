package com.eden.dto.product;

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
        String category,
        @NotBlank
        LocalDateTime createdAt
) {
}
