package com.bookstore.service;

import java.util.List;

import com.bookstore.entity.CategoryEntity;

public interface CategoryService {

	List<CategoryEntity> AllCategory();
	public void AddCategory(CategoryEntity entity);
	CategoryEntity findOne(long id);
	public void save(CategoryEntity entity);
}
