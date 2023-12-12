package com.myshop.like.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.like.domain.Like;
import com.myshop.like.domain.LikeSet;
import com.myshop.product.bo.ProductBO;
import com.myshop.product.bo.ProductThumbnailBO;
import com.myshop.product.domain.Product;
import com.myshop.product.domain.ProductThumbnail;

@Service
public class LikeSetBO {
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private ProductBO productBO;
	
	@Autowired
	private ProductThumbnailBO productThumbnailBO;

	public List<LikeSet> generateLikeSet(int userId) {
		
		List<LikeSet> likeSetList = new ArrayList<>();
		List<Like> likeList =  likeBO.getLikeList(userId);
		for (Like like : likeList) {
			LikeSet likeSet = new LikeSet();
			likeSet.setLike(like);
			
			Product product = productBO.getProductById(like.getProductId());
			likeSet.setProduct(product);
			
			ProductThumbnail productThumbnail = productThumbnailBO.getProductThumbnailByProductId(like.getProductId());
			likeSet.setProductThumbnail(productThumbnail);
			
			
			likeSetList.add(likeSet);
		}
		
		return likeSetList;
	}
}
