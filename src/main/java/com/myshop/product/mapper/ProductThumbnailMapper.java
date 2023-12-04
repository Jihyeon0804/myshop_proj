package com.myshop.product.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.myshop.product.domain.ProductThumbnail;

@Repository
public interface ProductThumbnailMapper {

	public ProductThumbnail selectProductThumbnailByProductId(int productId);
	
	public List<ProductThumbnail> selectProductThumbnailList();
}
