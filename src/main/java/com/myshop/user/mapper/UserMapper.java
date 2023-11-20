package com.myshop.user.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {

	// 테스트용
	public List<Map<String, Object>> selectUserList();
	
	// input : loginId
	// output : int
	public int selectUserCountByLoginId(String loginId);
	
	// input : params
	// output : void
	public void insertUser(
			@Param("loginId") String loginId,
			@Param("password") String password,
			@Param("name") String name,
			@Param("email") String email,
			@Param("phoneNumber") String phoneNumber,
			@Param("birth") String birth);
	
	
	public int existUserByLoginIdAndPassword(
			@Param("loginId") String loginId,
			@Param("password") String password);
}
