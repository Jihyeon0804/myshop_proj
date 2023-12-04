package com.myshop.review.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.myshop.review.domain.Review;

@Repository
public interface ReviewMapper {

	public List<Review> selectReviewListByProductId(int productId);
}
