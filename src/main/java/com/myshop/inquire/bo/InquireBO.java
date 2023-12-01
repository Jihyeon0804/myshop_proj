package com.myshop.inquire.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.inquire.domain.Inquire;
import com.myshop.inquire.mapper.InquireMapper;

@Service
public class InquireBO {

	@Autowired
	private InquireMapper inquireMapper;
	
	public void addInquire(int userId, int productId, String type, String title, String content) {
		inquireMapper.insertInquire(userId, productId, type, title, content);
	}
	
	public List<Inquire> getInquire() {
		return inquireMapper.selectInquire();
	}
}
