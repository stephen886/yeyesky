package com.crazy.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Table(name = "ReceiverAdress_tb")
@Entity
public class ReceiverAdress {

	private Integer adressID;
	private User user;
	private String province;
	private String city;
	private String district;
	private String street;
	private String phone;

	@Id
	@GeneratedValue
	public Integer getAdressID() {
		return adressID;
	}

	public void setAdressID(Integer adressID) {
		this.adressID = adressID;
	}

	@OneToOne
	@JoinColumn(name = "user_id")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "ReceiverAdress [adressID=" + adressID + ", user=" + user
				+ ", province=" + province + ", city=" + city + ", district="
				+ district + ", street=" + street + ", phone=" + phone + "]";
	}

}
