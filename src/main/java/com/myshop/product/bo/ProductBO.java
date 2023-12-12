package com.myshop.product.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.product.domain.Product;
import com.myshop.product.mapper.ProductMapper;

@Service
public class ProductBO {

	@Autowired
	private ProductMapper productMapper;
	
	public List<Product> getProductList() {
		return productMapper.selectProductList();
	}
	
	
	public Product getProductById(int id) {
		return productMapper.selectProductById(id);
	}
	
	
	public List<Product> getProductByCategoryId(int categoryId) {
		return productMapper.selectProductByCategoryId(categoryId);
	}
	
	public List<Product> getProductByCategoryIdSubclassId(int categoryId, int subclassId) {
		return productMapper.selectProductByCategoryIdSubclassId(categoryId, subclassId);
	}
	
	
	
}
