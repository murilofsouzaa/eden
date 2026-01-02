package com.eden.model.order;

import com.eden.model.shopping_cart.ShoppingCart;
import com.eden.model.user.User;
import jakarta.persistence.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(updatable = false)
    private Long id;

    @OneToOne
    @JoinColumn(name = "user_id", nullable = false, unique = true)
    private User user;

    @Column(nullable = false)
    private LocalDateTime createdAt;

    @Column(nullable = false)
    OrderStatus status;

    @OneToOne(cascade = CascadeType.PERSIST)
    OrderAddress orderAddress;

    @ManyToOne
    @JoinColumn(name = "shopping_cart_id")
    private com.eden.model.shopping_cart.ShoppingCart shoppingCart;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<OrderItem> items = new ArrayList<>();

    public Order(){

    }

    public Order(Long id, User user, LocalDateTime createdAt,OrderAddress orderAddress, List<OrderItem> items, OrderStatus status) {
        this.id = id;
        this.user = user;
        this.createdAt = createdAt;
        this.orderAddress = orderAddress;
        this.items = items;
        this.status = status;
    }

    @PrePersist
    public void prePersist(){
        this.status = OrderStatus.CREATED;
    }

    public BigDecimal total(){
        return items.stream()
                .map(OrderItem::subtotal)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public OrderStatus getStatus() {
        return status;
    }

    public void setStatus(OrderStatus status) {
        this.status = status;
    }

    public OrderAddress getOrderAddress() {
        return orderAddress;
    }

    public void setOrderAddress(OrderAddress orderAddress) {
        this.orderAddress = orderAddress;
    }

    public List<OrderItem> getItems() {
        return items;
    }

    public void setItems(List<OrderItem> items) {
        this.items = items;
    }

    public com.eden.model.shopping_cart.ShoppingCart getShoppingCart() {
        return shoppingCart;
    }

    public void setShoppingCart(ShoppingCart shoppingCart) {
        this.shoppingCart = shoppingCart;
    }
}
