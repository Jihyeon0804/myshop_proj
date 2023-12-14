package com.myshop.order.domain;

import java.time.ZonedDateTime;

import lombok.Data;

@Data
public class OrderDetail {

	private int id;
	private int orderId;
	private int productId;
	private String option;
	private int price;
	private int amount;
	private ZonedDateTime createdAt;
	private ZonedDateTime updatedAt;
}
