package com.eden.dto.shopping_cart.cart_item;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;

public record AddItemCartRequest(
        @NotNull
        Long productId,

        @Min(1)
        int quantity
) {
}
