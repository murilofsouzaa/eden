package com.eden.dto.order.order_address;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record OrderAddressRequest(

        @NotBlank
        String street,

        @NotNull
        Integer number,

        @NotBlank
        String neighborhood,

        @NotBlank
        String city,

        @NotBlank
        String state,

        @NotBlank
        String country,

        @NotBlank
        String zipCode
) {}
