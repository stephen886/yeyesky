package controller;


import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import getJson.ResultJSON;

public class AjaxServlet extends HttpServlet {

	protected void showJson(HttpServletResponse response,ResultJSON resultJSON) {
		response.setContentType("text/html;charset=utf-8");
		Gson gson=new Gson();
		try {
			response.getWriter().print(gson.toJson(resultJSON));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
