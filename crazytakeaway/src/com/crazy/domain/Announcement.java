package com.crazy.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 商店公告
 * 
 * @direction
 * @author 霍元甲
 * @creation 2016年11月21日
 */
@Table(name = "Announcement_tb")
@Entity
public class Announcement {

	@GeneratedValue
	@Id
	private int announID;
	private int storeID;
	private String announcement;
	private Date announDate;

	public int getAnnounID() {
		return announID;
	}

	public void setAnnounID(int announID) {
		this.announID = announID;
	}

	public int getStoreID() {
		return storeID;
	}

	public void setStoreID(int storeID) {
		this.storeID = storeID;
	}

	public String getAnnouncement() {
		return announcement;
	}

	public void setAnnouncement(String announcement) {
		this.announcement = announcement;
	}

	public Date getAnnounDate() {
		return announDate;
	}

	public void setAnnounDate(Date announDate) {
		this.announDate = announDate;
	}

	@Override
	public String toString() {
		return "Announcement [announID=" + announID + ", storeID=" + storeID
				+ ", announcement=" + announcement + ", announDate="
				+ announDate + "]";
	}

}
