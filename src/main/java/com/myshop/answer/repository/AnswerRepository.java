package com.myshop.answer.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.myshop.answer.entity.AnswerEntity;

@Repository
public interface AnswerRepository extends JpaRepository<AnswerEntity,Integer> {
	
	public AnswerEntity findByInquireId(@Param("inquireId") int inquireId);

}
