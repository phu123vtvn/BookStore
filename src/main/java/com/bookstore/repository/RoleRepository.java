package com.bookstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstore.entity.RoleEntity;

public interface RoleRepository extends JpaRepository<RoleEntity, Long>{

	RoleEntity findOneByPermission(String permission);
}
