package com.point.util.mail.test;

import org.junit.Test;

import com.point.util.mail.SendMail;

public class SendMailTest {
	
	@Test
	public void test(){
		
		SendMail sendMail = new SendMail();
		sendMail.send("1257328047@qq.com","");
		
	}

}
