package com.myshop.productComponent.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.product.bo.ProductBO;
import com.myshop.product.bo.ProductThumbnailBO;
import com.myshop.product.domain.Product;
import com.myshop.product.domain.ProductThumbnail;
import com.myshop.productComponent.domain.ProductComponent;

@Service
public class ProductComponentBO {

	@Autowired
	private ProductBO productBO;
	
	@Autowired
	private ProductThumbnailBO productThumbnailBO;
	
	public ProductComponent generateProductComponent(int productId) {
		ProductComponent productComponent = new ProductComponent();
		Product product = productBO.getProductById(productId);
		productComponent.setProduct(product);
		
		ProductThumbnail productThumbnail = productThumbnailBO.getProductThumbnailByProductId(productId);
		productComponent.setProductThumbnail(productThumbnail);
		
		return productComponent;
	}
}
