package com.crazy.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "storecollect_tb")
public class StoreCollect {
	private Integer ID;
	private Integer storeID;
	private Integer userID;

	
	

	public StoreCollect() {
		super();
	}

	/**
	 * 
	 * @param storeID
	 * @param userID
	 */
	public StoreCollect(Integer storeID, Integer userID) {
		super();
		this.storeID = storeID;
		this.userID = userID;
	}

	@Id
	@GeneratedValue
	public Integer getID() {
		return ID;
	}

	public void setID(Integer iD) {
		ID = iD;
	}

	public Integer getStoreID() {
		return storeID;
	}

	public void setStoreID(Integer storeID) {
		this.storeID = storeID;
	}

	public Integer getUserID() {
		return userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	@Override
	public String toString() {
		return "StoreCollect [ID=" + ID + ", storeID=" + storeID + ", userID="
				+ userID + "]";
	}

}
