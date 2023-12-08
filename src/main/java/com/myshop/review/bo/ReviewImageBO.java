package com.myshop.review.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.review.mapper.ReviewImageMapper;

@Service
public class ReviewImageBO {

	@Autowired
	private ReviewImageMapper reviewImageMapper;
	// insert
	public void addReviewImage(int reviewId, String imagePath) {
		reviewImageMapper.insertReviewImage(reviewId, imagePath);
	}
}
