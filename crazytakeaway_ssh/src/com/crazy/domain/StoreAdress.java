package com.crazy.domain;

/**
 * 閿熸暀纰夋嫹閿熻鑲ョ鎷烽敓锟� *
 * 
 * @author asus
 * 
 */
public class StoreAdress {
	private int store_id;
	private String province;
	private String city;
	private String district;
	private String street;
	private String adress;

	public StoreAdress() {
		super();

	}

	public int getStore_id() {
		return store_id;
	}

	public void setStore_id(int store_id) {
		this.store_id = store_id;
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
		adress = province + "省" + city + "市" + district + street;
		this.street = street;
	}
	
	

	public String getAdress() {
		return adress;
	}

	@Override
	public String toString() {
		return "StoreAdress [store_id=" + store_id + ", province=" + province
				+ ", city=" + city + ", district=" + district + ", street="
				+ street + "]";
	}

}
