package com.crazy.service;

import java.util.List;
import java.util.Map;

import org.apache.solr.client.solrj.SolrServerException;

import com.crazy.domain.Store;

public interface ISolrSearch {

	/**
	 * 按商店地址搜索
	 * @param adress
	 * @return
	 */
	public Map<String,Object> searchByadress(String adress,int page);

	
	/**
	 * 按商店名称搜索
	 * @param adress
	 * @return
	 */
	public Map<String,Object> searchByname(String storename,int page);

}
