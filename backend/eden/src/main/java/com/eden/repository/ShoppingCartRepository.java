package com.eden.repository;

import com.eden.model.shopping_cart.ShoppingCart;
import com.eden.model.shopping_cart.ShoppingCartItem;
import jakarta.validation.constraints.Past;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ShoppingCartRepository extends JpaRepository<ShoppingCart, Long> {

    @Query("SELECT sc FROM ShoppingCart sc JOIN sc.items i WHERE i.id = :cartItemId")
    ShoppingCart findShoppingCartByItemId(@Param("cartItemId") Long cartItemId);

    @Query("SELECT sc FROM ShoppingCart sc JOIN sc.userId userID WHERE userID = :user_id")
    ShoppingCart findShoppingCartByUser_id(@Param("user_id") Long userId);
}
