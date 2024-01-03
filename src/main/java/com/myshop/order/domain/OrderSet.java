package com.myshop.order.domain;

import java.util.List;

import com.myshop.product.domain.Product;

import lombok.Data;

@Data
public class OrderSet {

	private Order order;
	
	private List<OrderDetail> orderDetailList;
	
	private Product product;
}
