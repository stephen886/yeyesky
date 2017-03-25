package controller;

import getJson.ResultJSON;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import object.user;
import utils.Const;
import contentProvider.Cart;

public class Servlet_showorder extends AjaxServlet {

	/**
	 * Constructor of the object.
	 */
	public Servlet_showorder() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cidString=request.getParameter("cid");
		String[] cidArray=cidString.split(",");
		int[] cid=new int[cidArray.length];
		for (int i = 0; i < cid.length; i++) {
			cid[i]=Integer.valueOf(cidArray[i]);
		}
//		ResultJSON resultJSON=new ResultJSON();
//		List<Map<String, Object>> result=Cart.getCartlist(cid);
//		if (result!=null) {
//			resultJSON.setResult(Const.SUCCESS);
//			resultJSON.setData(result);
//		} else {
//			resultJSON.setResult(Const.ERROR);
//		}
//		showJson(response, resultJSON);
		request.setAttribute("orderlist", Cart.getCartlist(cid));
//		response.setContentType("text/html");
//		PrintWriter out = response.getWriter();
//		out.print(Cart.getCartlist(cid));
		request.getRequestDispatcher("order.jsp").forward(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
