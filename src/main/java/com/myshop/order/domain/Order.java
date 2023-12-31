package com.myshop.order.domain;

import java.time.ZonedDateTime;

import lombok.Data;

@Data
public class Order {
	private int id;
	private int userId;
	private String orderName;
	private String address;
	private String message;
	private String phoneNumber;
	private int amount;
	private int totalPrice;
	private int deliveryPrice;
	private ZonedDateTime createdAt;
	private ZonedDateTime updatedAt;
}
