package com.eden.service;

import com.eden.dto.shopping_cart.CreateShoppingCartRequest;
import com.eden.dto.shopping_cart.ShoppingCartResponse;
import com.eden.dto.shopping_cart.cart_item.AddItemCartRequest;
import com.eden.dto.shopping_cart.cart_item.ItemCartResponse;
import com.eden.model.product.Product;
import com.eden.model.shopping_cart.ItemCart;
import com.eden.model.shopping_cart.ShoppingCart;
import com.eden.model.user.User;
import com.eden.repository.ProductRepository;
import com.eden.repository.ShoppingCartRepository;
import jakarta.transaction.Transactional;
import org.hibernate.cache.spi.support.AbstractReadWriteAccess;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class ShoppingCartService {

    private final ShoppingCartRepository shoppingCartRepository;
    private final ProductRepository productRepository;
    private final UserService userService;

    public ShoppingCartService(
            ShoppingCartRepository shoppingCartRepository, UserService userService,
            ProductRepository productRepository){
        this.shoppingCartRepository = shoppingCartRepository;
        this.productRepository = productRepository;
        this.userService = userService;
    }

    @Transactional(rollbackOn = Exception.class)
    public ItemCartResponse addItem(Long cartId, AddItemCartRequest request) {

        ShoppingCart cart = shoppingCartRepository.findById(cartId)
                .orElseThrow(() -> new RuntimeException("Cart not found"));

        Product product = productRepository.findById(request.productId())
                .orElseThrow(() -> new RuntimeException("Product not found"));

        ItemCart existingItem = cart.getItems()
                .stream()
                .filter(item -> item.getProduct().getId().equals(product.getId()))
                .findFirst()
                .orElse(null);

        ItemCart item;

        if (existingItem != null) {
            existingItem.setQuantity(
                    existingItem.getQuantity() + request.quantity()
            );
            item = existingItem;

        } else {
            item = new ItemCart();
            item.setCart(cart);
            item.setProduct(product);
            item.setQuantity(request.quantity());
            item.setUnitPrice(product.getPrice());

            cart.getItems().add(item);
        }

        shoppingCartRepository.save(cart);

        return new ItemCartResponse(
                item.getId(),
                item.getProduct(),
                item.getQuantity(),
                item.getUnitPrice()

        );
    }

    public ShoppingCartResponse getCart(Long cartId){
        ShoppingCart cart = shoppingCartRepository.findShoppingCartById(cartId);
        return new ShoppingCartResponse(
                cart.getId(),
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
