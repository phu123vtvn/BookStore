package com.bookstore.converter;

import org.springframework.stereotype.Component;

import com.bookstore.dto.MyUser;
import com.bookstore.dto.UserDTO;
import com.bookstore.entity.UserEntity;

@Component
public class UserConverter {

	public UserEntity toEntity(UserDTO dto) {
		UserEntity result = new UserEntity();
		result.setAccess(dto.getAccess());
		result.setEmail(dto.getEmail());
		result.setFullname(dto.getFullname());
		result.setGender(dto.getGender());
		result.setImg(dto.getImg());
		result.setPhone(dto.getPhone());
		result.setStatus(dto.getStatus());
		result.setUsername(dto.getUsername());
		return result;
	}
	
	public UserDTO toDTO(UserEntity entity) {
		UserDTO result = new UserDTO();
		result.setAccess(entity.getAccess());
		result.setEmail(entity.getEmail());
		result.setFullname(entity.getFullname());
		result.setGender(entity.getGender());
		result.setImg(entity.getImg());
		result.setPhone(entity.getPhone());
		result.setStatus(entity.getStatus());
		result.setUsername(entity.getUsername());
		result.setRole(entity.getRole().getPermission());
		return result;
	}
	
	public MyUser convertToMyUser(MyUser user,UserEntity entity)
	{
		user.setId(entity.getId());
		user.setAccess(entity.getAccess());
		user.setEmail(entity.getEmail());
		user.setFullname(entity.getFullname());
		user.setGender(entity.getGender());
		user.setImg(entity.getImg());
		user.setPhone(entity.getPhone());
		user.setStatus(entity.getStatus());
		user.setUsername(entity.getUsername());
		user.setRole(entity.getRole().getPermission());
		return user;
	}
}