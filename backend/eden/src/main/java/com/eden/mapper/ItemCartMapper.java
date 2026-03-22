package com.eden.mapper;

import com.eden.dto.shopping_cart.cart_item.ItemCartResponse;
import com.eden.model.product.ProductVariant;
import com.eden.model.shopping_cart.ItemCart;

import java.util.List;

public class ItemCartMapper {

    public static ItemCartResponse toResponse(ItemCart itemCart){
    ProductVariant variant = itemCart.getVariant();
        return new ItemCartResponse(
        variant.getProduct().getId(),
        variant.getId(),
        variant.getProduct().getTitle(),
        variant.getColor(),
        variant.getSize(),
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
