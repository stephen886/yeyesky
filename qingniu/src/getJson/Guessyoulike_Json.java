package getJson;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import contentProvider.GetProduct;
import object.product;
import operation.GuessYouLike;

public class Guessyoulike_Json extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			Gson gson = new Gson();
			ArrayList<product> productlist = GuessYouLike.guess();
			out.println(gson.toJson(productlist));
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
