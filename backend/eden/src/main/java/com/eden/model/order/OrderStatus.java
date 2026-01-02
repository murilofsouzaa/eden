package com.eden.model.order;

import com.fasterxml.jackson.annotation.JsonProperty;

public enum OrderStatus {
    @JsonProperty("created")
    CREATED,
    @JsonProperty("paid")
    PAID,
    @JsonProperty("preparing")
    PREPARING,
    @JsonProperty("sent")
    SHIPPED,
    @JsonProperty("delivered")
    DELIVERED,
    @JsonProperty("canceled")
    CANCELED
}

