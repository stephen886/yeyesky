package com.qingniu.pojo;

import java.util.List;

/**
 * 产品对象
 * 
 */
public class Good {

	private int goodID;// 产品ID
	private String name;// 产品名称
	private String desc;// 产品描述
	private String brief;// 简介
	private GoodParameter parameter;// 产品参数
	private Catalog catalog;// 目录
	private List<GoodPreview> previews;// 预览图片路径
	private List<GoodDetails> details;// 描述图片的路径的数组
	private List<GoodStandard> standard;// 规格
	
	
	
	public int getGoodID() {
		return goodID;
	}
	public void setGoodID(int goodID) {
		this.goodID = goodID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getBrief() {
		return brief;
	}
	public void setBrief(String brief) {
		this.brief = brief;
	}
	public GoodParameter getParameter() {
		return parameter;
	}
	public void setParameter(GoodParameter parameter) {
		this.parameter = parameter;
	}
	public Catalog getCatalog() {
		return catalog;
	}
	public void setCatalog(Catalog catalog) {
		this.catalog = catalog;
	}
	public List<GoodPreview> getPreviews() {
		return previews;
	}
	public void setPreviews(List<GoodPreview> previews) {
		this.previews = previews;
	}
	public List<GoodDetails> getDetails() {
		return details;
	}
	public void setDetails(List<GoodDetails> details) {
		this.details = details;
	}
	public List<GoodStandard> getStandard() {
		return standard;
	}
	public void setStandard(List<GoodStandard> standard) {
		this.standard = standard;
	}
	@Override
	public String toString() {
		return "Good [goodID=" + goodID + ", name=" + name + ", desc=" + desc
				+ ", brief=" + brief + ", parameter=" + parameter
				+ ", catalog=" + catalog + ", previews=" + previews
				+ ", details=" + details + ", standard=" + standard + "]";
	}
	
	
	
	

}
