package com.myshop.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myshop.admin.user.bo.UserAdminBO;
import com.myshop.category.bo.CategoryBO;
import com.myshop.category.entity.CategoryEntity;
import com.myshop.qna.bo.QnaBO;
import com.myshop.qna.domain.Qna;
import com.myshop.subclass.bo.SubclassBO;
import com.myshop.subclass.entity.SubclassEntity;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
	@Autowired
	private QnaBO qnaBO;

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
	public String adminInquiryView(Model model, HttpSession session) {
		Integer userId = (Integer)session.getAttribute("userId");
		List<Qna> qnaList = qnaBO.generateQnaList(userId);
		model.addAttribute("qnaList", qnaList);
		return "admin/clientInquiry";
	}
}
