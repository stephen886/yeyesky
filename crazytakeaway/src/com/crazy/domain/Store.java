package com.crazy.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "Store_tb")
public class Store {

	private Integer storeID;
	private String storename;
	private Integer startPrice;
	private Integer expressFree;
	private String contact;
	private String adress;// 不用映射
	private String storeImg;
	private StoreAdress storeAdress;
	private Set<Menu> menulist = new HashSet<Menu>();

	public Store() {
		super();
		System.out.println("执行了构造Store方法");
	}
	
	
	

	public Store(Integer storeID, String storename, String storeImg) {
		super();
		this.storeID = storeID;
		this.storename = storename;
		this.storeImg = storeImg;
	}




	@Id
	@GeneratedValue
	public Integer getStoreID() {
		return storeID;
	}

	public void setStoreID(Integer storeID) {
		this.storeID = storeID;
	}

	public String getStorename() {
		return storename;
	}

	public void setStorename(String storename) {
		this.storename = storename;
	}

	public Integer getStartPrice() {
		return startPrice;
	}

	public void setStartPrice(Integer startPrice) {
		this.startPrice = startPrice;
	}

	public Integer getExpressFree() {
		return expressFree;
	}

	public void setExpressFree(Integer expressFree) {
		this.expressFree = expressFree;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	@Transient
	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public String getStoreImg() {
		return storeImg;
	}

	public void setStoreImg(String storeImg) {
		this.storeImg = storeImg;
	}

	@OneToOne
	@JoinColumn(name = "adress_ID", unique = true)
	public StoreAdress getStoreAdress() {
		return storeAdress;
	}

	public void setStoreAdress(StoreAdress storeAdress) {
		this.storeAdress = storeAdress;
	}

	// mappedBy="store" 让多的一方Menu的store属性来维护关联关系，减少sql语句，同时必须要把@JoinColumn(name
	// = "store_id")去掉
	// @JoinColumn(name = "store_id")
	@OneToMany(mappedBy = "store", cascade = { CascadeType.ALL }, fetch = FetchType.LAZY)
	public Set<Menu> getMenulist() {
		return menulist;
	}

	public void setMenulist(Set<Menu> menulist) {
		this.menulist = menulist;
	}

	@Override
	public String toString() {
		return "Store [storeID=" + storeID + ", storename=" + storename
				+ ", startPrice=" + startPrice + ", expressFree=" + expressFree
				+ ", contact=" + contact + ", storeImg=" + storeImg + "]";
	}

}
