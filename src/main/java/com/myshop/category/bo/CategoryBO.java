package com.myshop.category.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.category.entity.CategoryEntity;
import com.myshop.category.repository.CategoryRepository;

@Service
public class CategoryBO {

	@Autowired
	private CategoryRepository categoryRepository;
	
	public List<CategoryEntity> getCategoryEntity() {
		return categoryRepository.findAll();
	}
}
