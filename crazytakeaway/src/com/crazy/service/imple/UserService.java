package com.crazy.service.imple;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import com.crazy.domain.User;
import com.crazy.domain.UserInfo;
import com.crazy.domain.UserUtils;
import com.crazy.repository.IUserDao;
import com.crazy.service.IUserService;
import com.crazy.utils.EncryUtil;

@Service("userService")
public class UserService implements IUserService {
	@Autowired
	private IUserDao userDao;

	/**
	 * 用户登录业务类
	 * 
	 * @return
	 * @author asus
	 */
	@Override
	public Map<String, Object> login(String username, String npasswd) {
		Map<String, Object> reslist = new HashMap<String, Object>();
		int status = 0;// int 1：登录成功，-1用户名或密码错误，0用户名不存在
		User user = userDao.getByUserName(username);
		if (user == null) {
			status = 0;
		} else {
			String passwd = user.getPassword();
			passwd = EncryUtil.decrypt(passwd);
			if (npasswd.equals(passwd)) {
				status = 1;
			} else {
				status = -1;
			}
			reslist.put("user", user);
		}
		reslist.put("status", status);
		return reslist;

	}

	@Override
	public User getUser(int userid) {
		return userDao.getByUserID(userid);
	}

	@Override
	public boolean updateUser(User olduser) {
		int userID = olduser.getUserID();
		User newuser = userDao.getByUserID(userID);
		if (newuser != null) {
			newuser.setEmail(olduser.getEmail());
			newuser.setPhone(olduser.getPhone());
			newuser.getUerInfo()
					.setRealName(olduser.getUerInfo().getRealName());
			newuser.getUerInfo().setSex(olduser.getUerInfo().getSex());
			newuser.getUerInfo().setAdress(olduser.getUerInfo().getAdress());
			userDao.save(newuser);
			return true;
		}
		return false;
	}

	@Override
	public int register(User us) {
		us.setCratedate(new Date());
		String passwd = us.getPassword();
		//把用户名作为盐值来加密
		passwd = EncryUtil.encryptByMD5(passwd,us.getUserName());
		us.setPassword(passwd);
		UserInfo uerInfo = new UserInfo();
		uerInfo.setRealName("");
		us.setUerInfo(uerInfo);

		userDao.save(us);
		return 0;
	}

	@Override
	public boolean register(UserUtils user, BindingResult Result,
			HttpServletRequest request) {
		if (Result.hasErrors()) {
			List<FieldError> allErrors = Result.getFieldErrors();
			for (FieldError erro : allErrors) {
				request.setAttribute("errors_" + erro.getField(),
						erro.getDefaultMessage());
			}
			return false;
		}
		if (!user.getPassword().equals(user.getRepassword())) {
			request.setAttribute("errors_repassword", "两次密码不一致");
			return false;
		}
		register(user.toUser());
		return true;
	}

	@Override
	public User getUser(HttpSession httpSession) {
		Object obj = httpSession.getAttribute("user");
		if (obj != null) {
			User user = (User) obj;
			return user;
		}
		return null;
	}

	@Override
	public boolean isLogin(HttpSession httpSession) {
		User user = getUser(httpSession);
		if (user != null) {
			return true;
		}
		return false;
	}

	@Override
	public int getUserID(HttpSession httpSession) {
		User user = getUser(httpSession);
		if (user != null) {
			return user.getUserID();
		}
		return 0;
	}
}
