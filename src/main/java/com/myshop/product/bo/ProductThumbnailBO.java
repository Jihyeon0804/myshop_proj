package com.myshop.product.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.product.domain.ProductThumbnail;
import com.myshop.product.mapper.ProductThumbnailMapper;

@Service
public class ProductThumbnailBO {

	@Autowired
	private ProductThumbnailMapper productThumbnailMapper;
	
	public ProductThumbnail getProductThumbnailByProductId(int productId) {
		return productThumbnailMapper.selectProductThumbnailByProductId(productId);
	}
	
	public List<ProductThumbnail> getProductThumbnailList() {
		return productThumbnailMapper.selectProductThumbnailList();
	}
}
