package com.eden.dto.shopping_cart;

import com.eden.model.shopping_cart.ShoppingCart;
import com.eden.model.user.User;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDateTime;

public record ShoppingCartResponse(
        @NotNull
        Long id,
        @NotNull
        boolean status,
        @NotNull
        LocalDateTime createdAt
) {
}
