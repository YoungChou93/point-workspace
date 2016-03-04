package com.point.controller.base;


import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.point.service.user.UserService;



public class SessionTimeOutListener implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent e) {
		System.out.println("A new session is created:"+e.getSession().getId());	
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent e) {
		HttpSession session=e.getSession();  //获取当前触发事件的session
		System.out.println("session:"+session.getId()+" is destroyed");
		ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(
				e.getSession().getServletContext());
		UserService userService = (UserService)ctx.getBean("userService");
		userService.loginOut(session);
		System.out.println("session:"+session.getId()+" is delete from Table OnlineUser");
	}

	
}
