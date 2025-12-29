package com.eden.repository;

import com.eden.model.order.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface OrderRepository extends JpaRepository<Order, Long> {

    @Query("SELECT o FROM Order o JOIN o.items i WHERE i.id = :itemId")
    Order findOrderByItemId(@Param("itemId") Long itemId);

    @Query("SELECT o FROM Order o WHERE o.address.id = :addressId")
    Order findOrderByAddressId(@Param("addressId") Long addressId);

    @Query("SELECT o FROM Order o WHERE o.address.number = :number")
    Order findOrderByAddressNumber(@Param("number") int number);
}
