package com.eden.model.product;

import com.fasterxml.jackson.annotation.JsonProperty;

public enum ProductStatus {
    @JsonProperty("available")
    AVAILABLE,
    @JsonProperty("unavailable")
    UNAVAILABLE,
    @JsonProperty("sent")
    SENT,
    @JsonProperty("delivered")
    DELIVERED,
    @JsonProperty("in_transit")
    IN_TRANSIT,
    @JsonProperty("preparing")
    PREPARING
}
