package com.eden.service.cart;

import com.eden.service.cart.ShoppingCartService;
import com.eden.repository.ShoppingCartRepository;
import com.eden.repository.UserRepository;
import com.eden.repository.ProductRepository;
import com.eden.model.product.Product;
import com.eden.model.shopping_cart.ShoppingCart;
import com.eden.dto.shopping_cart.cart_item.AddItemCartRequest;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions.*;
import org.springframework.boot.test.mock.mockito.MockBean;

public class ShoppingCartServiceTest {

    private final ShoppingCartRepository shoppingCartRepository;
    private final UserRepository userRepository;
    private final ProductRepository productRepository;
    
    private final ShoppingCartService shoppingCartService;

    private ShoppingCart cart = new ShoppingCart();

    public ShoppingCartServiceTest(ShoppingCartRepository shoppingCartRepository, UserRepository userRepository,
        ProductRepository productRepository, ShoppingCartService shoppingCartService
    ){
        this.shoppingCartRepository = shoppingCartRepository;
        this.userRepository = userRepository;
        this.productRepository = productRepository;
        this.shoppingCartService = shoppingCartService;
    }

    @Test
    public void shouldReturnItemAdded(){
        this.shoppingCartService.addItem(cart.getId(), request)

    }
}