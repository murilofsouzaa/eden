package com.eden.dto.shopping_cart.cart_item;

import java.math.BigDecimal;

import jakarta.validation.constraints.NotNull;

public record ItemCartResponse (
        @NotNull
        Long productId,

        @NotNull
        Long variantId,

        @NotNull
        String productName,

        String color,

        String size,

        @NotNull
        int quantity,

        @NotNull
        BigDecimal unitPrice,

        @NotNull
        BigDecimal subtotal
) {}
