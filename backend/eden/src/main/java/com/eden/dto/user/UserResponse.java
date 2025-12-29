package com.eden.dto.user;

import com.eden.model.user.Gender;
import jakarta.validation.constraints.NotBlank;

import java.time.LocalDate;
import java.time.LocalDateTime;

public record UserResponse(
        @NotBlank
        Long id,
        @NotBlank
        String name,
        @NotBlank
        Gender gender,
        @NotBlank
        String email,
        @NotBlank
        LocalDateTime createdAt
) {
}
