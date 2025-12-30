package com.eden.dto.shopping_cart.cart_item;

import com.eden.model.product.Product;
import com.eden.model.shopping_cart.ShoppingCart;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;

public record ItemCartResponse (
        @Id
        Long id,
        @NotNull
        ShoppingCart cart,
        @NotNull
        Product product,
        @NotNull
        int quantity,
        @NotNull
        BigDecimal unitPrice
)
{}
