package com.myshop.order.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.order.domain.Order;
import com.myshop.order.domain.OrderDetail;
import com.myshop.order.domain.OrderSet;
import com.myshop.product.bo.ProductBO;
import com.myshop.product.domain.Product;

@Service
public class OrderSetBO {

	@Autowired
	private OrderBO orderBO;
	
	@Autowired
	private OrderDetailBO orderDetailBO;
	
	@Autowired
	private ProductBO productBO;
	
	
	public List<OrderSet> generateOrderSetList(int userId) {
		
		List<OrderSet> orderSetList = new ArrayList<>();
		
		List<Order> orderList = orderBO.getOrderList(userId);
		
		for (Order order : orderList) {
			OrderSet orderSet = new OrderSet();
			orderSet.setOrder(order);
			
			int orderId = order.getId();
			List<OrderDetail> orderDetailList = orderDetailBO.getOrderDetailList(orderId);
			orderSet.setOrderDetailList(orderDetailList);
			
			int productId = orderDetailList.get(0).getProductId();
			Product product = productBO.getProductById(productId);
			orderSet.setProduct(product);
			
			orderSetList.add(orderSet);
		}
		
		return orderSetList;
	}
}
