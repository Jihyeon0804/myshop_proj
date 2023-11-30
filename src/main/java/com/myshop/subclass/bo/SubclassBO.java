package com.myshop.subclass.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.subclass.entity.SubclassEntity;
import com.myshop.subclass.repository.SubclassRepository;

@Service
public class SubclassBO {

	@Autowired
	private SubclassRepository subclassRepository;
	
	public List<SubclassEntity> getSubclassEntity() {
		return subclassRepository.findAll();
	}
	
	public List<SubclassEntity> getSubclassEntityByCategoryId(int categoryId) {
		return subclassRepository.findAllByCategoryId(categoryId);
	}
}
