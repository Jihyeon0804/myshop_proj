package com.myshop.user.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.user.domain.User;
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
	
	
	// input : params
	// output : void
	public void addUser(
			String loginId, String password,
			String name, String email,
			String phoneNumber, String birth, String joinType) {
		
		userMapper.insertUser(loginId, password, name, email, phoneNumber, birth, joinType);
	}
	
	
	// input : params
	// output : boolean
	public User existUserByLoginIdAndPassword(String loginId, String password) {
		return userMapper.selectUserByLoginIdAndPassword(loginId, password);
	}
	
	public List<User> getUserList() {
		return userMapper.selectUserList();
	}
}
