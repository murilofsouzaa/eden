package com.eden.dto.user;

import com.eden.model.user.Gender;

import java.time.LocalDate;

public record UpdateUserRequest(
        String name,
        Gender gender,
        LocalDate birthDay,
        String email
) {
}
