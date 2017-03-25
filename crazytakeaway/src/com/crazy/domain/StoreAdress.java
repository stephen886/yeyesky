package com.crazy.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name = "StoreAdress_tb")
@Entity
public class StoreAdress {
	private Integer storeID;
	private String province;
	private String city;
	private String district;
	private String street;
	private String adress;// 不用映射

	@Id
	@GeneratedValue
	public Integer getStoreID() {
		return storeID;
	}

	public void setStoreID(Integer storeID) {
		this.storeID = storeID;
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
		adress = city + district + street;
		this.street = street;
	}

	@Transient
	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	@Override
	public String toString() {
		return "StoreAdress [storeID=" + storeID + ", province=" + province
				+ ", city=" + city + ", district=" + district + ", street="
				+ street + ", adress=" + adress + "]";
	}

}
