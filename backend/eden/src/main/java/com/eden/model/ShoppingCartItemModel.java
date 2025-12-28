package com.eden.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.math.BigDecimal;

@Entity
@Table(name = "shopping_cart_item")
public class ShoppingCartItemModel {
    @Id
    @Column(name = "cart_id", nullable = false)
    private int cartId;
    @Column (name = "product_id", nullable = false)
    private int productId;
    @Column
    private int quantity;
    @Column(nullable = false)
    private BigDecimal unit_price;

    public ShoppingCartItemModel(){

    }

    public ShoppingCartItemModel(int cartId, int productId, int quantity, BigDecimal unit_price) {
        this.cartId = cartId;
        this.productId = productId;
        this.quantity = quantity;
        this.unit_price = unit_price;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
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
