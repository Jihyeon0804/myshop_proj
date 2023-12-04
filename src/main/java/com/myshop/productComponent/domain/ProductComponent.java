package com.myshop.productComponent.domain;

import com.myshop.product.domain.Product;
import com.myshop.product.domain.ProductThumbnail;

import lombok.Data;

@Data
public class ProductComponent {
	
	private Product product;
	
//	private List<Review> reviewList;
	
//	private List<Qna> qnaList;
	
//	private List<Option> optionList;
	
	private ProductThumbnail productThumbnail;
}
