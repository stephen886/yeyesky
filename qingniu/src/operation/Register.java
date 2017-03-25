package operation;

import java.util.ArrayList;
import java.util.List;

import object.user;
import utils.GetDate;
import utils.JdbcUtils;

public class Register {

	/**
	 * 
	 * 
	 * @param 注册操作
	 * @return
	 */
	public static boolean adduser(user auser) {
		// INSERT INTO `user` VALUES ('1', 'sfeng95', 'asdfg23asdfg',
		// '651844829@qq.com', '12345667852', '2016-04-26');

		String sql = "insert into  `user`(u_name,u_passwd,email,register_date) VALUES(?,?,?,?);";
		List<Object> paras = new ArrayList<Object>();
		paras.add(auser.getUsername());
		paras.add(auser.getPasswd());
		paras.add(auser.getEmail());
		paras.add(GetDate.getYMD());
		int i = JdbcUtils.update(sql, paras);
		if (i == 1) {
			return true;
		}
		return false;
	}

	// 检查是否存在用户名
	public static boolean be_user(String user) {
		String sql = "select uid from user where u_name=?";
		List<Object> paras = new ArrayList<Object>();
		paras.add(user);
		Object res = JdbcUtils.queryOne(sql, paras);
		if (res != null) {
			return true;
		}
		return false;
	}

	// 检查是否存在邮箱
	public static boolean be_email(String email) {
		String sql = "select uid from user where email=?";
		List<Object> paras = new ArrayList<Object>();
		paras.add(email);
		Object res = JdbcUtils.queryOne(sql, paras);
		if (res != null) {
			return true;
		}
		return false;
	}

	// 检查是否存在邮箱
	public static boolean be_phone(String phone) {
		String sql = "select uid from user where phone=?";
		List<Object> paras = new ArrayList<Object>();
		paras.add(phone);
		Object res = JdbcUtils.queryOne(sql, paras);
		if (res != null) {
			return true;
		}
		return false;
	}

}
