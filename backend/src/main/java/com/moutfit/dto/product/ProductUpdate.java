package com.moutfit.dto.product;

import java.math.BigDecimal;

public record ProductUpdate(String name, String description, BigDecimal price, String category, String image) {
}
