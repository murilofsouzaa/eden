package com.eden.dto.product;

import java.math.BigDecimal;

import com.eden.model.product.ProductCategories;
import com.eden.model.product.ProductGender;
import com.eden.model.product.ProductStatus;

public record ProductVariantResponse(
        Long id,
        String sku,
        String color,
        String size,
        BigDecimal price,
        int stock,
        ProductCategories category,
        ProductGender gender,
        ProductStatus status,
        boolean defaultVariant
) {}
