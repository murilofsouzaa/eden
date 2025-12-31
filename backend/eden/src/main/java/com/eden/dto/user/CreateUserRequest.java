package com.eden.dto.user;

import com.eden.model.shopping_cart.ShoppingCart;
import com.eden.model.user.Gender;
import com.eden.model.user.UserRole;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Min;

import java.time.LocalDate;
import java.time.LocalDateTime;


public record CreateUserRequest(

        @NotNull
        String name,
        @NotNull
        LocalDate birthDay,
        @NotNull
        Gender gender,
        @Email
        String email,
        @NotNull
        String password,
        UserRole role

) {
}
