package com.crazy.domain;

public class StoreCollect {
	private int store_collect_id;
	private int store_id;
	private int user_id;
	public StoreCollect() {
		super();
	}
	
	
	
	public StoreCollect(int store_id, int user_id) {
		super();
		this.store_id = store_id;
		this.user_id = user_id;
	}



	public int getStore_collect_id() {
		return store_collect_id;
	}
	public void setStore_collect_id(int store_collect_id) {
		this.store_collect_id = store_collect_id;
	}
	public int getStore_id() {
		return store_id;
	}
	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}



	@Override
	public String toString() {
		return "StoreCollect [store_collect_id=" + store_collect_id
				+ ", store_id=" + store_id + ", user_id=" + user_id + "]";
	}
	
	

}
