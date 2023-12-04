package com.myshop.productSet.domain;

import java.util.List;

import com.myshop.product.domain.Product;
import com.myshop.product.domain.ProductThumbnail;
import com.myshop.qna.domain.Qna;
import com.myshop.review.domain.ReviewSet;

import lombok.Data;

@Data
public class ProductSet {

	private Product product;
	
	private ProductThumbnail productThumbnail;
	
	private List<ReviewSet> reviewSetList;
		
	private List<Qna> qnaList;
}
