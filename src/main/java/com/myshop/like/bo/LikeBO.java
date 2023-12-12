package com.myshop.like.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.like.domain.Like;
import com.myshop.like.mapper.LikeMapper;

@Service
public class LikeBO {

	@Autowired
	private LikeMapper likeMapper;
	
	public void likeToggle(int productId, int userId) {
		if (likeMapper.selectLikeCountByProductIdUserId(productId, userId) > 0) {
			// 삭제
			likeMapper.deleteLikeByProductIdUserId(productId, userId);
		} else {
			// 추가
			likeMapper.insertLike(productId, userId);
		}
	}
	
	public boolean likeStatus(int productId, Integer userId) {
		if (userId == null) {
			return false;
		}
		
		if (likeMapper.selectLikeCountByProductIdUserId(productId, userId) > 0) {
			// 꽉 찬 하트
			return true;
		} else {
			return false;
		}
	}
	
	public List<Like> getLikeList(int userId) {
		return likeMapper.selectLikeListByUserId(userId);
	}
	
	public void deleteLikeByProductIdUserId(int productId, int userId) {
		likeMapper.deleteLikeByProductIdUserId(productId, userId);
	}
}
