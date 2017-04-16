package com.point.interceptor;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.point.entity.user.User;

public class LoginUserInterceptor implements HandlerInterceptor {

	
	/* 执行完handler方法之后执行*/
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	
	/* 进入handler方法之后,返回ModelAndView之前执行*/
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	
	/* 进入handler方法之前执行*/
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		String url=request.getRequestURI();
		User user=(User) request.getSession().getAttribute("user");
		if(url.indexOf("admin")>=0 && (user==null || !user.getRole().equals((byte)0))){
			request.getSession().setAttribute("message", "没有权限");
			request.getRequestDispatcher("/jsps/error.jsp").forward(request, response);
		}

		if(url.indexOf("addpoint")>=0 && user==null){
			response.sendRedirect(request.getContextPath()+"/login.action");
		}


		return true;

		/*String url=request.getRequestURI();
		User user=(User) request.getSession().getAttribute("user");
		
		*//* session没有销毁再次登录*//*
		if(url.indexOf("login")>=0 && user!=null ){
			request.getRequestDispatcher("/jsps/main.jsp").forward(request, response);
			return false;
		}
		
		*//*  过滤登录、激活、注册、获取验证码等操作*//*
		if(url.indexOf("login")>=0 || url.indexOf("register")>=0 || url.indexOf("activate")>=0 || url.indexOf("getVerifyCode")>=0){
			return true;
		}
		

		
		if(user!=null){
			return true;
		}
		
		
		
		
		request.getRequestDispatcher("/jsps/user/login.jsp").forward(request, response);
		
		return false;*/
	}

}
