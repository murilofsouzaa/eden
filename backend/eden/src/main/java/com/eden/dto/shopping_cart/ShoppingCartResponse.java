package com.eden.dto.shopping_cart;

import com.eden.dto.shopping_cart.cart_item.ItemCartResponse;

import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

public record ShoppingCartResponse(
        @NotNull
        Long id,

        @NotNull
        boolean status,

        @NotNull
        BigDecimal totalCartPrice,

        List<ItemCartResponse> items,

        @NotNull
        LocalDateTime createdAt
) {}

