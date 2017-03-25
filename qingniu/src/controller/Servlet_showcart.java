package controller;

import getJson.ResultJSON;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import operation.GuessYouLike;
import contentProvider.Cart;
import object.product;
import object.user;
import utils.Const;
import utils.MsgUtils;

public class Servlet_showcart extends AjaxServlet {

	/**
	 * Constructor of the object.
	 */
	public Servlet_showcart() {
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

		ResultJSON resultJSON=new ResultJSON();
		user curuser=(user) request.getSession().getAttribute("curUser");
		if (curuser!=null) {
			int uid=curuser.getUid();
			List<Map<String, Object>> cartlist=Cart.getCartlist(uid);
			if (cartlist.size()>0) {
				resultJSON.setData(cartlist);
				resultJSON.setResult(Const.SUCCESS);	
			} else {
				resultJSON.setResult(Const.FAIL);
			}
			showJson(response, resultJSON);
		} else {
			resultJSON.setResult(Const.ERROR);
			showJson(response, resultJSON);
		}
	
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
