package com.bookstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookstore.entity.CategoryEntity;
import com.bookstore.repository.CategoryRepository;
import com.bookstore.service.CategoryService;

@Service
public class ImpleCategoryService implements CategoryService{

	@Autowired
	private CategoryRepository categoryRepository;
	
	@Override
	public List<CategoryEntity> AllCategory() {
		List<CategoryEntity> list=categoryRepository.findAll();
		return list;
	}

	@Override
	public void AddCategory(CategoryEntity entity) {
		categoryRepository.save(entity);
		
	}

	@Override
	public CategoryEntity findOne(long id) {
		CategoryEntity entity=categoryRepository.findOne(id);
		return entity;
	}

	@Override
	public void save(CategoryEntity entity) {
		categoryRepository.save(entity);
	}

}
