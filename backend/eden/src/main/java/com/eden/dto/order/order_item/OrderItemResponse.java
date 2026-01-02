package com.eden.dto.order.order_item;

import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;

public record OrderItemResponse(
        @NotNull
        Long id,
        @NotNull
        Long orderId,
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
) {
}
