package com.myshop.order.domain;

import com.myshop.product.domain.Product;
import com.myshop.product.domain.ProductThumbnail;

import lombok.Data;

@Data
public class Order {

	private Product product;
	
	private ProductThumbnail productThumbnail;
	
	private String Option;
	
	private int amount;
	
	private int price;
}
