package com.crazy.domain;

import java.util.Date;

/**
 * �û���Ϣʵ��
 * 
 * @author asus
 * 
 */
public class UserInfo {
	private int info_id;
	private String real_name;
	private String sex;
	private Date birthday;
	private String adress;
	private String head_portrait;

	public UserInfo() {
		// TODO Auto-generated constructor stub
	}

	public int getInfo_id() {
		return info_id;
	}

	public void setInfo_id(int info_id) {
		this.info_id = info_id;
	}



	public String getReal_name() {
		return real_name;
	}

	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public String getHead_portrait() {
		return head_portrait;
	}

	public void setHead_portrait(String head_portrait) {
		this.head_portrait = head_portrait;
	}

	@Override
	public String toString() {
		return "UserInfo [info_id=" + info_id + ", real_name=" + real_name
				+ ", sex=" + sex + ", birthday=" + birthday + ", adress="
				+ adress + ", head_portrait=" + head_portrait + "]";
	}

	
}
