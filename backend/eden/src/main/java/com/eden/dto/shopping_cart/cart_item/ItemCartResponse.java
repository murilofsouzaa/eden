package com.eden.dto.shopping_cart.cart_item;

import jakarta.persistence.Id;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;

public record ItemCartResponse (
        @Id
        Long id,
        @NotNull
        Long cartId,
        @NotNull
        Long productId,
        @NotNull
        int quantity,
        @NotNull
        BigDecimal unitPrice
)
{}
