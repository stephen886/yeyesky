package com.crazy.action;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.crazy.domain.User;
/**
 * 
* @direction 
* @author 霍元甲
* @creation 2016年11月8日
 */
@Controller("userAction")
@Scope("prototype")
public class UserAction extends BaseAction<User> {
	private static final long serialVersionUID = 1L;

	

	// 用户登录
	public void login() throws Exception {
		session.put("user", null);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("res", userService.login(model));
		String continueUrl = (String) session.get("url");
		continueUrl = (continueUrl == null) ? "index.jsp" : continueUrl;
		result.put("url", continueUrl);
		this.PrintJsonString(result);
	}

	// 用户注销
	public String loginOut() throws Exception {
		session.put("user", null);
		session.put("url", model.getContinueUrl());
		return SUCCESS;
	}

	// 用户注册
	public String register() throws Exception {
		userService.register(model);
		return SUCCESS;
	}

	// 注册信息校验
	public void validateRegister() {
		userService.validateRegister(model, this);
	}

	// 拿用户信息
	public String info() {
		User user = userService.getUser();
		request.put("us", userService.getUser());
		System.out.println("用户数据"+user.toString());
		return "userinfo";
	}

	// 修改用户信息
	public String updateinfo() throws UnsupportedEncodingException {
		userService.updateUser(model);
		return "succeed";
	}

}
