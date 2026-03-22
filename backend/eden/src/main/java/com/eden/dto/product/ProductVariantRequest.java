package com.eden.dto.product;

import java.math.BigDecimal;

import com.eden.model.product.ProductStatus;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;

public record ProductVariantRequest(
        //ID
        String sku,
        String color,
        String size,
        @NotNull
        BigDecimal price,
        @Min(0)
        int stock,
        @NotNull
        ProductStatus status,
        Boolean defaultVariant
) {}