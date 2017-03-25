package object;

import java.sql.Date;

/**
 * 
 * 
 * @author lyw 用户对象
 * 
 * 
 */
public class user {
	private int uid;
	private String username;
	private String passwd;
	private String Email;
	private String mobilePhone;
	private String header_img;// 图像图片路径
	private String sex;
	private Date brithday;//生日
	private String residential;//居住地址
	

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getHeader_img() {
		return header_img;
	}

	public void setHeader_img(String header_img) {
		this.header_img = header_img;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBrithday() {
		return brithday;
	}

	public void setBrithday(Date brithday) {
		this.brithday = brithday;
	}

	public String getResidential() {
		return residential;
	}

	public void setResidential(String residential) {
		this.residential = residential;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	@Override
	public String toString() {
		return "user [uid=" + uid + ", username=" + username + ", passwd="
				+ passwd + ", Email=" + Email + ", mobilePhone=" + mobilePhone
				+ ", header_img=" + header_img + ", sex=" + sex + ", brithday="
				+ brithday + ", residential=" + residential + "]";
	}

}
