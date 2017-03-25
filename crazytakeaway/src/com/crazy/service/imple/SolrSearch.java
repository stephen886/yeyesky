package com.crazy.service.imple;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.crazy.domain.Store;
import com.crazy.service.ISolrSearch;

@Service
public class SolrSearch implements ISolrSearch {

	@Override
	public Map<String, Object> searchByadress(String district, int page) {
		Map<String, Object> result = new HashMap<String, Object>();
		HttpSolrServer server = new HttpSolrServer("http://localhost:8983/solr/storeadress");
		SolrQuery query = new SolrQuery();
		query.setQuery("district:" + district).setHighlight(true);
		int startindex = (page - 1) * 4;
		query.setStart(startindex);// 开始下标
		query.setRows(4);// 每一页的记录数量
		QueryResponse response = null;
		try {
			response = server.query(query);
		} catch (SolrServerException e) {
			e.printStackTrace();
		}
		SolrDocumentList list = response.getResults();
		long count = list.getNumFound();
		List<Store> storelist = new ArrayList<Store>();
		for (SolrDocument doc : list) {
			String stringid = (String) doc.get("id");
			Integer id = Integer.valueOf(stringid);
			String storename = (String) doc.get("store_name");
			String storeimg = (String) doc.get("store_img");
			Store store = new Store(id, storename, storeimg);
			storelist.add(store);
		}
		result.put("storelist", storelist);
		float aa = (float) count / 4;
		int res = (aa == (int) aa) ? (int) aa : (int) aa + 1;
		result.put("totalpage", res);
		return result;
	}

	@Override
	public Map<String, Object> searchByname(String adress, int page) {
		Map<String, Object> result = new HashMap<String, Object>();
		HttpSolrServer server = new HttpSolrServer("http://localhost:8983/solr/jcg");
		SolrQuery query = new SolrQuery();
		query.setQuery("store_name:" + adress).setHighlight(true);
		int startindex = (page - 1) * 4;
		query.setStart(startindex);// 开始下标
		query.setRows(4);// 每一页的记录数量
		// 执行查询并返回结果
		QueryResponse response = null;
		try {
			response = server.query(query);
		} catch (SolrServerException e) {
			e.printStackTrace();
		}
		// 获取匹配的所有结果
		SolrDocumentList list = response.getResults();
		long count = list.getNumFound();// 匹配结果总数
		List<Store> storelist = new ArrayList<Store>();
		for (SolrDocument doc : list) {
			String stringid = (String) doc.get("id");
			Integer id = Integer.valueOf(stringid);
			String storename = (String) doc.get("store_name");
			String storeimg = (String) doc.get("store_img");
			Store store = new Store(id, storename, storeimg);
			storelist.add(store);
		}
		result.put("storelist", storelist);
		float aa = (float) count / 4;
		int res = (aa == (int) aa) ? (int) aa : (int) aa + 1;
		result.put("totalpage", res);
		return result;
	}
}
