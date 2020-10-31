package com.bookstore.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bookstore.entity.RoleEntity;
import com.bookstore.entity.UserEntity;
import com.bookstore.repository.RoleRepository;
import com.bookstore.repository.UserRepository;
import com.bookstore.service.UserService;

@Service
public class ImplUserService implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private RoleRepository roleRepository;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public void register(UserEntity entity) {

		RoleEntity role = roleRepository.findOneByPermission("USER");
		entity.setPassword(bCryptPasswordEncoder.encode(entity.getPassword()));
		entity.setGender(0);
		entity.setStatus(1);
		entity.setRole(role);
		userRepository.save(entity);
	}

	@Override
	public boolean findOneByEmail(String email) {
		UserEntity entities = new UserEntity();
		entities = userRepository.findOneByEmail(email);
		if (entities == null) {
			return true;
		}
		return false;
	}

	@Override
	public UserEntity update(UserEntity entity) {

		return userRepository.save(entity);
	}

	@Override
	public List<UserEntity> AllUser() {
		List<UserEntity> list = userRepository.findAll();
		return list;
	}

	@Override
	public UserEntity findOne(long id) {
		UserEntity entity = userRepository.findOne(id);
		return entity;
	}

	@Override
	public UserEntity uploadImg(UserEntity user, MultipartFile imageFile) {
		String fileName = null;
		try {

			if (imageFile.getOriginalFilename().equals("")) {
				fileName = user.getImg();
			} else {
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
		user.setImg(fileName);
		return user;
	}

}
