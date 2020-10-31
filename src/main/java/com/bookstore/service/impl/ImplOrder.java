package com.bookstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookstore.entity.OrderEntity;
import com.bookstore.repository.OrderRepository;
import com.bookstore.service.OrderService;

@Service
public class ImplOrder implements OrderService{

	@Autowired
	private OrderRepository orderRepository;
	
	@Override
	public List<OrderEntity> AllOrder() {
		List<OrderEntity> listOrder=orderRepository.findAll();
		return listOrder;
	}

	@Override
	public void save(OrderEntity entity) {
		
		orderRepository.save(entity);
	}

	@Override
	public OrderEntity findOneByCode(String code) {
		OrderEntity entity=orderRepository.findOneByCode(code);
		return entity;
	}

}
