package com.eden.dto.order.order_item;

import java.math.BigDecimal;

import jakarta.validation.constraints.NotNull;

public record OrderItemResponse(
        @NotNull
        Long id,
        @NotNull
        Long orderId,
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
) {
}
