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
    // Acessórios
    @JsonProperty("caps")
    CAPS, // bonés
    @JsonProperty("bags")
    BAGS, // bolsas
    @JsonProperty("belts")
    BELTS, // cintos
    @JsonProperty("hats")
    HATS, // chapéus
    @JsonProperty("water_bottle")
    WATER_BOTTLE, // garrafas
    @JsonProperty("accessory")
    ACCESSORY, // outros acessórios (ex: headset, joelheira)
    @JsonProperty("sweatshirts")
    SWEATSHIRTS;
}
