package com.eden.model.product;

import com.fasterxml.jackson.annotation.JsonProperty;

public enum ProductStatus {
    @JsonProperty("available")
    AVAILABLE,
    @JsonProperty("unavailable")
    UNAVAILABLE
}
