package com.crazy.domain;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@Entity
@Table(name = "Menu_tb")
@JsonIgnoreProperties(value = {"store"})
public class Menu {
	private Integer menuID;
	private Store store;
	private String menuName;
	private String price;
	private Integer sales;
	private Integer praise;
	private String menuImg;
	private Integer limitShop;
	private String menuTag;

	@Id
	@GeneratedValue
	public Integer getMenuID() {
		return menuID;
	}

	public void setMenuID(Integer menuID) {
		this.menuID = menuID;
	}

	@JoinColumn(name = "store_id")
	@ManyToOne(fetch = FetchType.LAZY)
	// 设置加载策略为懒加载
	public Store getStore() {
		return store;
	}

	public void setStore(Store store) {
		this.store = store;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public Integer getSales() {
		return sales;
	}

	public void setSales(Integer sales) {
		this.sales = sales;
	}

	public Integer getPraise() {
		return praise;
	}

	public void setPraise(Integer praise) {
		this.praise = praise;
	}

	public String getMenuImg() {
		return menuImg;
	}

	public void setMenuImg(String menuImg) {
		this.menuImg = menuImg;
	}

	public Integer getLimitShop() {
		return limitShop;
	}

	public void setLimitShop(Integer limitShop) {
		this.limitShop = limitShop;
	}

	public String getMenuTag() {
		return menuTag;
	}

	public void setMenuTag(String menuTag) {
		this.menuTag = menuTag;
	}

	@Override
	public String toString() {
		return "Menu [menuID=" + menuID + ", store=" + store + ", menuName="
				+ menuName + ", price=" + price + ", sales=" + sales
				+ ", praise=" + praise + ", menuImg=" + menuImg
				+ ", limitShop=" + limitShop + ", menuTag=" + menuTag + "]";
	}

}
