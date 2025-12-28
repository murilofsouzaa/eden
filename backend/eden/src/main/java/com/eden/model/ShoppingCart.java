package com.eden.model;

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
    private int id;
    @Column(name = "user_id", nullable = false)
    private int userId;
    @Column
    private boolean status;
    @Column(nullable = false)
    private LocalDateTime createdAt;

    public ShoppingCart(){

    }

    public ShoppingCart(int id, int userId, boolean status, LocalDateTime createdAt) {
        this.id = id;
        this.userId = userId;
        this.status = status;
        this.createdAt = createdAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return userId;
    }

    public void setUser_id(int user_id) {
        this.userId = userId;
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
