package com.myshop.cart.domain;

import com.myshop.option.domain.Option;
import com.myshop.product.domain.Product;
import com.myshop.product.domain.ProductThumbnail;

import lombok.Data;

@Data
public class CartSet {

	private Product product;
	
	private ProductThumbnail productThumbnail;
	
	private Option option;
	
	private Cart cart;
}
