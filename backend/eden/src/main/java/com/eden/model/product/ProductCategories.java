package com.eden.model.product;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public enum ProductCategories {
    @JsonProperty("shirts")
    SHIRTS,
    @JsonProperty("t_shirts")
    T_SHIRTS,
    @JsonProperty("pants")
    PANTS,
    @JsonProperty("shoes")
    SHOES,
    @JsonProperty("caps")
    CAPS,
    @JsonProperty("sweatshirts")
    SWEATSHIRTS;
}
