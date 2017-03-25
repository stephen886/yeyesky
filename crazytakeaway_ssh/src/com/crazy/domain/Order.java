package com.crazy.domain;

import java.util.Date;
import java.util.Set;

public class Order {
	/**
	 *¶©µ¥ΚµΜε
	 */
	private int trade_id;
	private int userid;
	private int storeid;
	private int recAdressid;
	private Date order_time;
	private ReceiverAdress recAdress;
	private Set<OrderDetails> OrderDetails;

	public int getTrade_id() {
		return trade_id;
	}

	public void setTrade_id(int trade_id) {
		this.trade_id = trade_id;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getStoreid() {
		return storeid;
	}

	public void setStoreid(int storeid) {
		this.storeid = storeid;
	}

	public int getRecAdressid() {
		return recAdressid;
	}

	public void setRecAdressid(int recAdressid) {
		this.recAdressid = recAdressid;
	}

	public Date getOrder_time() {
		return order_time;
	}

	public void setOrder_time(Date order_time) {
		this.order_time = order_time;
	}

	public Set<OrderDetails> getOrderDetails() {
		return OrderDetails;
	}

	public void setOrderDetails(Set<OrderDetails> orderDetails) {
		OrderDetails = orderDetails;
	}

	public ReceiverAdress getRecAdress() {
		return recAdress;
	}

	public void setRecAdress(ReceiverAdress recAdress) {
		this.recAdress = recAdress;
	}
	
	

}
