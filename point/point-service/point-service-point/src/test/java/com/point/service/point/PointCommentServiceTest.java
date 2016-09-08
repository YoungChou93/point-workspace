package com.point.service.point;

import javax.servlet.http.HttpServletRequest;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.point.entity.point.PointComment;

public class PointCommentServiceTest {
	
	private ApplicationContext ctx = null;
	private PointCommentService pointCommentService = null;

	@Before
	public void before() {
		ctx = new ClassPathXmlApplicationContext("classpath*:applicationContext.xml");
		pointCommentService = ctx.getBean(PointCommentService.class);
	}
	
	@Test
	public void test() throws Exception{
		/*PointComment comment=new  PointComment();
		comment.setComment("22222");
		comment.setPointid("2016081500000001");
		pointCommentService.addPointComment("2016030100000001",comment);*/
		System.out.println(pointCommentService.getPointComment("1", "10", "2016081500000001"));
		
	}

}
