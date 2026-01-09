package com.eden.model.product;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonValue;
import jakarta.websocket.ClientEndpoint;

public enum ProductCategories {
    @JsonProperty("shirts")
    SHIRTS,
    @JsonProperty("t_shirts")
    T_SHIRTS,
    @JsonProperty("regatta")
    REGATTA,
    @JsonProperty("pants")
    PANTS,
    @JsonProperty("legging")
    LEGGING,
    @JsonProperty("shorts")
    SHORTS,
    @JsonProperty("set")
    SET,
    @JsonProperty("shoes")
    SHOES,
    @JsonProperty("caps")
    CAPS,
    @JsonProperty("sweatshirts")
    SWEATSHIRTS;
}
