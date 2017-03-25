package com.crazy.domain;

import java.util.Date;

public class ShopcartUtils {

	private Integer menuid;
	private Integer amount;
	private double price;
	private Integer storeid;
	private Integer userid;

	public Integer getMenuid() {
		return menuid;
	}

	public void setMenuid(Integer menuid) {
		this.menuid = menuid;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Integer getStoreid() {
		return storeid;
	}

	public void setStoreid(Integer storeid) {
		this.storeid = storeid;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "ShopcartUtils [menuid=" + menuid + ", amount=" + amount
				+ ", price=" + price + ", storeid=" + storeid + ", userid="
				+ userid + "]";
	}

	public Shopcart toShopcart() {

		Shopcart shopcart = new Shopcart();
		shopcart.setUserID(userid);
		shopcart.setPrice(price);
		shopcart.setAmount(amount);

		Menu menu = new Menu();
		menu.setMenuID(menuid);
		shopcart.setMenu(menu);
		shopcart.setAddtTime(new Date());

		return shopcart;
	}

}
