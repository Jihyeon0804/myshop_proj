package com.myshop.cart.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.cart.domain.Cart;
import com.myshop.cart.domain.CartSet;
import com.myshop.option.bo.OptionBO;
import com.myshop.product.bo.ProductBO;
import com.myshop.product.bo.ProductThumbnailBO;
import com.myshop.product.domain.Product;
import com.myshop.product.domain.ProductThumbnail;

@Service
public class CartSetBO {

	@Autowired
	private CartBO cartBO;
	
	@Autowired
	private ProductBO productBO;
	
	@Autowired
	private ProductThumbnailBO productThumbnailBO;
	
	@Autowired
	private OptionBO optionBO;
	
	public List<CartSet> generateCartSet(int userId) {
		List<CartSet> cartSetList = new ArrayList<>();
		List<Cart> cartList =  cartBO.getCartListByUserId(userId);
		for (Cart cart : cartList) {
			CartSet cartSet = new CartSet();
			cartSet.setCart(cart);
			
			Product product = productBO.getProductById(cart.getProductId());
			cartSet.setProduct(product);
			
			ProductThumbnail productThumbnail = productThumbnailBO.getProductThumbnailByProductId(cart.getProductId());
			cartSet.setProductThumbnail(productThumbnail);
			
			// TODO : 옵션 insert 후 재구성
			//OptionEntity option = optionBO.getOption(product.getOptionId());
			//cartSet.setOption(option);
			
			cartSetList.add(cartSet);
		}
		
		return cartSetList;
	}
}
