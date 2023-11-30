package com.myshop.subclass.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.myshop.subclass.entity.SubclassEntity;

@Repository
public interface SubclassRepository extends JpaRepository<SubclassEntity,Integer> {

	public List<SubclassEntity> findAllByCategoryId(@Param("categoryId") int categoryId);
}
