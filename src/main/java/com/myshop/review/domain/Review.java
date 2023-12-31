package com.myshop.review.domain;

import java.time.ZonedDateTime;

import lombok.Data;

@Data
public class Review {

	private int id;
	private int userId;
	private int productId;
	private int point;
	private String content;
	private ZonedDateTime createdAt;
	private ZonedDateTime updatedAt;
}
