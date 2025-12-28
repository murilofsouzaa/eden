package com.eden.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.math.BigDecimal;

@Entity
@Table(name="order_item")
public class OrderItemModel {
    @Id
    @Column
    private int id;
    @Column(name="order_id")
    private int orderId;
    @Column(name="user_id")
    private int userId;
    @Column
    private int quantity;
    @Column
    private BigDecimal unit_price;

    public OrderItemModel(){

    }

    public OrderItemModel(int id, int orderId, int userId, int quantity, BigDecimal unit_price) {
        this.id = id;
        this.orderId = orderId;
        this.userId = userId;
        this.quantity = quantity;
        this.unit_price = unit_price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(BigDecimal unit_price) {
        this.unit_price = unit_price;
    }
}
