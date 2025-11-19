package com.eden.dto.product;

import java.math.BigDecimal;

public record ProductRequestDTO(Integer id, String name, String description, BigDecimal price, String category, String image, int quantity) {
}
