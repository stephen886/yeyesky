package com.qingniu.pojo;

/**
 * 产品的参数
 * 
 * @direction
 * @author 霍元甲
 */
public class GoodParameter {
	private int paramID;
	private String brand;// 商标
	private String storage;// 收藏条件
	private String shelfLife;// 保质期
	private String netVolum;// 净含量
	private String places;// 产地

	public int getParamID() {
		return paramID;
	}

	public void setParamID(int paramID) {
		this.paramID = paramID;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getStorage() {
		return storage;
	}

	public void setStorage(String storage) {
		this.storage = storage;
	}

	public String getShelfLife() {
		return shelfLife;
	}

	public void setShelfLife(String shelfLife) {
		this.shelfLife = shelfLife;
	}

	public String getNetVolum() {
		return netVolum;
	}

	public void setNetVolum(String netVolum) {
		this.netVolum = netVolum;
	}

	public String getPlaces() {
		return places;
	}

	public void setPlaces(String places) {
		this.places = places;
	}

	@Override
	public String toString() {
		return "GoodParameter [paramID=" + paramID + ", brand=" + brand
				+ ", storage=" + storage + ", shelfLife=" + shelfLife
				+ ", netVolum=" + netVolum + ", places=" + places + "]";
	}

	

}
