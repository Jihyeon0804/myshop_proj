package com.myshop.address;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/address")
@Controller
public class AddressController {
	
	@RequestMapping("/juso")
	public String address() {
		return "address/jusoPopup";
	}
}
