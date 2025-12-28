package com.eden.dto.order;

import jakarta.validation.constraints.NotBlank;

import java.time.LocalDateTime;

public record OrderResponse(
        @NotBlank
        Long id,
        @NotBlank
        Long userId,
        @NotBlank
        LocalDateTime createdAt,
        @NotBlank
        boolean status
) {
}
