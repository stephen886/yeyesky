package com.crazy.domain;

public class OrderDetails {
	/**
	 * 订单项实体
	 */

	private int details_ID;
	private int menu_standard_id;
	private int amount;
	private int original_price;
	private int real_price;
	private String privilege;
	
	
	
	
	
	public OrderDetails() {
		super();
	}




	



	public int getDetails_ID() {
		return details_ID;
	}








	public void setDetails_ID(int details_ID) {
		this.details_ID = details_ID;
	}








	/**
	 * @return the menu_standard_id
	 */
	public int getMenu_standard_id() {
		return menu_standard_id;
	}




	/**
	 * @param menu_standard_id the menu_standard_id to set
	 */
	public void setMenu_standard_id(int menu_standard_id) {
		this.menu_standard_id = menu_standard_id;
	}




	/**
	 * @return the amount
	 */
	public int getAmount() {
		return amount;
	}




	/**
	 * @param amount the amount to set
	 */
	public void setAmount(int amount) {
		this.amount = amount;
	}




	/**
	 * @return the original_price
	 */
	public int getOriginal_price() {
		return original_price;
	}




	/**
	 * @param original_price the original_price to set
	 */
	public void setOriginal_price(int original_price) {
		this.original_price = original_price;
	}




	/**
	 * @return the real_price
	 */
	public int getReal_price() {
		return real_price;
	}




	/**
	 * @param real_price the real_price to set
	 */
	public void setReal_price(int real_price) {
		this.real_price = real_price;
	}




	/**
	 * @return the privilege
	 */
	public String getPrivilege() {
		return privilege;
	}




	/**
	 * @param privilege the privilege to set
	 */
	public void setPrivilege(String privilege) {
		this.privilege = privilege;
	}




	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	
	
	
	
	
}
