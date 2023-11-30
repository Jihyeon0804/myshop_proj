package com.myshop.address;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/address")
@Controller
public class AddressController {

//	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
//	@PostMapping("/search")
//	public String address(String roadFullAddr,
//			String roadAddrPart1, String roadAddrPart2,
//			String addrDetail, String zipNo, Model model, HttpSession session) {
//		logger.info("@@@@@@@@@ 전체 도로명 주소 : {}", roadFullAddr);
//		logger.info("######### 도로명 주소 : {}", roadAddrPart1);
//		logger.info("######### 도로명 주소 참고항목 : {}", roadAddrPart2);
//		logger.info("$$$$$$$$$ 상세 주소 : {}", addrDetail);
//		logger.info("&&&&&&&&& 우편번호 : {}", zipNo);
//		Map<String, String> address = new HashMap<>();
//		address.put("roadAddrPart1", roadAddrPart1);
//		address.put("roadAddrPart2", roadAddrPart2);
//		address.put("addrDetail", addrDetail);
//		address.put("zipNo", zipNo);
//		model.addAttribute("address", address);
//		String userName = (String)session.getAttribute("userName");
//		
//		return "redirect:/site-name/my-page/" + userName;
//	}
	
	@RequestMapping("/juso")
	public String address() {
		return "address/jusoPopup";
	}
}
