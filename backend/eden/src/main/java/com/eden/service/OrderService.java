package com.eden.service;

import com.eden.dto.order.CreateOrderRequest;
import com.eden.dto.order.OrderResponse;
import com.eden.mapper.OrderMapper;
import com.eden.model.order.Order;
import com.eden.model.order.OrderAddress;
import com.eden.model.order.OrderItem;
import com.eden.model.order.OrderStatus;
import com.eden.model.shopping_cart.ShoppingCart;
import com.eden.model.shopping_cart.ItemCart;
import com.eden.model.user.User;
import com.eden.repository.OrderAddressRepository;
import com.eden.repository.OrderRepository;
import com.eden.repository.ShoppingCartRepository;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class OrderService {

    private final OrderRepository orderRepository;
    private final UserService userService;
    private final OrderAddressRepository orderAddressRepository;
    private final ShoppingCartRepository shoppingCartRepository;

    public OrderService(OrderRepository orderRepository, UserService userService, OrderAddressRepository orderAddressRepository, ShoppingCartRepository shoppingCartRepository){
        this.orderRepository = orderRepository;
        this.userService = userService;
        this.orderAddressRepository = orderAddressRepository;
        this.shoppingCartRepository = shoppingCartRepository;
    }

    @Transactional
    public OrderResponse showOrder(Long id){
        Order order = orderRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Order not found!"));

        return OrderMapper.toResponse(order);
    }

    @Transactional
    public OrderResponse createOrder(CreateOrderRequest orderRequest){
        User user = userService.getUserById(orderRequest.userId());

        ShoppingCart shoppingCart = shoppingCartRepository.findById(orderRequest.shoppingCartId())
                .orElseThrow(() -> new RuntimeException("Shopping cart not found!"));

        if (!shoppingCart.getUser().getId().equals(user.getId())) {
            throw new RuntimeException("Shopping cart does not belong to this user!");
        }

        if (shoppingCart.getItems().isEmpty()) {
            throw new RuntimeException("Shopping cart is empty!");
        }

        OrderAddress address = new OrderAddress();
        address.setUser(user);
        address.setStreet(orderRequest.address().street());
        address.setNumber(orderRequest.address().number());
        address.setNeighborhood(orderRequest.address().neighborhood());
        address.setCity(orderRequest.address().city());
        address.setState(orderRequest.address().state());
        address.setCountry(orderRequest.address().country());
        address.setZipCode(orderRequest.address().zipCode());

        orderAddressRepository.save(address);

        Order order = new Order();
        order.setUser(user);
        order.setOrderAddress(address);
        order.setCreatedAt(LocalDateTime.now());
        order.setShoppingCart(shoppingCart);

        orderRepository.save(order);

        List<OrderItem> orderItems = new ArrayList<>();
        for (ItemCart cartItem : shoppingCart.getItems()) {
            OrderItem orderItem = new OrderItem();
            orderItem.setOrder(order);
            orderItem.setProduct(cartItem.getProduct());
            orderItem.setQuantity(cartItem.getQuantity());
            orderItem.setUnit_price(cartItem.getUnitPrice());
            orderItems.add(orderItem);
        }
        order.setItems(orderItems);

        orderRepository.save(order);

        return OrderMapper.toResponse(order);
    }

    @Transactional
    public OrderResponse cancelOrder(Long orderId){
        Order order = orderRepository.findById(orderId)
                .orElseThrow(() -> new RuntimeException(("Order not found!")));

        if(order.getStatus() == OrderStatus.DELIVERED){
            throw new RuntimeException(("Delivered order cannot be canceled!"));
        }

        if(order.getStatus() == OrderStatus.CANCELED){
            throw new RuntimeException(("Order is already canceled!"));
        }

        order.setStatus(OrderStatus.CANCELED);

        return OrderMapper.toResponse(order);
    }
}
