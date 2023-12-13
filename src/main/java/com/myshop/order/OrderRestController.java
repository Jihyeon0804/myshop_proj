package com.myshop.order;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.myshop.order.domain.Order;
import com.myshop.product.bo.ProductBO;
import com.myshop.product.bo.ProductThumbnailBO;
import com.myshop.product.domain.Product;
import com.myshop.product.domain.ProductThumbnail;

@RestController
@RequestMapping("/order")
public class OrderRestController {
	
	@Autowired
	private ProductBO productBO;
	
	@Autowired
	private ProductThumbnailBO productThumbnailBO;

	@PostMapping("/pay")
	public String payment(
			Model model, HttpSession session,
			@RequestParam("productId") int productId,
			@RequestParam("option") String option,
			@RequestParam("amount") int amount,
			@RequestParam("price") int price
			) {
		
		Order order = new Order();
		Product product = productBO.getProductById(productId);
		ProductThumbnail productThumbnail = productThumbnailBO.getProductThumbnailByProductId(productId);
		order.setProduct(product);
		order.setProductThumbnail(productThumbnail);
		order.setOption(option);
		order.setAmount(amount);
		order.setPrice(price);
		
		model.addAttribute("order", order);
		model.addAttribute("viewName", "order/order");
		return "template/layout";
	}
}
