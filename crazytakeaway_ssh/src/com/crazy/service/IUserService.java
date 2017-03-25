package com.crazy.service;

import com.crazy.domain.User;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 与用户有关的业务类
 * 
 * @author asus
 * 
 */
public interface IUserService {
	/**
	 * 用户登录
	 * 
	 * @return
	 */
	public int login(User us);
	
	/**
	 *根据ID拿用户
	 * 
	 * @return
	 */
	public User getUser(int userid);
	
	/**
	 *根据session拿用户
	 * 
	 * @return
	 */
	public User getUser();
	
	

	/**
	 * 用户注册
	 * 
	 * @return
	 */
	public int register(User us);

	/**
	 * 修改用户信息
	 * 
	 * @return
	 */
	public boolean updateUser(User user);

	/**
	 * 挂失用户
	 * 
	 * @return
	 */
	public boolean guaishiUser();

	/**
	 * 找回密码
	 * 
	 * @return
	 */
	public boolean getPasswd();

	/**
	 * 注册信息校验
	 */
	public void validateRegister(User user,ActionSupport asup);

}
