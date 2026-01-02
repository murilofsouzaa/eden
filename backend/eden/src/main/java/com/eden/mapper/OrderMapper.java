package com.eden.mapper;

import com.eden.dto.order.OrderResponse;
import com.eden.dto.order.order_address.OrderAddressResponse;
import com.eden.dto.order.order_item.OrderItemResponse;
import com.eden.model.order.Order;
import com.eden.model.order.OrderAddress;
import com.eden.model.order.OrderItem;

import java.util.List;

public class OrderMapper {
    public static OrderResponse toResponse(Order order){
        return new OrderResponse(
                order.getId(),
                order.getUser().getId(),
                OrderMapper.addressToResponse(order.getOrderAddress()),
                OrderMapper.orderItemToResponseList(order.getItems()),
                order.getCreatedAt(),
                order.getStatus()
        );
    }

    public static List<OrderResponse> toResponseList(List<Order> orders){
        return orders.stream()
                .map(OrderMapper::toResponse)
                .toList();
    }

    public static OrderItemResponse orderItemToResponse(OrderItem orderItem){
        return new OrderItemResponse(
                orderItem.getId(),
                orderItem.getOrder(),
                orderItem.getQuantity(),
                orderItem.getUnit_price(),
                orderItem.subtotal()
        );
    }

    public static List<OrderItemResponse> orderItemToResponseList(List<OrderItem> orderItems){
        return orderItems.stream()
                .map(OrderMapper::orderItemToResponse)
                .toList();
    }

    public static OrderAddressResponse addressToResponse(OrderAddress orderAddress){
        return new OrderAddressResponse(
                orderAddress.getStreet(),
                orderAddress.getNumber(),
                orderAddress.getNeighborhood(),
                orderAddress.getCity(),
                orderAddress.getState(),
                orderAddress.getCountry(),
                orderAddress.getZipCode()
        );
    }
}
