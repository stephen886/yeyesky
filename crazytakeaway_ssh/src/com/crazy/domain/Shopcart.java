package com.crazy.domain;

import java.util.Date;

public class Shopcart {
	/**
	 * 购物车实体
	 * 
	 * @author asus
	 */
	private int user_shopcart_id;
	private int user_id;
	private int menu_standard_id;
	private int amount;
	private double price;
	private Date add_time;
	
	
	
	
	public Shopcart(int menu_standard_id, int amount, double price) {
		super();
		this.menu_standard_id = menu_standard_id;
		this.amount = amount;
		this.price = price;
	}

	public Shopcart() {
		super();
	}

	public int getUser_shopcart_id() {
		return user_shopcart_id;
	}

	public void setUser_shopcart_id(int user_shopcart_id) {
		this.user_shopcart_id = user_shopcart_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getMenu_standard_id() {
		return menu_standard_id;
	}

	public void setMenu_standard_id(int menu_standard_id) {
		this.menu_standard_id = menu_standard_id;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Date getAdd_time() {
		return add_time;
	}

	public void setAdd_time(Date add_time) {
		this.add_time = add_time;
	}

	@Override
	public String toString() {
		return "Shopcart [user_shopcart_id=" + user_shopcart_id + ", user_id="
				+ user_id + ", menu_standard_id=" + menu_standard_id
				+ ", amount=" + amount + ", price=" + price + ", add_time="
				+ add_time + "]";
	}

}
