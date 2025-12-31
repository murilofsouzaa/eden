package com.eden.service;

import com.eden.dto.shopping_cart.CreateShoppingCartRequest;
import com.eden.dto.shopping_cart.ShoppingCartResponse;
import com.eden.dto.shopping_cart.cart_item.ItemCartResponse;
import com.eden.model.shopping_cart.ShoppingCart;
import com.eden.model.user.User;
import com.eden.repository.ShoppingCartRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class ShoppingCartService {

    private final ShoppingCartRepository shoppingCartRepository;
    private final UserService userService;

    public ShoppingCartService(ShoppingCartRepository shoppingCartRepository, UserService userService){
        this.shoppingCartRepository = shoppingCartRepository;
        this.userService = userService;
    }

    public ShoppingCartResponse createShoppingCart(Long id, CreateShoppingCartRequest shoppingCartRequest){
        User user = userService.getUserById(id);
        ShoppingCart newCart = new ShoppingCart();

        newCart.setUser(user);
        newCart.setStatus(shoppingCartRequest.status());
        newCart.setCreatedAt(LocalDateTime.now());

        shoppingCartRepository.save(newCart);

        return new ShoppingCartResponse(
                newCart.getId(),
                newCart.getItems(),
                newCart.getStatus(),
                newCart.getCreatedAt()
        );
    }

    public ShoppingCartResponse getCart(Long cartId){
        ShoppingCart cart = shoppingCartRepository.findShoppingCartById(cartId);
        return new ShoppingCartResponse(
                cart.getId(),
                cart.getItems(),
                cart.getStatus(),
                cart.getCreatedAt()
                );
    }

    public ShoppingCartResponse getCartByUsername(String username, Long cartId){
        User user = userService.getUserByUsername(username);
        ShoppingCart cart = user.getCart();
        cart.setId(cartId);
        cart.setUser(user);

        return new ShoppingCartResponse(
                cart.getId(),
                cart.getItems(),
                cart.getStatus(),
                cart.getCreatedAt()
        );
    }

    public List<ItemCartResponse> getCartItems(Long cartId){
        ShoppingCart cart = shoppingCartRepository.findShoppingCartById(cartId);
        return cart.getItems()
                .stream()
                .map(item -> new ItemCartResponse(
                        item.getId(),
                        item.getProduct(),
                        item.getQuantity(),
                        item.getUnitPrice()
                ))
                .toList();
    }
}
