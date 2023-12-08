package com.myshop.option.entity;

import java.time.ZonedDateTime;

import lombok.Data;

@Data
public class Option {
	private int productId;
	private String option;
	private String option_name;
	private int addPrice;
	private ZonedDateTime createdAt;
	private ZonedDateTime updatedAt;
}
