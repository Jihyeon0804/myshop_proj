package com.myshop.review.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ReviewImageMapper {

	public void insertReviewImage(
			@Param("reviewId") int reviewId,
			@Param("imagePath") String imagePath);
}
