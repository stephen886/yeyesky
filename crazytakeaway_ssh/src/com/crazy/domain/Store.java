package com.crazy.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * �̵�ʵ��
 * 
 * @author asus
 * 
 */
public class Store {

	private int store_id;
	private String store_name;
	private int start_price;
	private int express_free;
	private String contact;
	private String adress;// 特殊用处
	private String store_img;
	private StoreAdress storeAdress;
	private Set<Menu> menulist = new HashSet<Menu>();

	/**
	 * ���⹹�췽��
	 * 
	 * @param store
	 * @param adress
	 */
	public Store(Store store, StoreAdress adress) {
		store_id = store.getStore_id();
		store_name = store.getStore_name();
		start_price = store.getStart_price();
		express_free = store.getExpress_free();
		contact = store.getContact();
		store_img = store.getStore_img();
		storeAdress = adress;
	}

	public Store() {
		// TODO Auto-generated constructor stub
	}

	public int getStore_id() {
		return store_id;
	}

	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public int getStart_price() {
		return start_price;
	}

	public void setStart_price(int start_price) {
		this.start_price = start_price;
	}

	public int getExpress_free() {
		return express_free;
	}

	public void setExpress_free(int express_free) {
		this.express_free = express_free;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getStore_img() {
		return store_img;
	}

	public void setStore_img(String store_img) {
		this.store_img = store_img;
	}

	public StoreAdress getStoreAdress() {
		return storeAdress;
	}

	public void setStoreAdress(StoreAdress storeAdress) {
		this.storeAdress = storeAdress;
	}

	public Set<Menu> getMenulist() {
		return menulist;
	}

	public void setMenulist(Set<Menu> menulist) {
		this.menulist = menulist;
	}
	
	

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	@Override
	public String toString() {
		return "Store [store_id=" + store_id + ", store_name=" + store_name
				+ ", start_price=" + start_price + ", express_free="
				+ express_free + ", contact=" + contact + ", store_img="
				+ store_img + ", storeAdress=" + storeAdress.toString() + "]";
	}

}
