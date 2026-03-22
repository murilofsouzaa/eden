package com.eden.service.cart;

import org.junit.jupiter.api.Test;

import com.eden.model.shopping_cart.ShoppingCart;
import com.eden.repository.ProductVariantRepository;
import com.eden.repository.ShoppingCartRepository;
import com.eden.repository.UserRepository;

public class ShoppingCartServiceTest {

    private final ShoppingCartRepository shoppingCartRepository;
    private final UserRepository userRepository;
    private final ProductVariantRepository productVariantRepository;
    
    private final ShoppingCartService shoppingCartService;

    private ShoppingCart cart = new ShoppingCart();

    public ShoppingCartServiceTest(ShoppingCartRepository shoppingCartRepository, UserRepository userRepository,
        ProductVariantRepository productVariantRepository, ShoppingCartService shoppingCartService
    ){
        this.shoppingCartRepository = shoppingCartRepository;
        this.userRepository = userRepository;
        this.productVariantRepository = productVariantRepository;
        this.shoppingCartService = shoppingCartService;
    }

    @Test
    public void shouldReturnItemAdded(){
        
    }
}