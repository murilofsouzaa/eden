package com.eden.dto.product;

import jakarta.validation.constraints.NotBlank;

import java.time.LocalDate;
import java.time.LocalDateTime;

public record ProductResponse(
        @NotBlank
        Long id,
        @NotBlank
        String title,
        @NotBlank
        String description,
        @NotBlank
        LocalDateTime createdAt
) {
}
