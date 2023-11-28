package com.myshop.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myshop.admin.user.bo.UserAdminBO;

@RequestMapping("/admin")
@Controller
public class AdminController {

	@Autowired
	private UserAdminBO userAdminBO;
	
	@RequestMapping("/main")
	public String adminMainView() {
		return "admin/admin";
	}
	
	@GetMapping("/user")
	public String adminUserView(Model model) {
		List<Map<String, Object>> userList = userAdminBO.getUserList();
		model.addAttribute("userList", userList);
		return "admin/user";
	}
	@GetMapping("/order")
	public String adminOrderView() {
		return "admin/order";
	}
	@GetMapping("/product")
	public String adminProductView() {
		return "admin/product";
	}
	@GetMapping("/inquiry")
	public String adminInquiryView() {
		return "admin/clientInquiry";
	}
}
