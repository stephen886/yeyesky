package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import object.user;
import operation.Register;

public class Servlet_register extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String act = request.getParameter("act");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
//		out.print("这是注册的servlet");

		// http://127.0.0.1:8080/qingniu/register?act=check_username&user_name=aaa
		// 检查用户名
		if (act.equals("check_username")) {
			String username = request.getParameter("user_name");
			boolean be = Register.be_user(username);
			out.print(be);
			return;
		}
//
//		// 检查邮箱
		if (act.equals("check_email")) {
			String email = request.getParameter("email");
			boolean be = Register.be_email(email);
			out.print(be);
			return;
		}
//
//		// 把数据写入数据库
		//register?act=register&user_name=aa&password=aa&user_mail=aa
		if (act.equals("register")) {
			String user_name = request.getParameter("user_name");
			String passwd = request.getParameter("password");
			String email = request.getParameter("user_mail");
			user auser = new user();
			auser.setUsername(user_name);
			auser.setPasswd(passwd);
			auser.setEmail(email);

			boolean isSuccees = Register.adduser(auser);
			out.print(isSuccees);
			return;
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
