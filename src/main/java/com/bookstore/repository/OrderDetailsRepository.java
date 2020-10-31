package com.bookstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstore.entity.OrderDetailEntity;

public interface OrderDetailsRepository extends JpaRepository<OrderDetailEntity, Long>{

}
