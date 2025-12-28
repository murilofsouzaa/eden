package com.eden.dto.user;

import jakarta.validation.constraints.NotBlank;

public record UserResponse(
        @NotBlank
        int id,
        @NotBlank
        String name,
        @NotBlank
        String email
) {
}
