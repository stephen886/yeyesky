package com.crazy.utils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;

/**
 * HttpServlets工具类
 * 
 * @author lyw
 * 
 */
public class ServletUtils {
	/**
	 * 向视图发送String
	 * 
	 * @param String
	 * @throws IOException
	 */
	public static void PrintWriter(String String) throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		java.io.PrintWriter out = response.getWriter();
		out.println(String);
		out.flush();
		out.close();
	}

	/**
	 * 向视图发送jsonString
	 * 
	 * @param jsonString
	 * @throws IOException
	 */
	public static void PrintJsonString(Object obj) throws IOException {
		Gson gson = new Gson();
		String jsonString = null;
		if (obj != null) {
			jsonString = gson.toJson(obj);
		}

		PrintWriter(jsonString);
	}

	/**
	 * 对字符转码
	 * 
	 * @param str
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String getBytesUTF_8(String str)
			throws UnsupportedEncodingException {
		if (str != null) {
			str = new String(str.getBytes("iso-8859-1"), "UTF-8");
			return str;
		}
		return null;
	}

	/**
	 * 把对象转成JsonString
	 * 
	 * @param obj
	 * @return
	 */
	public String toJson(Object obj) {
		Gson gson = new Gson();
		if (obj != null) {
			return gson.toJson(obj);
		}
		return null;
	}

}
