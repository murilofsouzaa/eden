package com.eden.dto.order;

import com.eden.model.order.OrderAddress;
import com.eden.model.order.OrderStatus;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDateTime;

public record CreateOrderRequest(
        @NotNull
        Long userId,
        @NotNull
        OrderAddress address,
        @NotNull
        LocalDateTime createdAt
) {
}
