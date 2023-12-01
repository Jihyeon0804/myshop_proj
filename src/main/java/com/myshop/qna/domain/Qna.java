package com.myshop.qna.domain;

import com.myshop.inquire.domain.Inquire;
import com.myshop.user.domain.User;

import lombok.Data;

@Data
public class Qna {

	private User user;
	
	private Inquire inquire;
	
	// private Answer answer;
	
	private boolean isAnswer;
}
