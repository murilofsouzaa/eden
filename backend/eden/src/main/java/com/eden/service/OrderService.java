package com.eden.service;

import com.eden.dto.order.CreateOrderRequest;
import com.eden.dto.order.OrderResponse;
import com.eden.mapper.OrderMapper;
import com.eden.model.order.Order;
import com.eden.model.order.OrderStatus;
import com.eden.repository.OrderRepository;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.beans.Transient;
import java.time.LocalDateTime;

@Service
public class OrderService {

    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository){
        this.orderRepository = orderRepository;
    }

    @Transactional
    public OrderResponse createOrder(CreateOrderRequest orderRequest){
        Order order = new Order();
        order.setId(order.getId());
        order.setOrderAddress(order.getOrderAddress());
        order.setCreatedAt(LocalDateTime.now());
        order.setStatus(orderRequest.status());

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
