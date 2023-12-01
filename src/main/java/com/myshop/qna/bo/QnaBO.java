package com.myshop.qna.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.answer.bo.AnswerBO;
import com.myshop.answer.entity.AnswerEntity;
import com.myshop.inquire.bo.InquireBO;
import com.myshop.inquire.domain.Inquire;
import com.myshop.qna.domain.Qna;
import com.myshop.user.bo.UserBO;
import com.myshop.user.domain.User;

@Service
public class QnaBO {

	@Autowired
	private UserBO userBO;
	
	@Autowired
	private InquireBO inquireBO;
	
	@Autowired
	private AnswerBO answerBO;
	
	public List<Qna> generateQnaList(Integer userId) {
		List<Qna> qnaList = new ArrayList<>();
		
		List<Inquire> inquireList = inquireBO.getInquire();
		for (Inquire inquire : inquireList) {
			Qna qna = new Qna();
			qna.setInquire(inquire);
			
			User user = userBO.getUserById(inquire.getUserId());
			qna.setUser(user);
			
			AnswerEntity answer = answerBO.findByInquireId(inquire.getId());
			qna.setAnswer(answer);
			
			boolean answerStatus = answerBO.answerStatus(inquire.getId());
			qna.setAnswerStatus(answerStatus);
			
			
			qnaList.add(qna);
		
		}
		return qnaList;
	}
}
