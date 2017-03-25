package com.crazy.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "StoreUser_tb")
public class StoreUser {
	private Integer ID;
	private String username;
	private String password;
	private Store Store;

	@Id
	@GeneratedValue
	public Integer getID() {
		return ID;
	}

	public void setID(Integer iD) {
		ID = iD;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@JoinColumn(name = "store_id")
	@OneToOne()
	public Store getStore() {
		return Store;
	}

	public void setStore(Store store) {
		Store = store;
	}

	@Override
	public String toString() {
		return "StoreUser [ID=" + ID + ", username=" + username + ", password="
				+ password + ", Store=" + Store + "]";
	}

}
