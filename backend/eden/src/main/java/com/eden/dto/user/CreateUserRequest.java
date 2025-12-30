package com.eden.dto.user;

import com.eden.model.user.Gender;
import com.eden.model.user.UserRole;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Min;

import java.time.LocalDate;


public record CreateUserRequest(

        @NotBlank
        String name,
        @NotBlank
        LocalDate birthDay,
        @NotNull
        Gender gender,
        @Email
        String email,
        @NotBlank
        String password,
        UserRole role

) {
}
