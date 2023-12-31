package com.myshop.productSet.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.option.bo.OptionBO;
import com.myshop.option.domain.Option;
import com.myshop.product.bo.ProductBO;
import com.myshop.product.bo.ProductThumbnailBO;
import com.myshop.product.domain.Product;
import com.myshop.product.domain.ProductThumbnail;
import com.myshop.productSet.domain.ProductSet;
import com.myshop.qna.bo.QnaBO;
import com.myshop.qna.domain.Qna;
import com.myshop.review.bo.ReviewBO;
import com.myshop.review.domain.ReviewSet;

@Service
public class ProductSetBO {

	@Autowired
	private ProductBO productBO;
	
	@Autowired
	private ProductThumbnailBO productThumbnailBO;
	
	@Autowired
	private ReviewBO reviewBO;
	
	@Autowired
	private QnaBO qnaBO;
	
	@Autowired
	private OptionBO optionBO;
	
	public List<ProductSet> generateProductSetList() {
		List<ProductSet> productSetList = new ArrayList<>();
		
		List<Product> productList = productBO.getProductList();
		for (Product product : productList) {
			ProductSet productSet = new ProductSet();
			productSet.setProduct(product);
			
			// 상품 썸네일
			ProductThumbnail productThumbnail = productThumbnailBO.getProductThumbnailByProductId(product.getId());
			productSet.setProductThumbnail(productThumbnail);
			
			// 상품에 해당하는 리뷰-작성자 묶음
			List<ReviewSet> reviewSetList = reviewBO.generateReviewSetList(product.getId());
			productSet.setReviewSetList(reviewSetList);
			
			// 상품에 해당하는 QnA 묶음
			List<Qna> qnaList = qnaBO.generateQnaList(product.getId());
			productSet.setQnaList(qnaList);
			
			productSetList.add(productSet);
		}
		
		return productSetList;
	}
	
	
	
	public List<ProductSet> generateProductSetListByCategoryId(int categoryId) {
		List<ProductSet> productSetList = new ArrayList<>();
		
		List<Product> productList = productBO.getProductByCategoryId(categoryId);
		for (Product product : productList) {
			ProductSet productSet = new ProductSet();
			productSet.setProduct(product);
			
			// 상품 썸네일
			ProductThumbnail productThumbnail = productThumbnailBO.getProductThumbnailByProductId(product.getId());
			productSet.setProductThumbnail(productThumbnail);
			
			// 상품에 해당하는 리뷰-작성자 묶음
			List<ReviewSet> reviewSetList = reviewBO.generateReviewSetList(product.getId());
			productSet.setReviewSetList(reviewSetList);
			
			// 상품에 해당하는 QnA 묶음
			List<Qna> qnaList = qnaBO.generateQnaList(product.getId());
			productSet.setQnaList(qnaList);
			
			productSetList.add(productSet);
		}
		return productSetList;
	}
	
	
	public List<ProductSet> generateProductSetListByCategoryIdSubclassId(int categoryId, int subclassId) {
		List<ProductSet> productSetList = new ArrayList<>();
		
		List<Product> productList = productBO.getProductByCategoryIdSubclassId(categoryId, subclassId);
		for (Product product : productList) {
			ProductSet productSet = new ProductSet();
			productSet.setProduct(product);
			
			// 상품 썸네일
			ProductThumbnail productThumbnail = productThumbnailBO.getProductThumbnailByProductId(product.getId());
			productSet.setProductThumbnail(productThumbnail);
			
			// 상품에 해당하는 리뷰-작성자 묶음
			List<ReviewSet> reviewSetList = reviewBO.generateReviewSetList(product.getId());
			productSet.setReviewSetList(reviewSetList);
			
			// 상품에 해당하는 QnA 묶음
			List<Qna> qnaList = qnaBO.generateQnaList(product.getId());
			productSet.setQnaList(qnaList);
			
			productSetList.add(productSet);
		}
		return productSetList;
	}
	
	
	
	
	public ProductSet generateProductSet(int productId) {
		ProductSet productSet = new ProductSet();
		Product product = productBO.getProductById(productId);
		productSet.setProduct(product);
		
		// 상품 썸네일
		ProductThumbnail productThumbnail = productThumbnailBO.getProductThumbnailByProductId(product.getId());
		productSet.setProductThumbnail(productThumbnail);
		
		// 상품 옵션
		List<Option> optionList = optionBO.getOptionListByProductId(productId);
		productSet.setOptionList(optionList);
		
		// 상품 옵션 이름
		List<String> optionNameList = optionBO.getOptionNameListByProductId(productId);
		productSet.setOptionName(optionNameList);
		
		// 상품에 해당하는 리뷰-작성자 묶음
		List<ReviewSet> reviewSetList = reviewBO.generateReviewSetList(product.getId());
		productSet.setReviewSetList(reviewSetList);
		
		// 상품에 해당하는 QnA 묶음
		List<Qna> qnaList = qnaBO.generateQnaList(product.getId());
		productSet.setQnaList(qnaList);
		
		return productSet;
	}
}
