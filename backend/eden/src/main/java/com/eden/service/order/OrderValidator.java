package com.eden.service.order;

import com.eden.model.shopping_cart.ShoppingCart;
import com.eden.model.user.User;
import org.springframework.stereotype.Component;

@Component
public class OrderValidator {
    
    public void validate(User user, ShoppingCart shoppingCart) {
        if (!shoppingCart.getUser().getId().equals(user.getId())) {
            throw new RuntimeException("Shopping cart does not belong to this user!");
        }

        if (shoppingCart.getItems().isEmpty()) {
            throw new RuntimeException("Shopping cart is empty!");
        }
    }
}
