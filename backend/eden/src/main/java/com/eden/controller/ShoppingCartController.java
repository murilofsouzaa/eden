package com.eden.controller;

import com.eden.dto.shopping_cart.CreateShoppingCartRequest;
import com.eden.dto.shopping_cart.ShoppingCartResponse;
import com.eden.dto.shopping_cart.cart_item.AddItemCartRequest;
import com.eden.dto.shopping_cart.cart_item.ItemCartResponse;
import com.eden.service.ShoppingCartService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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

    @GetMapping("/cart/{cartId}/items")
    public ResponseEntity<List<ItemCartResponse>> getCartItems(@PathVariable Long id){
        return ResponseEntity.ok(shoppingCartService.getCartItems(id));
    }

    @PostMapping("/cart/{cartId}/items")
    public ResponseEntity<ItemCartResponse> addItem(
            @PathVariable Long cartId,
            @RequestBody @Valid AddItemCartRequest request
    ) {
        return ResponseEntity.ok(shoppingCartService.addItem(cartId, request)
        );
    }
}
