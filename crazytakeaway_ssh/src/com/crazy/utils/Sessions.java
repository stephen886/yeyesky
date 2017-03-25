package com.crazy.utils;

import com.crazy.domain.User;
import com.opensymphony.xwork2.ActionContext;

/**
 * @see getSession相关的工具类
 * @author lyw
 */
public class Sessions {

	/**
	 * 判断用户是否已经登录
	 * 
	 * @return boolean
	 */
	public static boolean isLogin() {
		User user = getUser();
		if (user != null) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 从Session中拿到用户
	 * 
	 * @return User
	 */
	public static User getUser() {
		User user = (User) ActionContext.getContext().getSession().get("user");
		if (user != null) {
			return user;
		} else {
			return null;
		}
	}

}
