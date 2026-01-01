package com.eden.mapper;

import com.eden.dto.shopping_cart.cart_item.ItemCartResponse;
import com.eden.model.shopping_cart.ItemCart;

import java.util.List;

public class ItemCartMapper {

    public static ItemCartResponse toResponse(ItemCart itemCart){
        return new ItemCartResponse(
                itemCart.getProduct().getId(),
                itemCart.getProduct().getTitle(),
                itemCart.getQuantity(),
                itemCart.getUnitPrice(),
                itemCart.subtotal()
        );
    }

    public static List<ItemCartResponse> toResponseList(List<ItemCart> items){
       return items.stream()
                .map(ItemCartMapper::toResponse)
                .toList();
    }
}
