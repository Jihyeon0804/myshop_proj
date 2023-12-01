package com.myshop.qna.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.inquire.bo.InquireBO;
import com.myshop.inquire.domain.Inquire;
import com.myshop.qna.domain.Qna;
import com.myshop.user.bo.UserBO;

@Service
public class QnaBO {

	@Autowired
	private UserBO userBO;
	
	@Autowired
	private InquireBO inquireBO;
	
	public List<Qna> generateQnaList() {
		List<Qna> qnaList = new ArrayList<>();
		
		List<Inquire> inquireList = inquireBO.getInquire();
		userBO.getUserList();
		return qnaList;
	}
}
