package com.myshop.inquire.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface InquireMapper {

	public void insertInquire(
			@Param("userId") int userId,
			@Param("productId") int productId,
			@Param("type") String type,
			@Param("title") String title,
			@Param("content") String content);
}
