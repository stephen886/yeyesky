package contentProvider;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import object.SildeBox;
import utils.JdbcUtils;


public class GetSildeBox {
	/**
	 * 
	 * 
	 * @param 获取图片轮播对象的信息
	 *  @author 影子
	 */
	public static SildeBox getSildeBox(int id) {
		String sql="select * from index_sildeBox where field_id=?";
		List<Object> paras = new ArrayList<Object>();
		paras.add(id);
		Map<String, Object> res = JdbcUtils.queryOneRow(sql, paras);
		SildeBox s=new SildeBox();
		s.setSid(id);
		String img="images/sildebox_img/"+(String)res.get("img");
		s.setImg(img);
		s.setUrl((String)res.get("url"));
		return s;
	}

}
