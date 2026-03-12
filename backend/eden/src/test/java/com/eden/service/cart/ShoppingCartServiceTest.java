package com.eden.service.cart;

import java.math.BigDecimal;

import com.eden.service.cart.ShoppingCartService;
import com.eden.repository.ShoppingCartRepository;
import com.eden.repository.ProductRepository;
import com.eden.repository.UserRepository;
import com.eden.model.shopping_cart.ShoppingCart;
import com.eden.model.product.Product;
import com.eden.dto.shopping_cart.cart_item.AddItemCartRequest;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class ShoppingCartServiceTest {

    @Mock
    ShoppingCartRepository shoppingCartRepository;
    @Mock
    UserRepository userRepository;
    @Mock
    ProductRepository productRepository;

    @InjectMocks
    ShoppingCartService shoppingCartService;

    @Test
    void isPriceGreaterThanZero(){

    }

    @Test
    void deveAdicionarItemAoCarrinhoComSucesso() {
        Long cartId = 1L;
        Product product = new Product();
        product.setId(10L);
        product.setPrice(BigDecimal.valueOf(10));
        AddItemCartRequest request = new AddItemCartRequest(product.getId(), 2);

        ShoppingCart mockCart = new ShoppingCart();
        when(shoppingCartRepository.findById(cartId)).thenReturn(java.util.Optional.of(mockCart));
        when(productRepository.findById(product.getId())).thenReturn(java.util.Optional.of(product));

        shoppingCartService.addItem(cartId, request);

        assertFalse(mockCart.getItems().isEmpty(), "O item deveria ter sido adicionado ao carrinho simulado");
    }
}