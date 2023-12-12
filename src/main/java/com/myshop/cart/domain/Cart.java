package com.myshop.cart.domain;

import java.time.ZonedDateTime;

import lombok.Data;

@Data
public class Cart {

	private int id;
	private int userId;
	private int productId;
	private String option;
	private int amount;
	private ZonedDateTime createdAt;
	private ZonedDateTime updatedAt;
}
