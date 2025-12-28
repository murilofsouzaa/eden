package com.eden.dto.order.order_address;

public record OrderAddressResponse(
        String street,
        Integer number,
        String neighborhood,
        String city,
        String state,
        String country,
        String zipCode
) {}
