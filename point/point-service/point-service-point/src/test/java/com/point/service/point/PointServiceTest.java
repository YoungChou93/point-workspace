package com.point.service.point;

import javax.servlet.http.HttpServletRequest;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;



public class PointServiceTest {

	private ApplicationContext ctx = null;
	private PointService pointService = null;

	@Before
	public void before() {
		ctx = new ClassPathXmlApplicationContext("classpath*:applicationContext.xml");
		pointService = ctx.getBean(PointService.class);
	}
	
	@Test
	public void test(){
		HttpServletRequest httpServletRequest=null;
		httpServletRequest.getSession().getServletContext().getRealPath("/");
	}
}
