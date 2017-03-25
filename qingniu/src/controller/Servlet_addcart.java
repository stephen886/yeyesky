package controller;

import getJson.ResultJSON;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import contentProvider.Cart;
import object.user;
import utils.Const;
import utils.HttpUtil;

public class Servlet_addcart extends AjaxServlet {

	/**
	 * Constructor of the object.
	 */
	public Servlet_addcart() {
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
		if (curuser==null) {
			resultJSON.setResult(Const.FAIL);
			showJson(response, resultJSON);
		}else {
			int uid=curuser.getUid();
			int pid=Integer.valueOf(request.getParameter("pid"));
			int pamount=HttpUtil.getIntPara(request, "pamount", 1);		
			
			String pprice=request.getParameter("pprice");		
			
			int result=Cart.addCart(uid, pid, pamount, pprice);
			
			if (result>0) {
				resultJSON.setResult(Const.SUCCESS);
			} else {
				resultJSON.setResult(Const.ERROR);
			}
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
