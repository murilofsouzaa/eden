package com.eden.service.cart;

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
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class ShoppingCartService {

    private final ShoppingCartRepository shoppingCartRepository;
    private final ProductRepository productRepository;
    private final UserRepository userRepository;
    private final ShoppingCartValidator validator;

    public ShoppingCartService(
            ShoppingCartRepository shoppingCartRepository, UserRepository userRepository,
            ProductRepository productRepository, ShoppingCartValidator shoppingCartValidator){
        this.shoppingCartRepository = shoppingCartRepository;
        this.productRepository = productRepository;
        this.userRepository = userRepository;
        this.validator = shoppingCartValidator;
    }

    @Transactional(rollbackOn = Exception.class)
    public ShoppingCart createCart(User user) {
        ShoppingCart cart = new ShoppingCart();
        cart.setUser(user);
        return shoppingCartRepository.save(cart);
    }

    @Transactional(rollbackOn = Exception.class)
    public ItemCartResponse addItem(Long cartId, AddItemCartRequest request) {

        validator.validateIfCartExists(cartId);
        validator.validateIfProductExists(request.productId());
        validator.validateAddItemZero(request);

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
        ShoppingCart cart = shoppingCartRepository.findShoppingCartById(cartId);
        return ShoppingCartMapper.toResponse(cart);
    }

    public ShoppingCartResponse getCartByUsername(String username, Long cartId){
        User user = userRepository.findUserByName(username);
        ShoppingCart cart = user.getCart();
        cart.setId(cartId);
        cart.setUser(user);

        return ShoppingCartMapper.toResponse(cart);
    }

    public List<ItemCartResponse> getCartItems(Long cartId){
        ShoppingCart cart = shoppingCartRepository.findShoppingCartById(cartId);
        return cart.getItems()
                .stream()
                .map(ItemCartMapper::toResponse)
                .toList();
    }
}
