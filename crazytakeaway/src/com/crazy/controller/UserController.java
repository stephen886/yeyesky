package com.crazy.controller;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crazy.domain.User;
import com.crazy.domain.UserUtils;
import com.crazy.service.IUserService;

@Controller
public class UserController {

	@Autowired
	private IUserService userService;
	@Autowired
	protected HttpSession httpSession;
	@Autowired
	protected HttpServletRequest request;

	@ResponseBody
	@RequestMapping(value = "/userlogin")
	public Map<String, Object> storeview(String user_name, String password) {
		httpSession.setAttribute("user", null);
		int res=1;
		Subject subject = SecurityUtils.getSubject();
		if (!subject.isAuthenticated()) {
			UsernamePasswordToken token = new UsernamePasswordToken(user_name,password);
//			token.setRememberMe(true);
			try {
				subject.login(token);
			}catch (AuthenticationException ae) {
				res = -1;
				httpSession.setAttribute("user", null);
            	System.out.println("登录失败: " + ae.getMessage());
            }
		}
		//-------------------------------------------------------------
		Map<String, Object> result = new HashMap<String, Object>();
		String continueUrl = (String) httpSession.getAttribute("url");
		continueUrl = (continueUrl == null) ? "index.jsp" : continueUrl;
		result.put("res", res);
		result.put("url", continueUrl);
		return result;
	}

	@RequestMapping("/userloginOut")
	public String loginOut(String continueUrl) {
		httpSession.setAttribute("user", null);
		httpSession.setAttribute("url", continueUrl);
		return "login";
	}

	@RequestMapping("/userregister")
	public String register(@Validated UserUtils user,
			BindingResult bindingResult) {
		boolean res = userService.register(user, bindingResult, request);
		if (res) {
			return "login";
		} else {
			return "register";
		}
	}

	@RequestMapping("/userinfo")
	public String info(Model model) {
		User user = (User) httpSession.getAttribute("user");
		model.addAttribute("us", userService.getUser(user.getUserID()));
		return "userinfo";
	}

	@RequestMapping("/userupdateinfo")
	public String updateinfo(User user) {
		System.out.println(user.getUerInfo().getRealName());
		userService.updateUser(user);
		return "succeed";
	}

}
