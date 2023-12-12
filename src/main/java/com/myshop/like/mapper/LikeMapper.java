package com.myshop.like.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.myshop.like.domain.Like;

@Repository
public interface LikeMapper {
	
	public int selectLikeCountByProductIdUserId(
			@Param("productId") int productId,
			@Param("userId") int userId);
	
	public void insertLike(
			@Param("productId") int productId,
			@Param("userId") int userId);

	public void deleteLikeByProductIdUserId(
			@Param("productId") int productId,
			@Param("userId") int userId);
	
	public List<Like> selectLikeListByUserId(int userId);

}
