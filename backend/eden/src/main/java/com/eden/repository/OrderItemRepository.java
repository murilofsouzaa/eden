package com.eden.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.eden.model.order.OrderItem;
import com.eden.model.order.OrderStatus;

public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {

    @Query("""
    SELECT p.id
    FROM OrderItem oi
    JOIN oi.order o
    JOIN oi.variant v
    JOIN v.product p
    WHERE o.status = :status
    GROUP BY p.id
    ORDER BY SUM(oi.quantity) DESC
    """)
    List<Long> findTopBestSellerIds(@Param("status") OrderStatus status);

}
