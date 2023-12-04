package com.myshop.product.domain;

import java.time.ZonedDateTime;

import lombok.Data;

@Data
public class Product {

	private int id;
	private int categoryId;
	private int subclassId;
	private int optionId;
	private String title;
	private String description;
	private int price;
	private int discountPrice;
	private int stock;
	private String productStatus;
	private ZonedDateTime createdAt;
	private ZonedDateTime updatedAt;
}
