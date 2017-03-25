package utils;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MsgUtils {

	public static void showGo(HttpServletRequest request,HttpServletResponse response,String msg,String url) {
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		try {
			request.getRequestDispatcher("info.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void showBack(HttpServletRequest request,HttpServletResponse response,String msg) {
		request.setAttribute("msg", msg);
		request.setAttribute("url", "JavaScript:history.back()");
		try {
			request.getRequestDispatcher("info.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
