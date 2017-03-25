package com.crazy.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.crazy.dao.imple.UserDao;
import com.crazy.domain.User;
import com.crazy.service.IUserService;
import com.crazy.service.imple.UserService;

public class TestUser {

	public static void main(String[] args) {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		IUserService userService = (IUserService) applicationContext.getBean("userService");
		User user=new User();
		user.setUser_name("dfdkjhfjdk");
		userService.updateUser(user);

	}

}
