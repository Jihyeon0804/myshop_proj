package com.myshop.review.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.myshop.review.domain.ReviewImage;

@Repository
public interface ReviewImageMapper {

	public void insertReviewImage(
			@Param("reviewId") int reviewId,
			@Param("imagePath") String imagePath);
	
	public List<ReviewImage> selectReviewImageList(int reviewId);
}
