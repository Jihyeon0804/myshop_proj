package com.myshop.user.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {

	// 테스트용
	public List<Map<String, Object>> selectUserList();
	
	// input : loginId
	// output : int
	public int selectUserCountByLoginId(String loginId);
}
