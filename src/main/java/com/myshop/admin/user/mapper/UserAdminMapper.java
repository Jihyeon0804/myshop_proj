package com.myshop.admin.user.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface UserAdminMapper {

	public List<Map<String, Object>> selectUserList();
}
