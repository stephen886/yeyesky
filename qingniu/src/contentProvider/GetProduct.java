package contentProvider;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import object.product;
import utils.HttpUtil;
import utils.JdbcUtils;

public class GetProduct {
	/**
	 * @通过这个class为产品对象填充数据
	 * @并返回单个对象或一个arraylist
	 * 
	 * @author 影子
	 * 
	 * 
	 */

	/**
	 * @通过商品ID获取商品
	 * @返回一个product对象
	 */
	@SuppressWarnings("unused")
	public static product getProduct(int goods_id) {

		product Prouct = new product();
		String sql = "select * from goods where goods_id=?;";
		List<Object> paras = new ArrayList<Object>();
		paras.add(goods_id);
		Map<String, Object> queryOneRow = JdbcUtils.queryOneRow(sql, paras);

		if (queryOneRow != null && queryOneRow.size() > 0) {
			Prouct.setGoods_id((Integer) queryOneRow.get("goods_id"));
			Prouct.setGoods_name((String) queryOneRow.get("commodity_name"));
			Prouct.setGoods_desc((String) queryOneRow.get("commodity_desc"));
			Prouct.setProduction_day((Date) queryOneRow.get("production_day"));
			Prouct.setProduction_address((String) queryOneRow
					.get("production_address"));
			Prouct.setShelf_life((Integer) queryOneRow.get("shelf_life"));
			// 找商品的预览图片
			sql = "select preview_img from goods_preview_img where goods_id=?";
			// 对图片进行处理
			List<Map<String, Object>> preview_img = JdbcUtils.query(sql, paras);
			List<String> pre_img = new ArrayList<String>();
			if (preview_img != null) {
				for (Map<String, Object> map : preview_img) {
					String img = "images/preview_img/"
							+ (String) map.get("preview_img");
					// System.out.print(img);
					pre_img.add(img);
				}
			}

			Prouct.setPreview_img(pre_img);

			// 找商品的描述图片
			sql = "select desc_img from goods_desc_img where goods_id=?;";
			// 对图片进行处理
			List<Map<String, Object>> descimg = JdbcUtils.query(sql, paras);
			List<String> desc_img = new ArrayList<String>();
			if (descimg.size() !=0) {
//				System.out.print("啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊aa");
				for (Map<String, Object> map : descimg) {
					String img = "images/desc_img/"
							+ (String) map.get("desc_img");
					desc_img.add(img);

				}
			} else {
//				System.out.print("隧道窑回复iodsgopfdg");
				paras.clear();
				paras.add(41);
				descimg = JdbcUtils.query(sql, paras);
				for (Map<String, Object> map : descimg) {
					String img = "images/desc_img/"
							+ (String) map.get("desc_img");
					desc_img.add(img);

				}

			}

			Prouct.setDesc_img(desc_img);

			// 找商品的规格
			sql = "select * from goods_specifications where goods_id=?";
			List<Map<String, Object>> specifition = JdbcUtils.query(sql, paras);
			if (descimg != null) {
				Prouct.setSpecifition(specifition);
			}

			if (descimg != null) {
				for (Map<String, Object> map : descimg) {
					String img = "images/desc_img/"
							+ (String) map.get("desc_img");
					desc_img.add(img);

				}
			}
			Prouct.setDesc_img(desc_img);

			return Prouct;
		}
		return null;

	}

	/**
	 * @通过商品名称获取商品
	 * @返回一个product对象
	 */

	public static ArrayList<product> getProduct(String goods_name) {
		if (goods_name.equals("") || goods_name == null) {
			return null;
		}

		ArrayList<product> productlist = new ArrayList<product>();
		String sql = "select goods_id from goods where commodity_name like ?;";
		List<Object> paras = new ArrayList<Object>();
		paras.add("%" + goods_name + "%");
		List<Map<String, Object>> query = JdbcUtils.query(sql, paras);
		if (query != null && query.size() > 0) {
			for (Map<String, Object> m : query) {
				int id = (Integer) m.get("goods_id");
				productlist.add(getProduct(id));
			}
			return productlist;
		}
		return null;
	}
	

	public static List<Map<String, Object>> getSearch(String goods_name){
		if (goods_name.equals("") || goods_name == null) {
			return null;
		}
		String sql = "select goods.goods_id,commodity_name,preview_img,commodity_price from goods inner join goods_preview_img on goods.goods_id=goods_preview_img.goods_id where commodity_name like ?;";
		List<Object> paras = new ArrayList<Object>();
		paras.add("%" + goods_name + "%");
		return JdbcUtils.query(sql, paras);
	}
	

}
