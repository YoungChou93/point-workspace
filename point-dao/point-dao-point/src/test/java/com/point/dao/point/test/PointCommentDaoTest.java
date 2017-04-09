package com.point.dao.point.test;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.point.dao.point.PointCommentDao;

public class PointCommentDaoTest {
	
	private ApplicationContext ctx = null;
	private PointCommentDao pointCommentDao = null;

	@Before
	public void before() {
		ctx = new ClassPathXmlApplicationContext("classpath*:applicationContext.xml");
		pointCommentDao = ctx.getBean(PointCommentDao.class);
	}
	
	@Test
	public void test(){
		Map<String, Object> map =new HashMap<String,Object>();
		//pointCommentDao.getMaxID(null);
		pointCommentDao.findPointComment(map);
	}

}
