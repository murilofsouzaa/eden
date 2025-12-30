package com.eden.model.user;

import com.fasterxml.jackson.annotation.JsonProperty;

public enum UserRole {
    @JsonProperty("admin")
    ADMIN,
    @JsonProperty("user")
    USER
}
