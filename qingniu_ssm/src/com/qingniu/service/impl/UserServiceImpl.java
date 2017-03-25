package com.qingniu.service.impl;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.opensymphony.xwork2.ActionSupport;
import com.qingniu.dao.UserMapper;
import com.qingniu.pojo.User;
import com.qingniu.service.IUserService;

@Service
public class UserServiceImpl implements IUserService {
	@Resource
	UserMapper userDao;

	@Override
	public User login(User user, ActionSupport asup) {
		String username = user.getUsername();
		User us = userDao.findbyUsername(username);
		if (us == null) {
			asup.addFieldError("username", "用户名不存在");
		} else {
			String opasswd = user.getPassword();
			if (opasswd.equals(us.getPassword())) {
				return us;
			} else {
				asup.addFieldError("password", "密码错误");
			}
		}
		return null;
	}

	@Override
	public void register(User user) {
		System.out.println(user);
		userDao.addUser(user);
		System.out.println("保存验证完成");
	}

	@Override
	public void validateRegister(User user, ActionSupport asup) {
		asup.setFieldErrors(null);
		Pattern p = null;
		Matcher m = null;
		// 用户名： ---（由字母数字下划线组成且开头必须是字母，不能超过16位）
		p = Pattern.compile("[a-zA-Z]{1}[a-zA-Z0-9_]{6,15}");
		m = p.matcher(user.getUsername());
		if (!m.matches()) {
			asup.addFieldError("username", "字母开头数字下划线组成，长度6-15");
		}

		// 检查用户名是否已经被使用
		User aa = userDao.findbyUsername(user.getUsername());
		if (aa != null) {
			asup.addFieldError("username", "用户名：" + user.getUsername() + "已经注册");
		}

		String password = user.getPassword();
		String repassword = user.getRepassword();
		if (!password.equals(repassword)) {
			asup.addFieldError("repassword", "两次密码不一致");
		}

		// 匹配密码
		// System.out.println("密码：---（字母和数字构成，不能超过16位）");
		p = Pattern.compile("[a-zA-Z0-9]{1,16}");
		m = p.matcher(user.getPassword());
		if (!m.matches()) {
			asup.addFieldError("password", "密码由字母和数字构成，不能超过16位");
		}

		// 验证邮箱
		// 正则表达式
		String email = user.getEmail();
		p = Pattern
				.compile("^([A-Za-z0-9_-])+@([A-Za-z0-9_-])+(\\.([A-Za-z0-9_-])+)+$");
		if (null == email || !p.matcher(email).matches()) {
			asup.addFieldError("email", "邮箱地址无效");

		}

		// 检查邮箱是否已经被使用
		User bb = userDao.findbyEmail(user.getEmail());
		if (bb != null) {
			asup.addFieldError("email", "邮箱:" + user.getEmail() + "已经注册");
		}

		String phone = user.getPhone();
		Pattern p1 = Pattern.compile("^( (13[0-9])|15[0-9]|5-9|)");
		if (null == phone || p1.matcher(phone).matches()) {
			asup.addFieldError("phone", "手机号码不对");
		}
		
		System.out.println("验证完成");

	}

}
