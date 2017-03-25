package com.crazy.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.crazy.domain.StoreUser;

public interface IStoreUserService {

	/**
	 * 用户登录
	 * 
	 * @return
	 */
	public Map<String, Object> login(String username, String passwd);
	
	public StoreUser getStoreUser(HttpSession httpSession);
	
	public boolean isLogin(HttpSession httpSession);
	
	public Map<String, Object> updatePwd(StoreUser storeUser,String oldPwd,String newPwd);
}
