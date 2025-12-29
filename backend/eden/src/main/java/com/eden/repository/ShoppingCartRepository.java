package com.eden.repository;

import com.eden.model.shopping_cart.ShoppingCart;
import com.eden.model.shopping_cart.ShoppingCartItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ShoppingCartRepository extends JpaRepository<ShoppingCart, Long> {
    ShoppingCart findShoppingCartByItemId(ShoppingCartItem item);
}
