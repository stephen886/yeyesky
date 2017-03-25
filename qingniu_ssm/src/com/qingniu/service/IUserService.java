package com.qingniu.service;

import com.opensymphony.xwork2.ActionSupport;
import com.qingniu.pojo.User;

public interface IUserService {
	
	public User login(User user,ActionSupport asup);
	public void register(User user);
	/**
	 * 注册信息校验
	 */
	public void validateRegister(User user, ActionSupport asup);

}
