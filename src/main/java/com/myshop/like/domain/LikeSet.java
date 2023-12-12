package com.myshop.like.domain;

import com.myshop.product.domain.Product;
import com.myshop.product.domain.ProductThumbnail;

import lombok.Data;

@Data
public class LikeSet {

	private Like like;
	
	private Product product;
	
	private ProductThumbnail productThumbnail;
}
