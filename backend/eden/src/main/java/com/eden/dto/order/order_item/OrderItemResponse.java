package com.eden.dto.order.order_item;

import com.eden.model.order.Order;
import jakarta.validation.constraints.NotBlank;

import java.math.BigDecimal;

public record OrderItemResponse(
        @NotBlank
        Long id,
        @NotBlank
        Order order,
        @NotBlank
        int quantity,
        @NotBlank
        BigDecimal unitPrice
) {
}
