package contentProvider;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import object.user;
import utils.JdbcUtils;

public class GetUser {
	/**
	 * @通过这个class为user对象填充数据
	 * @并返回单个对象或一个arraylist
	 * 
	 * @author 影子
	 * 
	 * 
	 */

	/**
	 * @ 通过用户id来获取用户
	 */

	public static user getUser(int uid) {
		String sql = "select * from user  left join user_detail_userinfo on user_detail_userinfo.uid=user.uid where user.uid=?";
		List<Object> paras = new ArrayList<Object>();
		paras.add(uid);
		Map<String, Object> queryOneRow = JdbcUtils.queryOneRow(sql, paras);
		if (queryOneRow != null && queryOneRow.size() > 0) {
			user auser = new user();
			auser.setUid(uid);
			auser.setUsername((String) queryOneRow.get("u_name"));
			auser.setPasswd((String) queryOneRow.get("u_passwd"));
			auser.setEmail((String) queryOneRow.get("email"));

			auser.setMobilePhone((String) queryOneRow.get("phone"));

			auser.setSex((String) queryOneRow.get("sex"));
			auser.setHeader_img((String) queryOneRow.get("portait"));
			// auser.setBrithday((Date) queryOneRow.get("birthday"));
			auser.setResidential((String) queryOneRow.get("residential"));
			return auser;
		}

		return null;

	}

	/**
	 * @ 通过用户名来获取用户
	 */
	public static user getUser(String uname) {
		String sql = "select * from user  left join user_detail_userinfo on user_detail_userinfo.uid=user.uid where user.u_name=?";
		List<Object> paras = new ArrayList<Object>();
		paras.add(uname);
		Map<String, Object> queryOneRow = JdbcUtils.queryOneRow(sql, paras);
		if (queryOneRow != null && queryOneRow.size() > 0) {
			int uid = (Integer) queryOneRow.get("uid");
			System.out.print(uid);
			return getUser(uid);
		}
		return null;
	}
	
	public static user getUser(user user) {
		String sql = "select * from user where u_name=? and u_passwd=?";
		List<Object> paras = new ArrayList<Object>();
		paras.add(user.getUsername());
		paras.add(user.getPasswd());
		Map<String, Object> queryOneRow = JdbcUtils.queryOneRow(sql, paras);
		if (queryOneRow != null && queryOneRow.size() > 0) {
			int uid = (Integer) queryOneRow.get("uid");
			//System.out.print(uid);
			user.setUid(uid);
			return user;
		}
		return null;
	}
}
