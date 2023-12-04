package com.myshop.product.domain;

import java.time.ZonedDateTime;

import lombok.Data;

@Data
public class ProductThumbnail {

	private int productId;
	private String imagePath;
	private ZonedDateTime createdAt;
	private ZonedDateTime updatedAt;
}
