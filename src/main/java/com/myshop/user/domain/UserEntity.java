package com.myshop.user.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserEntity {

	private int id;
	private String loginId;
	private String password;
	private String name;
	private String email;
	private String phoneNumber;
	private String birth;
	private String address;
	private String grade;
	private Date createdAt;
	private Date updatedAt;
}
