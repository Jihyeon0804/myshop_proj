package com.myshop.review.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.review.domain.Review;
import com.myshop.review.mapper.ReviewMapper;

@Service
public class ReviewBO {

	@Autowired
	private ReviewMapper reviewMapper;
	
	public List<Review> getReviewListByProductId(int productId) {
		return reviewMapper.selectReviewListByProductId(productId);
	}
}
