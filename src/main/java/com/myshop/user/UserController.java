package com.myshop.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user")
@Controller
public class UserController {

	@RequestMapping("/sign-out")
	public String signOut(HttpSession session) {
		session.removeAttribute("userId");
		session.removeAttribute("userLoginId");
		session.removeAttribute("userName");
		session.removeAttribute("email");
		session.removeAttribute("phoneNumber");
		session.removeAttribute("birth");
		session.removeAttribute("address");
		session.removeAttribute("grade");
		return "redirect:/j-coffee";
	}

	

}
