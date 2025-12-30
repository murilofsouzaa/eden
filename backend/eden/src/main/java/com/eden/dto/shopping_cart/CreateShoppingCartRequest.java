package com.eden.dto.shopping_cart;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDateTime;

public record CreateShoppingCartRequest(
        @NotNull
        Long userId,
        @NotNull
        boolean status,
        @NotNull
        LocalDateTime createdAt
) {
}
