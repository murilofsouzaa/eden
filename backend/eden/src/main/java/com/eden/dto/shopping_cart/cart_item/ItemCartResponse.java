package com.eden.dto.shopping_cart.cart_item;

import jakarta.validation.constraints.NotNull;
import java.math.BigDecimal;

public record ItemCartResponse (
        @NotNull
        Long productId,

        @NotNull
        String productName,

        @NotNull
        int quantity,

        @NotNull
        BigDecimal unitPrice,

        @NotNull
        BigDecimal subtotal
) {}
