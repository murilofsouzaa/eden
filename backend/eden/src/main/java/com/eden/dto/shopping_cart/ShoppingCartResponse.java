package com.eden.dto.shopping_cart;

import jakarta.validation.constraints.NotBlank;

import java.time.LocalDateTime;

public record ShoppingCartResponse(
        @NotBlank
        Long id,
        @NotBlank
        Long userId,
        @NotBlank
        boolean status,
        @NotBlank
        LocalDateTime createdAt
) {
}
