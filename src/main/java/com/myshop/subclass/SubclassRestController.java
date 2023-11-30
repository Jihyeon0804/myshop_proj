package com.myshop.subclass;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.myshop.subclass.bo.SubclassBO;
import com.myshop.subclass.entity.SubclassEntity;

@RequestMapping("/subclass")
@RestController
public class SubclassRestController {

	@Autowired
	private SubclassBO subclassBO;
	
	@PostMapping("")
	public List<SubclassEntity> getSubclassByCategoryId(@RequestParam("categoryId") int categoryId) {
		List<SubclassEntity> subclass = subclassBO.getSubclassEntityByCategoryId(categoryId);
		return subclass;
	}
}
