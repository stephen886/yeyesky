package com.crazy.service.imple;

import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crazy.dao.IUserDao;
import com.crazy.domain.User;
import com.crazy.service.IUserService;
import com.crazy.utils.EncryUtil;
import com.crazy.utils.Sessions;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Service("userService")
public class UserService implements IUserService {
	@Resource
	private IUserDao userDao;

	/**
	 * 用户登录业务类
	 * 
	 * @return int 1：登录成功，-1用户名或密码错误，0用户名不存在
	 * @author asus
	 */
	@Override
	public int login(User us) {
		User user;
		try {
			user = userDao.getUser(us.getUser_name());
			if (user == null) {
				// 用户名不存在
				return 0;
			}
			String passwd = user.getPassword();
			passwd = EncryUtil.decrypt(passwd);
			if (us.getPassword().equals(passwd)) {
				// 登录成功
				ActionContext.getContext().getSession().put("user", user);
				return 1;
			} else {
				// 密码错误
				return -1;
			}
		} catch (java.lang.NullPointerException e) {
			return 0;
		}
	}

	@Override
	public User getUser(int userid) {
		return userDao.get(userid);
	}

	@Override
	public boolean updateUser(User olduser) {
		int userID = olduser.getUser_id();
		User newuser = getUser(userID);
		newuser.getUerInfo().setInfo_id(olduser.getUerInfo().getInfo_id());
		newuser.getUerInfo().setReal_name(olduser.getUerInfo().getReal_name());
		newuser.getUerInfo().setSex(olduser.getUerInfo().getSex());
		newuser.getUerInfo().setAdress(olduser.getUerInfo().getAdress());
		newuser.setEmail(olduser.getEmail());
		newuser.setPhone(olduser.getPhone());
		userDao.edit(newuser);

		return false;
	}

	@Override
	public int register(User us) {
		us.setCratedate(new Date());
		String passwd = us.getPassword();
		passwd = EncryUtil.encrypt(passwd);
		us.setPassword(passwd);
		userDao.save(us);
		return 0;
	}

	@Override
	public void validateRegister(User user, ActionSupport asup) {
		Pattern p = null;
		Matcher m = null;
		// 用户名： ---（由字母数字下划线组成且开头必须是字母，不能超过16位）
		p = Pattern.compile("[a-zA-Z]{1}[a-zA-Z0-9_]{1,15}");
		m = p.matcher(user.getUser_name());
		if (!m.matches()) {
			asup.addFieldError("user_name", "用户名由字母数字下划线组成且开头必须是字母");
		}

		// 匹配昵称
		// System.out.println("昵称：   ---（字母和数字构成长度大于6小于10） ");
		p = Pattern.compile("[a-zA-Z0-9]{7,9}");
		m = p.matcher(user.getUser_name());
		if (!m.matches()) {
			asup.addFieldError("user_name", "字母和数字构成长度大于6小于10");
		}

		// 检查用户名是否已经被使用
		User aa = userDao.getUser(user.getUser_name());
		if (aa != null) {
			asup.addFieldError("user_name", "用户名：" + user.getUser_name()
					+ "已经注册");
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
		User bb = userDao.getUserEmail(user.getEmail());
		if (bb != null) {
			asup.addFieldError("email", "邮箱:" + user.getEmail() + "已经注册");
		}

		String phone = user.getPhone();
		Pattern p1 = Pattern.compile("^( (13[0-9])|15[0-9]|5-9|)");
		if (null == phone || p1.matcher(phone).matches()) {
			asup.addFieldError("phone", "手机号码不对");
		}

	}

	@Override
	public boolean guaishiUser() {
		return false;
	}

	@Override
	public boolean getPasswd() {
		return false;
	}

	@Override
	public User getUser() {
		if (Sessions.isLogin()) {
			return userDao.get(Sessions.getUser().getUser_id());
		}
		return null;
	}

}
