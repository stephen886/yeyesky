package com.crazy.domain;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name = "Order_tb")
@Entity
public class Order {

	private Integer tradeID;
	private Integer userID;
	private Integer storeID;
	private Integer status;
	private Date finishedTime;
	private Date orderTime;
	private ReceiverAdress recAdress;
	private Set<OrderDetails> orderDetails;
	
	private String storeName;//不映射
	private String statu;//不映射
	private double price;//不映射

	@Id
	@GeneratedValue
	public Integer getTradeID() {
		return tradeID;
	}

	public void setTradeID(Integer tradeID) {
		this.tradeID = tradeID;
	}

	public Integer getUserID() {
		return userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	public Integer getStoreID() {
		return storeID;
	}

	public void setStoreID(Integer storeID) {
		this.storeID = storeID;
	}

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	@OneToOne(cascade = { CascadeType.ALL })
	@JoinColumn(name = "recAdress_id")
	public ReceiverAdress getRecAdress() {
		return recAdress;
	}

	public void setRecAdress(ReceiverAdress recAdress) {
		this.recAdress = recAdress;
	}

	@OneToMany(cascade = { CascadeType.ALL })
	@JoinColumn(name = "order_id")
	public Set<OrderDetails> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Set<OrderDetails> orderDetails) {
		this.orderDetails = orderDetails;
	}

	@Column(name="status",nullable=false,columnDefinition="INT default 0")
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getFinishedTime() {
		return finishedTime;
	}

	public void setFinishedTime(Date finishedTime) {
		this.finishedTime = finishedTime;
	}
	
	
	
	@Transient
	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
	@Transient
	public String getStatu() {
		return statu;
	}

	public void setStatu(String statu) {
		this.statu = statu;
	}

	@Override
	public String toString() {
		return "Order [tradeID=" + tradeID + ", userID=" + userID
				+ ", storeID=" + storeID + ", status=" + status
				+ ", finishedTime=" + finishedTime + ", orderTime=" + orderTime
				+ ", recAdress=" + recAdress + ", orderDetails=" + orderDetails
				+ "]";
	}

}
