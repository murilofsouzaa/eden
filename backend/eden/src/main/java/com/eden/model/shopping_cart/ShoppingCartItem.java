package com.eden.model.shopping_cart;

import jakarta.persistence.*;

import java.math.BigDecimal;

@Entity
@Table(name = "shopping_cart_item")
public class ShoppingCartItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cart_id", nullable = false, updatable = false)
    private Long cartId;
    @Column (name = "product_id", nullable = false)
    private Long productId;
    @Column
    private int quantity;
    @Column(nullable = false)
    private BigDecimal unitPrice;

    public ShoppingCartItem(){

    }

    public ShoppingCartItem(Long cartId, Long productId, int quantity, BigDecimal unitPrice) {
        this.cartId = cartId;
        this.productId = productId;
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

    public Long getCartId() {
        return cartId;
    }

    public void setCartId(Long cartId) {
        this.cartId = cartId;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
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

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }
}
