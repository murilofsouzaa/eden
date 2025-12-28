package com.eden.model;

import jakarta.persistence.*;

import java.math.BigDecimal;

@Entity
@Table(name="order_item")
public class OrderItem {
    @Id
    @Column (nullable = false)
    private int id;
    @ManyToOne
    @JoinColumn(name = "order_id", nullable = false)
    private Order order;
    @Column(nullable = false)
    private int quantity;
    @Column(name = "unit_price", nullable = false)
    private BigDecimal unitPrice;

    public OrderItem(){
    }

    public OrderItem(int id, Order order, int quantity, BigDecimal unitPrice) {
        this.id = id;
        this.order = order;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }

    public BigDecimal subtotal(){
        validateUnitPrice();
        return unitPrice.multiply(BigDecimal.valueOf(quantity));
    }

    public void validateUnitPrice(){
        if (unitPrice == null || unitPrice.compareTo(BigDecimal.ZERO) <= 0) {
            throw new IllegalArgumentException("The price must be greater than zero");
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Order getOrderId() {
        return order;
    }

    public void setOrderId( Order orderId) {
        this.order = order;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getUnit_price() {
        return unitPrice;
    }

    public void setUnit_price(BigDecimal unit_price) {
        this.unitPrice = unit_price;
    }
}
