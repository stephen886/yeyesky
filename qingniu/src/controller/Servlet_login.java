package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import contentProvider.GetUser;

import operation.Login;
import object.user;

public class Servlet_login extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
//http://desktop-eeg51s7:8080/qingniu/login?user_name=sfeng95&password=1qaz2wsx
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String user_name = request.getParameter("user_name");
		String passwd = request.getParameter("password");
		user auser = new user();
		auser.setUsername(user_name);
		auser.setPasswd(passwd);
		user curUser =GetUser.getUser(auser);
		if(curUser!=null){
			request.getSession().setAttribute("user_name", user_name);
			request.getSession().setAttribute("curUser", curUser);
			request.getSession().setAttribute("userinfo", GetUser.getUser(user_name));
			System.out.println(GetUser.getUser(user_name));
			out.print("success");
		}
		else{
			String why=Login.login(auser);
			out.print(why);
		}

	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

}
