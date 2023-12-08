package com.myshop.review.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.myshop.review.domain.Review;

@Repository
public interface ReviewMapper {

	public List<Review> selectReviewListByProductId(int productId);
	
	public void insertReview(
			@Param("userId") int userId,
			@Param("productId") int productId,
			@Param("point") int point,
			@Param("content") String content);
}
