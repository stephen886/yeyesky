package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.SendMail;

public class Servlet_SendEmail extends HttpServlet {

	/**
	 * @param 用来接受请求和发送邮件
	 * @author lyw
	 *http://127.0.0.1:8080/qingniu/SendEmail?to=651844829@qq.com&zhuti=fgfjkkh&neirong=fdgfgf
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String to = request.getParameter("to");
		String zhuti=new String(request.getParameter("zhuti").getBytes("ISO-8859-1"),"utf-8");
		String neirong=new String(request.getParameter("neirong").getBytes("ISO-8859-1"),"utf-8");

		Boolean isSend = SendMail.send(to, zhuti, neirong);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(isSend);
//		out.println("收件人" + to);
//		out.println("主题" + zhuti);
//		out.println("内容" + neirong);

	}

}
