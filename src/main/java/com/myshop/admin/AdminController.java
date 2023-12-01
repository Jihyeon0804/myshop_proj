package com.myshop.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myshop.admin.user.bo.UserAdminBO;
import com.myshop.category.bo.CategoryBO;
import com.myshop.category.entity.CategoryEntity;
import com.myshop.inquire.bo.InquireBO;
import com.myshop.inquire.domain.Inquire;
import com.myshop.subclass.bo.SubclassBO;
import com.myshop.subclass.entity.SubclassEntity;
import com.myshop.user.bo.UserBO;
import com.myshop.user.domain.User;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
	@Autowired
	private InquireBO inquireBO;
	
	@Autowired
	private UserBO userBO;

	@Autowired
	private SubclassBO subclassBO;
	
	@Autowired
	private CategoryBO categoryBO;
	
	@Autowired
	private UserAdminBO userAdminBO;
	
	@RequestMapping("/main")
	public String adminMainView(Model model) {
		List<Map<String, Object>> userList = userAdminBO.getUserList();
		model.addAttribute("userList", userList);
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
	public String adminProductView(Model model) {
		List<CategoryEntity> categoryList = categoryBO.getCategoryEntity();
		List<SubclassEntity> subclassList = subclassBO.getSubclassEntity();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("subclassList", subclassList);
		return "admin/product";
	}
	@GetMapping("/inquiry")
	public String adminInquiryView(Model model) {
		List<Inquire> inquireList = inquireBO.getInquire();
		List<User> userList = userBO.getUserList();
		model.addAttribute("inquireList", inquireList);
		model.addAttribute("userList", userList);
		return "admin/clientInquiry";
	}
}
