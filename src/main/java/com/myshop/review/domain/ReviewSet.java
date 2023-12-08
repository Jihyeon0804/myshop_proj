package com.myshop.review.domain;

import java.util.List;

import com.myshop.user.domain.User;

import lombok.Data;

@Data
public class ReviewSet {

	private Review review;
	
	private List<ReviewImage> reviewImageList;
	
	private User user;
}
