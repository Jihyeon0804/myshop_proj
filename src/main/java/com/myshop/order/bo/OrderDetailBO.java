package com.myshop.order.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.order.domain.OrderDetail;
import com.myshop.order.mapper.OrderDetailMapper;

@Service
public class OrderDetailBO {

	@Autowired
	private OrderDetailMapper orderDetailMapper;
	
	public void addOrderDetail(int orderId, int productId, String option, int price, int amount) {
		orderDetailMapper.insertOrderDetail(orderId, productId, option, price, amount);
	}
	
	public List<OrderDetail> getOrderDetailList(int orderId) {
		return orderDetailMapper.selectOrderDetailList(orderId);
	}
}
