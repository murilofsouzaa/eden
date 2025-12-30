package com.eden.dto.user;

import com.eden.model.user.Gender;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDate;
import java.time.LocalDateTime;

public record UserResponse(
        @NotNull
        Long id,
        @NotNull
        String name,
        @NotNull
        Gender gender,
        @NotNull
        String email,
        @NotNull
        LocalDateTime createdAt
) {
}
