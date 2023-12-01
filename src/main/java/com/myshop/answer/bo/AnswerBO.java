package com.myshop.answer.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import com.myshop.answer.entity.AnswerEntity;
import com.myshop.answer.repository.AnswerRepository;

@Service
public class AnswerBO {

	@Autowired
	private AnswerRepository answerRepository;
	
	public List<AnswerEntity> getAnswerList() {
		return answerRepository.findAll();
	}
	
	public boolean answerStatus(int inquireId) {
		AnswerEntity answer = answerRepository.findByInquireId(inquireId);
		if (ObjectUtils.isEmpty(answer)) {
			return false;
		} else {
			return true;
		}
	}
	
	public AnswerEntity findByInquireId(int inquireId) {
		return answerRepository.findByInquireId(inquireId);
	}
}
