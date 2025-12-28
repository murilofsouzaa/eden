package com.eden.model.shopping_cart;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.time.LocalDateTime;

@Entity
@Table(name="shopping_cart")
public class ShoppingCart {
    @Id
    @Column
    private Long id;
    @Column(name = "user_id", nullable = false)
    private Long userId;
    @Column
    private boolean status;
    @Column(nullable = false)
    private LocalDateTime createdAt;

    public ShoppingCart(){

    }

    public ShoppingCart(Long id, Long userId, boolean status, LocalDateTime createdAt) {
        this.id = id;
        this.userId = userId;
        this.status = status;
        this.createdAt = createdAt;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUser_id() {
        return userId;
    }

    public void setUser_id(Long user_id) {
        this.userId = user_id;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
