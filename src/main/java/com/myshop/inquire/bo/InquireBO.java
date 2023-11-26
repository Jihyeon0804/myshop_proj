package com.myshop.inquire.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.inquire.mapper.InquireMapper;

@Service
public class InquireBO {

	@Autowired
	private InquireMapper inquireMapper;
	
	public void addInquire(int userId, int productId, String type, String title, String content) {
		inquireMapper.insertInquire(userId, productId, type, title, content);
	}
}
