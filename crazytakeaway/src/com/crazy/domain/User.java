package com.crazy.domain;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "User_tb")
public class User {

	private Integer userID;
	private String userName;
	private UserInfo uerInfo;
	private String password;
	private String repassword;// 不用映射
	private String email;
	private String phone;
	private String continueUrl;// 不用映射
	private Date cratedate;

	public User(String user_name) {
		this.userName = user_name;
	}
	
	

	public User(String userName, String password, String repassword,
			String email, String phone) {
		super();
		this.userName = userName;
		this.password = password;
		this.repassword = repassword;
		this.email = email;
		this.phone = phone;
	}



	public User() {
	}

	@Id
	@GeneratedValue
	public Integer getUserID() {
		return userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@JoinColumn(name = "uerInfo_ID", unique = true)
	@OneToOne(cascade = { CascadeType.ALL }, fetch = FetchType.LAZY)
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

	@Transient
	// 不需要映射的字段
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

	@Transient
	// 不需要映射的字段
	public String getContinueUrl() {
		return continueUrl;
	}

	public void setContinueUrl(String continueUrl) {
		this.continueUrl = continueUrl;
	}

	public Date getCratedate() {
		return cratedate;
	}

	public void setCratedate(Date cratedate) {
		this.cratedate = cratedate;
	}

	@Override
	public String toString() {
		return "User [userID=" + userID + ", userName=" + userName
				+ ", uerInfo=" + uerInfo + ", password=" + password
				+ ", repassword=" + repassword + ", email=" + email
				+ ", phone=" + phone + ", continueUrl=" + continueUrl
				+ ", cratedate=" + cratedate + "]";
	}

}
