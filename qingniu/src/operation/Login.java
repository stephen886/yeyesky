package operation;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;

import org.omg.CORBA.Request;

import object.user;
import utils.JdbcUtils;

public class Login extends HttpServlet{

	/**
	 * 
	 * 登录操作
	 * 
	 * @param auser
	 * @return
	 */
	public static String login(user auser) {
		String sql = "select u_passwd from user where u_name=?";
		List<Object> paras = new ArrayList<Object>();
		paras.add(auser.getUsername());
		Object oo = JdbcUtils.queryOne(sql, paras);
		String why = "用户名不存在";
		if (oo != null) {
			String passwd = (String) oo;
			if (passwd.isEmpty()) {
				why = "用户名不存在";
			}
			if (!passwd.equals(auser.getPasswd())) {
				why = "密码错误";
			} else {
				why = "success";	
			}
		}

		return why;
	}

}
