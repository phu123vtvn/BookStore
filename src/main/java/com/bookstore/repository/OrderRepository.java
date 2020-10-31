package com.bookstore.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstore.entity.OrderEntity;

public interface OrderRepository extends JpaRepository<OrderEntity, Long>{

	List<OrderEntity> findAll();
	OrderEntity findOneByCode(String uuid);
	//List<OrderEntity> findAllByUserId(long id);
}
