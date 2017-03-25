package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import object.product;
import operation.GuessYouLike;

import contentProvider.GetProduct;
import utils.HttpUtil;

public class Servlet_product extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pid=HttpUtil.getIntPara(request, "pid", 41);
		ArrayList<product> guessYouLike = GuessYouLike.guess();
		request.setAttribute("guessYouLike",guessYouLike);
		request.setAttribute("product", GetProduct.getProduct(pid));
		request.getRequestDispatcher("product.jsp").forward(request, response);
		
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	
	}

}
