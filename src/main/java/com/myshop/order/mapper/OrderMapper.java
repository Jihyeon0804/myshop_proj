package com.myshop.order.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.myshop.order.domain.Order;

@Repository
public interface OrderMapper {

	public void insertOrder(Order order);
	
	public List<Order> selectOrderListByUserId(int userId);
}
