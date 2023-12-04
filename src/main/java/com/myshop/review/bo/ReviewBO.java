package com.myshop.review.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.review.domain.Review;
import com.myshop.review.domain.ReviewSet;
import com.myshop.review.mapper.ReviewMapper;
import com.myshop.user.bo.UserBO;
import com.myshop.user.domain.User;

@Service
public class ReviewBO {

	@Autowired
	private ReviewMapper reviewMapper;
	
	@Autowired
	private UserBO userBO;
	
	public List<Review> getReviewListByProductId(int productId) {
		return reviewMapper.selectReviewListByProductId(productId);
	}
	
	
	
	// 특정 상품에 대한 리뷰-작성자 리스트
	public List<ReviewSet> generateReviewSetList(int productId) {
		List<ReviewSet> reviewSetList = new ArrayList<>();
		
		List<Review> reviewList = reviewMapper.selectReviewListByProductId(productId);
		
		for (Review review : reviewList) {
			ReviewSet reviewSet = new ReviewSet();
			reviewSet.setReview(review);
			
			User user = userBO.getUserById(review.getUserId());
			reviewSet.setUser(user);

		}
		return reviewSetList;
	}
	
}
