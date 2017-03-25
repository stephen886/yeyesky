package contentProvider;

import java.util.ArrayList;
import java.util.List;

import utils.JdbcUtils;

public class Order {

	public static int getOid(int uid,String name,String phone,String adress){
		String sql="insert into order_user(ouid,oname,ophone,oadress) values(?,?,?,?)";
		List<Object> paras=new ArrayList<Object>();
		paras.add(uid);
		paras.add(name);
		paras.add(phone);
		paras.add(adress);
		int result=JdbcUtils.update(sql, paras);
		if (result>0) {
			String sqlString="select oid from order_user where ouid=? and oname=? and ophone=? and oadress=?"
					+ " limit 1 order by oid desc";
			List<Object> paraList=new ArrayList<Object>();
			paraList.add(uid);
			paraList.add(name);
			paraList.add(phone);
			paraList.add(adress);
			return Integer.valueOf(JdbcUtils.queryOne(sqlString, paraList).toString());
		} else {
			return 0;
		}
	}
	
	public static int addOrder(int uid,String name,String phone,String adress,int[] cid,int[] pid,int[] pmount,String[] price){
		int id=getOid(uid, name, phone, adress);
		int num=0;
		for (int i = 0; i < cid.length; i++) {
			String sql="insert into order_product(ooid,oppid,opmount,opprice) values('"+id+"',?,?,?)";
			List<Object> paras=new ArrayList<Object>();			
			paras.add(pid[i]);
			paras.add(pmount[i]);
			paras.add(price[i]);
			num+=JdbcUtils.update(sql, paras);
		}
		for (int i = 0; i < cid.length; i++) {
			String sql="delete from shopping_cart where cart_id=?";
			List<Object> paras=new ArrayList<Object>();
			paras.add(cid[i]);
			JdbcUtils.update(sql, paras);
		}
		return num;
	}
}
