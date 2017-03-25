package com.crazy.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "UserInfo_tb")
public class UserInfo {

	
	private Integer infoID;
	private String realName;
	private String sex;
	private Date birthday;
	private String adress;
	private String head_portrait;

	@Id
	@GeneratedValue
	public Integer getInfoID() {
		return infoID;
	}

	public void setInfoID(Integer infoID) {
		this.infoID = infoID;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
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
		return "UserInfo [infoID=" + infoID + ", realName=" + realName
				+ ", sex=" + sex + ", birthday=" + birthday + ", adress="
				+ adress + ", head_portrait=" + head_portrait + "]";
	}

}
