package com.bookstore.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.bookstore.entity.UserEntity;

public interface UserService {

	void register(UserEntity entity);
	boolean findOneByEmail(String email);
	UserEntity update(UserEntity entity);
	UserEntity findOne(long id);
	List<UserEntity> AllUser();
	UserEntity uploadImg(UserEntity user, MultipartFile imageFile);
}
