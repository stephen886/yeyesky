package com.crazy.domain;

public class Announcement {
	/**
	 * 商家公告实体
	 */
	private int announ_id;
	private int store_id;
	private int announcement;
	private int announ_date;

	public int getAnnoun_id() {
		return announ_id;
	}

	public void setAnnoun_id(int announ_id) {
		this.announ_id = announ_id;
	}

	public int getStore_id() {
		return store_id;
	}

	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}

	public int getAnnouncement() {
		return announcement;
	}

	public void setAnnouncement(int announcement) {
		this.announcement = announcement;
	}

	public int getAnnoun_date() {
		return announ_date;
	}

	public void setAnnoun_date(int announ_date) {
		this.announ_date = announ_date;
	}

}
