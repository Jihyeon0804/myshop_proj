package com.myshop.review.domain;

import java.time.ZonedDateTime;

import lombok.Data;

@Data
public class ReviewImage {

	private int reviewId;
	private String imagePath;
	private ZonedDateTime createdAt;
	private ZonedDateTime updatedAt;
}
