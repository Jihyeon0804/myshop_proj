package com.myshop.inquire.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Inquire {

	private int id;
	private int userId;
	private int productId;
	private String type;
	private String title;
	private String content;
	private Date createdAt;
	private Date updatedAt;
}
