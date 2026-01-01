package com.eden.mapper;

import com.eden.dto.shopping_cart.ShoppingCartResponse;
import com.eden.dto.shopping_cart.cart_item.ItemCartResponse;
import com.eden.model.shopping_cart.ItemCart;
import com.eden.model.shopping_cart.ShoppingCart;

import java.util.List;

public class ShoppingCartMapper {

    public static ShoppingCartResponse toResponse (ShoppingCart shoppingCart) {
        return new ShoppingCartResponse(
                shoppingCart.getId(),
                shoppingCart.getStatus(),
                shoppingCart.getTotalPrice(),
                ItemCartMapper.toResponseList(shoppingCart.getItems()),
                shoppingCart.getCreatedAt()
        );
    }
}
