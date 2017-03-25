package com.crazy.service.imple;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crazy.domain.StoreUser;
import com.crazy.repository.IStoreUserDao;
import com.crazy.service.IStoreUserService;

@Service("storeUserService")
public class StoreUserService implements IStoreUserService {

	@Autowired
	private IStoreUserDao storeUserDao;

	@Override
	public Map<String, Object> login(String username, String npasswd) {
		Map<String, Object> reslist = new HashMap<String, Object>();
		int status = 0;// int 1：登录成功，-1用户名或密码错误，0用户名不存在
		StoreUser storeUser = storeUserDao.getByUsername(username);
		if (storeUser == null) {
			status = 0;
		} else {
			String passwd = storeUser.getPassword();
			// passwd = EncryUtil.decrypt(passwd);
			if (npasswd.equals(passwd)) {
				status = 1;
			} else {
				status = -1;
			}
			reslist.put("storeUser", storeUser);
		}
		reslist.put("status", status);
		return reslist;
	}

	@Transactional
	@Override
	public Map<String, Object> updatePwd(StoreUser storeUser, String oldPwd,
			String newPwd) {
		Map<String, Object> reslist = new HashMap<String, Object>();
		int status = -1;// int 1：登录成功，-1用户名或密码错误，0用户名不存在
		if (storeUser.getPassword().equals(oldPwd)) {
			int res = storeUserDao.updatePwd(newPwd, storeUser.getUsername());
			if (res > 0) {
				storeUser.setPassword(newPwd);
				status = 1;
			}
		}
		reslist.put("storeUser", storeUser);
		reslist.put("status", status);
		return reslist;
	}

	@Override
	public StoreUser getStoreUser(HttpSession httpSession) {
		Object object = httpSession.getAttribute("storeUser");
		if (object != null) {
			StoreUser storeUser = (StoreUser) object;
			return storeUser;
		}
		return null;
	}

	@Override
	public boolean isLogin(HttpSession httpSession) {
		if (getStoreUser(httpSession) != null) {
			return true;
		}
		return false;
	}

}
