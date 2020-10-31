package com.bookstore.service;

import java.util.List;

import com.bookstore.entity.OrderEntity;

public interface OrderService {

	List<OrderEntity> AllOrder();
	public void save(OrderEntity entity);
	OrderEntity findOneByCode(String code);
}
