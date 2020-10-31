package com.bookstore.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.bookstore.entity.ProductEntity;

public interface ProductRepository extends JpaRepository<ProductEntity, Long>{

	List<ProductEntity> findByOrderByIdDesc();
	List<ProductEntity> findTop12ByOrderByIdDesc();
	//ProductEntity findOne();
	@Query(value = "SELECT * FROM product p WHERE p.category_id = ?", nativeQuery = true)
	List<ProductEntity> findByCategoryId(Long categoryId);
}
