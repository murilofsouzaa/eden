package com.eden.dto.order.order_address;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record OrderAddressRequest(

        @NotNull
        String street,

        @NotNull
        Integer number,

        @NotNull
        String neighborhood,

        @NotNull
        String city,

        @NotNull
        String state,

        @NotNull
        String country,

        @NotNull
        String zipCode
) {}
