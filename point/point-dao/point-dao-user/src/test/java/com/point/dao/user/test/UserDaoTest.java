package com.point.dao.user.test;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.point.dao.user.UserDao;
import com.point.entity.user.User;

public class UserDaoTest {

	private ApplicationContext ctx = null;
	private UserDao userDao = null;

	@Before
	public void before() {
		ctx = new ClassPathXmlApplicationContext("classpath*:applicationContext.xml");
		userDao = ctx.getBean(UserDao.class);
	}
	
	@Test
	public void test(){
	/*User user =new User("2016030100000001");
	user.setActivationcode("qwertyuioplkjhgf");
	user.setEmail("329088816@qq.com");
	user.setNickname("与中秋有约");
	user.setPassword("329088816");
	user.setGender((byte)0);
	user.setStatus((byte)0);
	user.setScore(0);
	user.setHeadpicture("getHeadpicture");
	user.setLogincounts(1);
	user.setRegistertime(new Date());
	user.setRole((byte)0);
	
	userDao.insertSelective(user);*/
		Map<String, Object> map=new HashMap<String,Object>();
		System.out.println(userDao.selectPartByMap(map));
	}
}
