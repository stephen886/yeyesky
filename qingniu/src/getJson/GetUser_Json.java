package getJson;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import object.product;
import object.user;

import com.google.gson.Gson;

import contentProvider.GetProduct;
import contentProvider.GetUser;

public class GetUser_Json extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String user_name = request.getParameter("uname");
		String uid = request.getParameter("uid");

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		if (user_name != null) {
			byte[] bt = user_name.getBytes("iso-8859-1");
			user_name = new String(bt, "utf-8");
			user auser = GetUser.getUser(user_name);
			out.println(gson.toJson(auser));
		}

		if (uid != null) {
			int id = Integer.parseInt(uid);
			user auser = GetUser.getUser(id);
			out.println(gson.toJson(auser));
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

}
