package com.eden.dto.order;

import com.eden.dto.order.order_address.OrderAddressResponse;
import com.eden.dto.order.order_item.OrderItemResponse;
import com.eden.model.order.OrderAddress;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDateTime;
import java.util.List;

public record OrderResponse(
        @NotNull
        Long id,
        @NotNull
        Long userId,
        @NotNull
        OrderAddressResponse orderAddressResponse,
        @NotNull
        List<OrderItemResponse> orderItemsResponse,
        @NotNull
        LocalDateTime createdAt,
        @NotNull
        boolean status
) {
}
