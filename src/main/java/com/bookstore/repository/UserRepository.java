package com.bookstore.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstore.entity.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, Long>{

	UserEntity findOneByEmailAndStatus(String email,int status);
	UserEntity findOneByEmail(String email);
	List<UserEntity> findByRoleId(long id);
	List<UserEntity> findAll();
	//List<UserEntity> findAllByCategoryId(long id);
}
