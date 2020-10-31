package com.bookstore.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.bookstore.converter.UserConverter;
import com.bookstore.dto.MyUser;
import com.bookstore.entity.UserEntity;
import com.bookstore.repository.UserRepository;

@Service
public class CustomUserDetailService implements UserDetailsService{

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private UserConverter userConverter;
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		UserEntity userEntity=userRepository.findOneByEmailAndStatus(email, 1);
		if (userEntity == null) {
			throw new UsernameNotFoundException("User not found");
		}
		List<GrantedAuthority> authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority(userEntity.getRole().getPermission()));
		// put thông tin vào security để duy trì thông tin khi user login vào hệ thống
		MyUser user = new MyUser(userEntity.getEmail(), userEntity.getPassword(), true, true, true, true, authorities);
		user=userConverter.convertToMyUser(user, userEntity);
		return user;
	}

}
