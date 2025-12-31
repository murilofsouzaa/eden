package com.eden.controller;

import com.eden.dto.shopping_cart.CreateShoppingCartRequest;
import com.eden.dto.shopping_cart.ShoppingCartResponse;
import com.eden.dto.shopping_cart.cart_item.AddItemCartRequest;
import com.eden.service.ShoppingCartService;
import jakarta.validation.Valid;
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

    @GetMapping("/{username}/{cartId}")
        public ResponseEntity<ShoppingCartResponse> getShoppingCartByUsername(
                @PathVariable String username, @PathVariable Long cartId)
        {
            return ResponseEntity.ok(shoppingCartService.getCartByUsername(username, cartId));
        }

    @PostMapping("/{userId}")
    public ResponseEntity<ShoppingCartResponse> createShoppingCart(
            @PathVariable Long userId,
            @RequestBody CreateShoppingCartRequest shoppingCartRequest)
    {
        return ResponseEntity.ok(shoppingCartService.createShoppingCart(userId, shoppingCartRequest));
    }

    @PostMapping("/carts/{cartId}/items")
    public ResponseEntity<ShoppingCartResponse> addItem(
            @PathVariable Long cartId,
            @RequestBody @Valid AddItemCartRequest request
    ) {
        return ResponseEntity.ok(
                shoppingCartService.addItem(cartId, request)
        );
    }
}
