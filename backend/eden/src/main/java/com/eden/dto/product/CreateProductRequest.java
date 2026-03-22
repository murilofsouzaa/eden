package com.eden.dto.product;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

import java.util.List;

public record CreateProductRequest(
        @NotBlank
        String title,
        @NotBlank
        String description,
        String imageUrl,
        List<String> gallery,
        @NotEmpty
        List<ProductVariantRequest> variants
) {
}
