package com.bookstore.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.bookstore.entity.ProductEntity;

public interface ProductService {
	
	List<ProductEntity> AllProduct();
	List<ProductEntity> AllProductByCategoryId(long id);
	List<ProductEntity> TwelveProduct();
	ProductEntity findOne(long id);
	public void Upload(ProductEntity product);
	ProductEntity uploadImg(ProductEntity product, MultipartFile imageFile);

}
