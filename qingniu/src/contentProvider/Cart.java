package contentProvider;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utils.JdbcUtils;

public class Cart {

	public static int addCart(int uid,int goods_id,int goods_amount,String goods_price){
		Map<String, Object> mymap=quaryCart(uid, goods_id, goods_price);
		int result=mymap.size();
		if (result>0) {
			int cid=(Integer) mymap.get("cart_id");
			String sql="update shopping_cart set goods_amount=goods_amount+?,add_date=now() where cart_id=?";
			List<Object> paras=new ArrayList<Object>();
			paras.add(goods_amount);
			paras.add(cid);
			return JdbcUtils.update(sql, paras);
		} else {
			String sql="insert into shopping_cart(uid,goods_id,goods_amount,goods_price,add_date) values(?,?,?,?,now())";
			List<Object> paras=new ArrayList<Object>();
			paras.add(uid);
			paras.add(goods_id);
			paras.add(goods_amount);
			paras.add(goods_price);
			return JdbcUtils.update(sql, paras);
		}
		
		
	}
	
	public static Map<String, Object> quaryCart(int uid,int goods_id,String goods_price){
		String sql="select cart_id from shopping_cart where uid=? and goods_id=? and goods_price=?";
		List<Object> paras=new ArrayList<Object>();
		paras.add(uid);
		paras.add(goods_id);
		paras.add(goods_price);
		return JdbcUtils.queryOneRow(sql, paras);
	}

	public static List<Map<String, Object>> getCartlist(int uid){
		String sql="select commodity_name,preview_img,shopping_cart.* from shopping_cart left join goods on shopping_cart.goods_id=goods.goods_id"
				+ " left join goods_preview_img on shopping_cart.goods_id=goods_preview_img.goods_id where uid=?";
		List<Object> paras=new ArrayList<Object>();
		paras.add(uid);
		return JdbcUtils.query(sql, paras);
	}
	
	public static List<Map<String, Object>> getCartlist(int[] cid){
		List<Map<String, Object>> result=new ArrayList();
		for (int i = 0; i < cid.length; i++) {
			String sql="select commodity_name,preview_img,shopping_cart.* from shopping_cart left join goods on shopping_cart.goods_id=goods.goods_id"
					+ " left join goods_preview_img on shopping_cart.goods_id=goods_preview_img.goods_id where cart_id=?";
			List<Object> paras=new ArrayList<Object>();
			paras.add(cid[i]);
			result.add(JdbcUtils.queryOneRow(sql, paras));
			System.out.println(JdbcUtils.queryOneRow(sql, paras));
		}
		return result;
		
	}
	
	public static int delcart(int cid){
		String sql="delete from shopping_cart where cart_id=?";
		List<Object> paras=new ArrayList<Object>();
		paras.add(cid);
		return JdbcUtils.update(sql, paras);
	}
	
	public static int updatecart(int cid,int goods_amount){
		String sql="update shopping_cart set goods_amount=? where cart_id=?";
		List<Object> paras=new ArrayList<Object>();
		paras.add(goods_amount);
		paras.add(cid);
		return JdbcUtils.update(sql, paras);
	}
	
	public static int getcartnum(int uid){
		String sql="select count(*) from shopping_cart where uid=?";
		List<Object> paras=new ArrayList<Object>();
		paras.add(uid);
		return Integer.valueOf(JdbcUtils.queryOne(sql, paras).toString());
	}

}
