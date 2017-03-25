package com.crazy.domain;


public class Menu {
	/**
	 * ²Λµ¥ΚµΜε
	 */
	private int menu_id;
	private String menu_name;
	private String price;
	private int sales;
	private int praise;
	private String menu_img;
	private int limit_shop;
	private String menu_tag;
	

	public Menu() {
		super();
	}

	public int getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	
	

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public int getPraise() {
		return praise;
	}

	public void setPraise(int praise) {
		this.praise = praise;
	}

	public String getMenu_img() {
		return menu_img;
	}

	public void setMenu_img(String menu_img) {
		this.menu_img = menu_img;
	}

	public int getLimit_shop() {
		return limit_shop;
	}

	public void setLimit_shop(int limit_shop) {
		this.limit_shop = limit_shop;
	}

	public String getMenu_tag() {
		return menu_tag;
	}

	public void setMenu_tag(String menu_tag) {
		this.menu_tag = menu_tag;
	}

	@Override
	public String toString() {
		return "Menu [menu_id=" + menu_id + ", menu_name=" + menu_name
				+ ", price=" + price + ", sales=" + sales + ", praise="
				+ praise + ", menu_img=" + menu_img + ", limit_shop="
				+ limit_shop + ", menu_tag=" + menu_tag + "]";
	}

	
	

	

}
