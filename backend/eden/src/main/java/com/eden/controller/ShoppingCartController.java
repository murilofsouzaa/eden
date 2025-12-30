package com.eden.controller;

import com.eden.dto.shopping_cart.CreateShoppingCartRequest;
import com.eden.dto.shopping_cart.ShoppingCartResponse;
import com.eden.service.ShoppingCartService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/cart")
public class ShoppingCartController {

    private final ShoppingCartService shoppingCartService;

    public ShoppingCartController(ShoppingCartService shoppingCartService){
        this.shoppingCartService = shoppingCartService;
    }

    @GetMapping("/{cartId}")
    public ResponseEntity<ShoppingCartResponse> getShoppingCart(@PathVariable Long cartId){
        return ResponseEntity.ok(shoppingCartService.getCart(cartId));
    }

    @PostMapping("/{userId}")
    public ResponseEntity<ShoppingCartResponse> createShoppingCart(
            @PathVariable Long userId,
            @RequestBody CreateShoppingCartRequest shoppingCartRequest)
    {
        return ResponseEntity.ok(shoppingCartService.createShoppingCart(userId, shoppingCartRequest));
    }
}
