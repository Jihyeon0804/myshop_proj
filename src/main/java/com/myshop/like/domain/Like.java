package com.myshop.like.domain;

import java.time.ZonedDateTime;

import lombok.Data;

@Data
public class Like {

	private int userId;
	
	private int productId;
	
	private ZonedDateTime createdAt;
	
	private ZonedDateTime updatedAt;
}
