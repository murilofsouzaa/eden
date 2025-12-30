package com.eden.dto.order;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDateTime;

public record OrderResponse(
        @NotNull
        Long id,
        @NotNull
        Long userId,
        @NotNull
        LocalDateTime createdAt,
        @NotNull
        boolean status
) {
}
