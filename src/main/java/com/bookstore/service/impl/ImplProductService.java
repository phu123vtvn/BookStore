package com.bookstore.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bookstore.entity.ProductEntity;
import com.bookstore.repository.ProductRepository;
import com.bookstore.service.ProductService;

@Service
public class ImplProductService implements ProductService{

	@Autowired
	private ProductRepository productRepository;
	
	@Override
	public List<ProductEntity> AllProduct() {
		List<ProductEntity> list=productRepository.findByOrderByIdDesc();
		return list;
	}

	@Override
	public List<ProductEntity> AllProductByCategoryId(long id) {
		List<ProductEntity> list=productRepository.findByCategoryId(id);
		return list;
	}
	
	@Override
	public List<ProductEntity> TwelveProduct() {
		List<ProductEntity> list=productRepository.findTop12ByOrderByIdDesc();
		return list;
	}

	@Override
	public void Upload(ProductEntity product) {
		if(product.getId()!=null)
		{
			ProductEntity entity=productRepository.findOne(product.getId());
			product.setCreatedDate(entity.getCreatedDate());
			productRepository.save(product);
		}
		else {
			productRepository.save(product);
		}
	}

	@Override
	public ProductEntity findOne(long id) {
		ProductEntity entity=productRepository.findOne(id);
		return entity;
	}
	
	@Override
	@Transactional
	public ProductEntity uploadImg(ProductEntity product, MultipartFile imageFile) {
		// Upload file to storage
		String fileName = null;
		try {
			
			
			if(imageFile.getOriginalFilename().equals("")) {
				 fileName=product.getImgae();
			}
			else {
				byte[] bytes = imageFile.getBytes();
				fileName = imageFile.getOriginalFilename();
				String fileLocation = new File("src\\main\\resources\\static\\img").getAbsolutePath() + "\\" + fileName;
				FileOutputStream fos = new FileOutputStream(fileLocation);
				fos.write(bytes);
				fos.close();
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
        
		// Update image name in DB
		product.setImgae(fileName);
		return product;
	}


	

}
