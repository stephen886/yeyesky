package com.qingniu.pojo;

/**
 * 产品预览对象
 */
public class GoodPreview {
	private int preID;
	private String preImg;// 预览图片
	private int goodID;

	public int getGoodID() {
		return goodID;
	}

	public void setGoodID(int goodID) {
		this.goodID = goodID;
	}

	public int getPreID() {
		return preID;
	}

	public void setPreID(int preID) {
		this.preID = preID;
	}

	public String getPreImg() {
		return preImg;
	}

	public void setPreImg(String preImg) {
		this.preImg = preImg;
	}

	@Override
	public String toString() {
		return "GoodPreview [preID=" + preID + ", preImg=" + preImg
				+ ", goodID=" + goodID + "]";
	}
	
	

}
