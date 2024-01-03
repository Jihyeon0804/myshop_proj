package com.myshop.order.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.order.domain.Order;
import com.myshop.order.mapper.OrderMapper;

@Service
public class OrderBO {

	@Autowired
	private OrderMapper orderMapper;
	
	public void addOrder(Order order) {
		orderMapper.insertOrder(order);
	}
	
	public List<Order> getOrderList(int userId) {
		return orderMapper.selectOrderListByUserId(userId);
	}
}
