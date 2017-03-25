package com.crazy.domain;

import java.util.Date;

/**
 * 用户实体
 * 
 * @author asus
 * 
 */
public class User {
	private int user_id;
	private String user_name;
	private UserInfo uerInfo;
	private String password;
	private String repassword;
	private String email;
	private String phone;
	private String continueUrl;
	private Date cratedate;

	public User() {
		super();
		System.out.println("执行了user的构造方法");
	}

	public User(String user_name, String password) {
		super();
		this.user_name = user_name;
		this.password = password;
	}

	public User(String user_name, String password, String email, String phone) {
		super();
		this.user_name = user_name;
		this.password = password;
		this.email = email;
		this.phone = phone;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getCratedate() {
		return cratedate;
	}

	public void setCratedate(Date cratedate) {
		this.cratedate = cratedate;
	}

	public String getRepassword() {
		return repassword;
	}

	/**
	 * @return the uerInfo
	 */
	public UserInfo getUerInfo() {
		return uerInfo;
	}

	/**
	 * @param uerInfo
	 *            the uerInfo to set
	 */
	public void setUerInfo(UserInfo uerInfo) {
		this.uerInfo = uerInfo;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	public String getContinueUrl() {
		return continueUrl;
	}

	public void setContinueUrl(String continueUrl) {
		this.continueUrl = continueUrl;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_name=" + user_name
				+ ", uerInfo=" + uerInfo + ", password=" + password
				+ ", repassword=" + repassword + ", email=" + email
				+ ", phone=" + phone + ", continueUrl=" + continueUrl
				+ ", cratedate=" + cratedate + "]";
	}

	
}
