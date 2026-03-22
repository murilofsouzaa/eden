package com.eden.dto.product;

import java.util.List;

public record UpdateProductRequest(
        String title,
        String description,
        String imageUrl,
        List<String> gallery,
        List<ProductVariantRequest> variants
) {}
