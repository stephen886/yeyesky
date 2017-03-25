package com.crazy.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindingResult;

import com.crazy.domain.User;
import com.crazy.domain.UserUtils;

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
	public Map<String, Object> login(String username, String passwd);

	/**
	 * 根据ID拿用户
	 * 
	 * @return
	 */
	public User getUser(int userid);

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
	 * 注册信息校验
	 */
	public boolean register(UserUtils user, BindingResult Result,
			HttpServletRequest request);

	public User getUser(HttpSession httpSession);
	
	public int getUserID(HttpSession httpSession);

	public boolean isLogin(HttpSession httpSession);

}
