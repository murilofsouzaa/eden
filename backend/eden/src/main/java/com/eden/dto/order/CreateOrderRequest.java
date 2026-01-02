package com.eden.dto.order;

import com.eden.dto.order.order_address.OrderAddressResponse;
import com.eden.model.order.OrderAddress;
import com.eden.model.order.OrderStatus;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDateTime;

public record CreateOrderRequest(
        @NotNull
        Long userId,
        @NotNull
        Long shoppingCartId,
        @NotNull
        OrderAddressResponse address,
        @NotNull
        LocalDateTime createdAt
) {
}
