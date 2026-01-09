package com.eden.repository;

import com.eden.model.order.OrderItem;
import com.eden.model.product.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.eden.model.order.OrderStatus;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {

    @Query("""
    SELECT oi.product
    FROM OrderItem oi
    JOIN oi.order o
    WHERE o.status = :status
    GROUP BY oi.product
    ORDER BY SUM(oi.quantity) DESC
    """)
    List<Product> findTopBestSellers(@Param("status") OrderStatus status);

}
