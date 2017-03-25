package com.crazy.domain;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Table(name = "OrderDetails_tb")
@Entity
public class OrderDetails {

	private Integer detailsID;
	private Menu menu;
	private Integer amount;
	private Integer original_price;
	private double realPrice;
	private String privilege;

	@Id
	@GeneratedValue
	public Integer getDetailsID() {
		return detailsID;
	}

	public void setDetailsID(Integer detailsID) {
		this.detailsID = detailsID;
	}

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "menu_id")
	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Integer getOriginal_price() {
		return original_price;
	}

	public void setOriginal_price(Integer original_price) {
		this.original_price = original_price;
	}

	public double getRealPrice() {
		return realPrice;
	}

	public void setRealPrice(double realPrice) {
		this.realPrice = realPrice;
	}

	public String getPrivilege() {
		return privilege;
	}

	public void setPrivilege(String privilege) {
		this.privilege = privilege;
	}

	@Override
	public String toString() {
		return "OrderDetails [detailsID=" + detailsID + ", menu=" + menu
				+ ", amount=" + amount + ", original_price=" + original_price
				+ ", realPrice=" + realPrice + ", privilege=" + privilege + "]";
	}

}
