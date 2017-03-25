package com.crazy.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name = "Shopcart_tb")
@Entity
public class Shopcart {

	private Integer cartID;// id
	private Integer userID;// 用户ID
	private Integer amount;// 数量
	private Integer menuid;// 菜单id，不要映射
	private double price;// 价格
	private Date addtTime;// 添加时间
	private Menu menu;// 所添加的菜单信息

	@Id
	@GeneratedValue
	public Integer getCartID() {
		return cartID;
	}

	public void setCartID(Integer cartID) {
		this.cartID = cartID;
	}

	public Integer getUserID() {
		return userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	@Transient
	public Integer getMenuid() {
		return menuid;
	}

	public void setMenuid(Integer menuid) {
		this.menuid = menuid;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Date getAddtTime() {
		return addtTime;
	}

	public void setAddtTime(Date addtTime) {
		this.addtTime = addtTime;
	}

	@OneToOne
	@JoinColumn(name = "menu_id")
	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	@Override
	public String toString() {
		return "Shopcart [cartID=" + cartID + ", userID=" + userID
				+ ", amount=" + amount + ", menuid=" + menuid + ", price="
				+ price + ", addtTime=" + addtTime + ", menu=" + menu + "]";
	}

}
