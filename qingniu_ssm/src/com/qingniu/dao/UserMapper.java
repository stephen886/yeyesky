package com.qingniu.dao;

import com.qingniu.pojo.User;

public interface UserMapper {
	
	

	
	User findbyUsername(String username);
	
	User findbyEmail(String email);
	
	int addUser(User user);

}
