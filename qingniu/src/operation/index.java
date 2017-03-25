package operation;

import java.util.ArrayList;
import java.util.List;

import object.SildeBox;
import object.product;
import utils.JdbcUtils;
import contentProvider.GetProduct;
import contentProvider.GetSildeBox;

public class index {
	/**
	 * @param 获取首页的信息
	 *  @author 影子
	 * @return
	 */
	
	//返回首页各个分区的商品信息
	static public ArrayList<product> getIndex(){
		ArrayList<product> index=new ArrayList<product>();
		String sql="select goods_id from index_desc where field=?";
		List<Object> paras = new ArrayList<Object>();
		
		for(int i=1;i<5;i++){
			for(int j=1;j<9;j++){
				String field=i+"00"+j;
				paras.add(field);
				int gid=(Integer) JdbcUtils.queryOne(sql, paras);
//				index.put(field, GetProduct.getProduct(gid));
				index.add(GetProduct.getProduct(gid));
				
				paras.clear();
				
			}
		}
		
		
		
//		index.get("1001").getPreview_img();
//		System.out.print(index.toString());
		return index;
	}
	
	
	
	
	//返回首页图片轮播的信息
	static public ArrayList<SildeBox> getSlideBoxImg(){
		ArrayList<SildeBox> index=new ArrayList<SildeBox>();
		for(int i=1;i<5;i++){
			index.add(GetSildeBox.getSildeBox(i));
		
		}
		return index;
	}
	
}
