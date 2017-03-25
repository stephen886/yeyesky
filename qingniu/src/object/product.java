package object;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class product {
	/**
	 * 产品对象
	 * 
	 */
	private int goods_id;// 产品ID
	private String goods_name;// 产品名称
	private String goods_desc;// 产品描述
	private Date production_day;// 生产日期
	private int shelf_life;// 保质期（天）
	private String production_address;//生产地址
	private List<String> preview_img;// 预览图片路径
	private List<String> desc_img;// 描述图片的路径的数组
	private List<Map<String, Object>> specifition;//产品规格
	
	
	
	

	public List<Map<String, Object>> getSpecifition() {
		return specifition;
	}

	public void setSpecifition(List<Map<String, Object>> specifition) {
		this.specifition = specifition;
	}

	public int getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public String getGoods_desc() {
		return goods_desc;
	}
	public String getProduction_address() {
		return production_address;
	}

	public void setProduction_address(String production_address) {
		this.production_address = production_address;
	}

	public void setGoods_desc(String goods_desc) {
		this.goods_desc = goods_desc;
	}

	

	public Date getProduction_day() {
		return production_day;
	}

	public void setProduction_day(Date production_day) {
		this.production_day = production_day;
	}

	public int getShelf_life() {
		return shelf_life;
	}

	public void setShelf_life(int shelf_life) {
		this.shelf_life = shelf_life;
	}

	
	

	
	public List<String> getPreview_img() {
		return preview_img;
	}

	public void setPreview_img(List<String> preview_img) {
		this.preview_img = preview_img;
	}

	public List<String> getDesc_img() {
		return desc_img;
	}

	public void setDesc_img(List<String> desc_img) {
		this.desc_img = desc_img;
	}

	public String toString(){
		return this.goods_name+this.goods_desc+this.preview_img;
		
	}

}
