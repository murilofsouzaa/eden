package com.eden.service.cart;

import com.eden.dto.shopping_cart.cart_item.AddItemCartRequest;
import com.eden.repository.ProductRepository;
import com.eden.repository.ShoppingCartRepository;
import org.springframework.stereotype.Component;

//TODO DELETE THIS CLASS
@Component
public class ShoppingCartValidator {

    private final ShoppingCartRepository shoppingCartRepository;
    private final ProductRepository productRepository;

    public ShoppingCartValidator(ShoppingCartRepository shoppingCartRepository, ProductRepository productRepository) {
        this.shoppingCartRepository = shoppingCartRepository;
        this.productRepository = productRepository;
    }

    public void validateIfCartExists(Long cartId) {
        if (!shoppingCartRepository.existsById(cartId)) {
            throw new RuntimeException("Cart not found!");
        }
    }

    public void validateIfProductExists(Long productId) {
        if (!productRepository.existsById(productId)) {
            throw new RuntimeException("Product not found!");
        }
    }

    public void validateAddItemZero(AddItemCartRequest request) {
        if (request.quantity() <= 0) {
            throw new RuntimeException("Quantity has to be greater than 0!");
        }
    }
}