package com.myshop.review.domain;

import com.myshop.user.domain.User;

import lombok.Data;

@Data
public class ReviewSet {

	private Review review;
	
	private User user;
}
