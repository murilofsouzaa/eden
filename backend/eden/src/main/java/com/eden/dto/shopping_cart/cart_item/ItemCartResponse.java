package com.eden.dto.shopping_cart.cart_item;

import jakarta.persistence.Id;
import jakarta.validation.constraints.NotBlank;

import java.math.BigDecimal;

public record ItemCartResponse (
        @Id
        Long id,
        @NotBlank
        Long cartId,
        @NotBlank
        Long productId,
        @NotBlank
        int quantity,
        @NotBlank
        BigDecimal unitPrice
)
{}
