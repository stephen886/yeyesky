package com.crazy.action;

import java.io.IOException;
import java.lang.reflect.ParameterizedType;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.crazy.domain.User;
import com.crazy.service.ICollectService;
import com.crazy.service.IStoreService;
import com.crazy.service.IUserService;
import com.crazy.service.imple.CollectService;
import com.crazy.service.imple.StoreService;
import com.crazy.service.imple.UserService;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 
 * @direction BaseAction的抽取
 * @author 霍元甲
 * @creation 2016年11月8日
 */
@Controller("baseAction")
@Scope("prototype")
public abstract class BaseAction<T> extends ActionSupport implements
		RequestAware, SessionAware, ApplicationAware, ModelDriven<T> {
	private static final long serialVersionUID = 1L;
	protected T model;

	@Override
	public T getModel() {
		ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
		Class<T> clazz = (Class<T>) pt.getActualTypeArguments()[0];
		try {
			model = (T) clazz.newInstance();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return model;
	}

	// 业务层对象
	@Resource
	protected IStoreService storeService;
	@Resource
	protected IUserService userService;
	@Resource
	protected ICollectService collectService;
	

	// 域对象
	protected Map<String, Object> request;
	protected Map<String, Object> session;
	protected Map<String, Object> application;

	@Override
	public void setApplication(Map<String, Object> application) {
		this.application = application;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	/**
	 * 拿到当前的user
	 * 
	 * @return
	 */
	public User getUser() {
		User user = (User) ActionContext.getContext().getSession().get("user");
		if (user != null) {
			return user;
		} else {
			return null;
		}
	}

	/**
	 * 向视图发送String
	 * 
	 * @param String
	 * @throws IOException
	 */
	public void PrintWriter(String String) throws IOException {
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
	public void PrintJsonString(Object obj) throws IOException {
		Gson gson = new Gson();
		String jsonString = null;
		if (obj != null) {
			jsonString = gson.toJson(obj);
		}

		PrintWriter(jsonString);
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
