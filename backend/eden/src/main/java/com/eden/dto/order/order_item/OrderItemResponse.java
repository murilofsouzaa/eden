package com.eden.dto.order.order_item;

import com.eden.model.order.Order;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;

public record OrderItemResponse(
        @NotNull
        Long id,
        @NotNull
        Order order,
        @NotNull
        int quantity,
        @NotNull
        BigDecimal unitPrice
) {
}
