package com.qingniu.pojo;

/**
 * 产品的规格
 * 
 */
public class GoodStandard {

	private int specID;
	private String specification;// 规格名称
	private String price;// 单位价格
	private int goodID;

	public int getGoodID() {
		return goodID;
	}

	public void setGoodID(int goodID) {
		this.goodID = goodID;
	}

	public int getSpecID() {
		return specID;
	}

	public void setSpecID(int specID) {
		this.specID = specID;
	}

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
	}

	
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "GoodStandard [specID=" + specID + ", specification="
				+ specification + ", price=" + price + ", goodID=" + goodID
				+ "]";
	}

	

}
