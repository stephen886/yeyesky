package com.qingniu.pojo;


public class GoodDetails {
	private int detailsID;
	private String detailImg;// 图片
	private int goodID;

	public int getGoodID() {
		return goodID;
	}
	public void setGoodID(int goodID) {
		this.goodID = goodID;
	}
	public int getDetailsID() {
		return detailsID;
	}
	public void setDetailsID(int detailsID) {
		this.detailsID = detailsID;
	}
	public String getDetailImg() {
		return detailImg;
	}
	public void setDetailImg(String detailImg) {
		this.detailImg = detailImg;
	}
	@Override
	public String toString() {
		return "GoodDetails [detailsID=" + detailsID + ", detailImg="
				+ detailImg + ", goodID=" + goodID + "]";
	}
	
	
	
	
}
