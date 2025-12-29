package com.eden.repository;

import com.eden.model.shopping_cart.ShoppingCart;
import com.eden.model.shopping_cart.ShoppingCartItem;
import jakarta.validation.constraints.Past;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ShoppingCartRepository extends JpaRepository<ShoppingCart, Long> {

    @Query("SELECT sc FROM ShoppingCart sc JOIN sc.items i WHERE i.id = :cartItemId")
    ShoppingCart findShoppingCartByItemId(@Param("cartItemId") Long cartItemId);

    @Query("SELECT sc FROM ShoppingCart sc JOIN sc.user sc_user WHERE sc_user.id = :user_id")
    ShoppingCart findShoppingCartByUserId(@Param("user_id") Long user_id);
}
