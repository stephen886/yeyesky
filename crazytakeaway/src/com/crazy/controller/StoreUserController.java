package com.crazy.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crazy.domain.StoreUser;
import com.crazy.service.IStoreUserService;

@Controller
public class StoreUserController {

	@Autowired
	private IStoreUserService storeUserService;
	@Autowired
	protected HttpSession httpSession;

	@ResponseBody
	
	@RequestMapping(value = "admin/storeUserlogin")
	public Map<String, Object> storeview(String user_name, String password) {
		int res=1;
		Subject subject = SecurityUtils.getSubject();
		if (!subject.isAuthenticated()) {
			UsernamePasswordToken token = new UsernamePasswordToken(user_name,password);
			try {
				subject.login(token);
			}catch (AuthenticationException ae) {
				res = -1;
				httpSession.setAttribute("storeUser", null);
            }
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("res", res);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "admin/userUpdatePwd")
	public int updatePwd(String mpass, String newpass) {
		int result = -1;
		StoreUser storeUser = storeUserService.getStoreUser(httpSession);
		if (storeUser != null) {
			Map<String, Object> resmap = storeUserService.updatePwd(storeUser,
					mpass, newpass);
			int res = (int) resmap.get("status");
			if (res == 1) {
				storeUser = (StoreUser) resmap.get("storeUser");
				httpSession.setAttribute("storeUser", storeUser);
				result = 1;
			}
		}
		return result;
	}
	
	@RequestMapping("admin/storeUserloginout")
	public String loginOut(){
		httpSession.setAttribute("storeUser", null);
		
		return "adminlogin";
		
	}
	
	
	
}
