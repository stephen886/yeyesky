package getJson;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import object.product;

import com.google.gson.Gson;

import contentProvider.GetProduct;

public class GetProduct_Json extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 * @see 接受一个html请求 @ http://stu509045:8080/qingniu/GetProduct?goods_id=1;
	 * @see 或者
	 * @see http://stu509045:8080/qingniu/GetProduct?goods_name="葡萄";
	 * @see 并返回一个product对象或一个product数组
	 * @see 存放在json里面
	 */

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String goods_name = request.getParameter("goods_name");
		String goods_id = request.getParameter("goods_id");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		if (goods_name != null) {
			byte[] bt = goods_name.getBytes("iso-8859-1");
			goods_name = new String(bt, "utf-8");
			ArrayList<product> productlist = GetProduct.getProduct(goods_name);
			// out.println("请求参数是goods_name：\n" + goods_name);
			out.println(gson.toJson(productlist));
		}

		if (goods_id != null) {
			int gid = Integer.parseInt(goods_id);
			product Product = GetProduct.getProduct(gid);
			gson.toJson(Product);
			// out.println("请求参数是：goods_id" +goods_id);
			out.println(gson.toJson(Product));
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
