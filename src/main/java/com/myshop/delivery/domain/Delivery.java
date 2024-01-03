package com.myshop.delivery.domain;

import java.time.ZonedDateTime;

import lombok.Data;

@Data
public class Delivery {
	
	private int id;
	private int orderId;
	private String status;
	private ZonedDateTime createdAt;
	private ZonedDateTime updatedAt;
}
