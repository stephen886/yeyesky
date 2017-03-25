package com.qingniu.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.qingniu.pojo.User;

/**
 * 
 * @direction
 * @author 霍元甲
 * @creation 2016年11月8日
 */
@Controller("userAction")
public class UserAction extends BaseAction<User> {
	private static final long serialVersionUID = 1L;

	// 用户登录
	public String login() {
		User user = userService.login(model, this);
		if (user != null) {
			session.put("user", user);
			return "allow";
		}
		return SUCCESS;

	}

	// 用户注册
	public String register() {
		System.out.println("dkfhdjkfhjkd***************");
		userService.register(model);
		return SUCCESS;
	}

	// 注册信息校验
	public void validateRegister() {
		userService.validateRegister(model,this);
	}

}
