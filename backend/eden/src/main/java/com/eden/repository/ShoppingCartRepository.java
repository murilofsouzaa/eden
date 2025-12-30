package com.eden.repository;

import com.eden.dto.shopping_cart.ShoppingCartResponse;
import com.eden.model.shopping_cart.ShoppingCart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ShoppingCartRepository extends JpaRepository<ShoppingCart, Long> {

    ShoppingCart findShoppingCartById(Long id);

    @Query("SELECT sc FROM ShoppingCart sc JOIN sc.items i WHERE i.id = :cartItemId")
    ShoppingCart findShoppingCartByItemId(@Param("cartItemId") Long cartItemId);

    @Query("SELECT sc FROM ShoppingCart sc JOIN sc.user sc_user WHERE sc_user.id = :user_id")
    ShoppingCart findShoppingCartByUserId(@Param("user_id") Long user_id);

}
