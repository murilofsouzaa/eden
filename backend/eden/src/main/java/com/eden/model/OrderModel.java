package com.eden.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="order")
public class OrderModel {
    @Id
    @Column
    private int id;
    @Column(name = "user_id", nullable = false)
    private int userId;
    @Column(nullable = false)
    private LocalDateTime createdAt;
    @Column(nullable = false)
    private boolean status;

    List<OrderItemModel> items = new ArrayList<>();


    public OrderModel(){

    }

    public OrderModel(int id, int userId, LocalDateTime createdAt, boolean status) {
        this.id = id;
        this.userId = userId;
        this.createdAt = createdAt;
        this.status = status;
    }

    public BigDecimal total(){
        return items.stream()
                .map(OrderItemModel::subtotal)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
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
        this.userId = user_id;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
