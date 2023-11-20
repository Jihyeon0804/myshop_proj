package com.myshop.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.user.mapper.UserMapper;

@Service
public class UserBO {

	@Autowired
	private UserMapper userMapper;
	
	// input : loginId
	// output : int
	public int getUserCountByLoginId(String loginId) {
		return userMapper.selectUserCountByLoginId(loginId);
	}
}
