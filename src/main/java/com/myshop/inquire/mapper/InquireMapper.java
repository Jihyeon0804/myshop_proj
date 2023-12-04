package com.myshop.inquire.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.myshop.inquire.domain.Inquire;

@Repository
public interface InquireMapper {

	public void insertInquire(
			@Param("userId") int userId,
			@Param("productId") int productId,
			@Param("type") String type,
			@Param("title") String title,
			@Param("content") String content);
	
	public List<Inquire> selectInquireByProductId(int productId);
}
