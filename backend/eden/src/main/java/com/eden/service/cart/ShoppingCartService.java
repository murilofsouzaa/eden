package com.eden.service.cart;

import java.util.List;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.eden.dto.shopping_cart.ShoppingCartResponse;
import com.eden.dto.shopping_cart.cart_item.AddItemCartRequest;
import com.eden.dto.shopping_cart.cart_item.ItemCartResponse;
import com.eden.mapper.ItemCartMapper;
import com.eden.mapper.ShoppingCartMapper;
import com.eden.model.product.Product;
import com.eden.model.shopping_cart.ItemCart;
import com.eden.model.shopping_cart.ShoppingCart;
import com.eden.model.user.User;
import com.eden.repository.ProductRepository;
import com.eden.repository.ShoppingCartRepository;
import com.eden.repository.UserRepository;

import jakarta.transaction.Transactional;

@Service
public class ShoppingCartService {

    private final ShoppingCartRepository shoppingCartRepository;
    private final ProductRepository productRepository;

    @Lazy
    private final UserRepository userRepository;

    public ShoppingCartService( ShoppingCartRepository shoppingCartRepository, @Lazy UserRepository userRepository,
        ProductRepository productRepository){
        
        this.shoppingCartRepository = shoppingCartRepository;
        this.productRepository = productRepository;
        this.userRepository = userRepository;
    }

    @Transactional(rollbackOn = Exception.class)
    public ShoppingCart createCart(User user) {
        isUserNull(user);

        ShoppingCart cart = new ShoppingCart();
        cart.setUser(user);
        return shoppingCartRepository.save(cart);
    }

    @Transactional(rollbackOn = Exception.class)
    public ItemCartResponse addItem(Long cartId, AddItemCartRequest request) {

        isCartNullOrWithoutId(cartId);

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

        return ItemCartMapper.toResponse(item);
    }

    public ShoppingCartResponse getCart(Long cartId){
        isCartNullOrWithoutId(cartId);

        ShoppingCart cart = shoppingCartRepository.findShoppingCartById(cartId);
        return ShoppingCartMapper.toResponse(cart);
    }

    public ShoppingCartResponse getCartByUsername(String username, Long cartId){

        isCartNullOrWithoutId(cartId);
        isUsernameIsEmptyOrNull(username);

        User user = userRepository.findUserByName(username);
        ShoppingCart cart = user.getCart();
        cart.setId(cartId);
        cart.setUser(user);

        return ShoppingCartMapper.toResponse(cart);
    }

    public List<ItemCartResponse> getCartItems(Long cartId){
        isCartNullOrWithoutId(cartId);

        ShoppingCart cart = shoppingCartRepository.findShoppingCartById(cartId);
        return cart.getItems()
                .stream()
                .map(ItemCartMapper::toResponse)
                .toList();
    }

    private Long isCartNullOrWithoutId(Long cartId){
        if(cartId == null){
            throw new IllegalArgumentException("Cart ID cannot be null");
        }else if (cartId.toString().equals("")) {
            throw new IllegalArgumentException("The Id cannot be empty");
        }
        else{
            return cartId;
        }
    }

    private String isUsernameIsEmptyOrNull(String username){
        if(username == null){
            throw new IllegalArgumentException("The username cannot be null");
        }else if(username.equals("")){
            throw new IllegalArgumentException("The username cannot be empty");
        }else{
            return username;
        }
    }

    private User isUserNull(User user){
        if(user == null){
            throw new IllegalArgumentException("The user cannot be null");
        }else{
            return user;
        }
    }
}
