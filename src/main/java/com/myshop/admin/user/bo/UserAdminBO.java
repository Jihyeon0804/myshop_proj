package com.myshop.admin.user.bo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.admin.user.mapper.UserAdminMapper;

@Service
public class UserAdminBO {

	@Autowired
	private UserAdminMapper userAdminMapper;
	
	public List<Map<String, Object>> getUserList() {
		return userAdminMapper.selectUserList();
	}
}
