package com.crazy.domain;

import java.util.Date;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import com.crazy.annotation.Beemail;
import com.crazy.annotation.Beuse;

public class UserUtils {
	@Beuse
	@Pattern(regexp = "[a-zA-Z0-9]{7,9}", message = "字母和数字构成长度大于6小于10")
	@NotEmpty(message = "用户名不能为空！")
	private String userName;
	private UserInfo uerInfo;
	@Pattern(regexp = "[a-zA-Z0-9]{1,16}", message = "密码由字母和数字构成，不能超过16位")
	@NotEmpty(message = "密码不能为空！")
	private String password;
	private String repassword;// 不用映射
	@Beemail
	@NotEmpty(message = "邮箱不能为空")
	@Email(message = "邮箱格式不对")
	private String email;
	private String phone;

	public User toUser() {
		User user = new User(userName, password, repassword, email, phone);
		return user;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public UserInfo getUerInfo() {
		return uerInfo;
	}

	public void setUerInfo(UserInfo uerInfo) {
		this.uerInfo = uerInfo;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
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

}
