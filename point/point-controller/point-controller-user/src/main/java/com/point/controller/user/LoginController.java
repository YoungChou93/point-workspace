package com.point.controller.user;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.point.util.VerifyCode;

@Controller
public class LoginController {
	
	@RequestMapping("/login")
	public ModelAndView login(){
		ModelAndView mav=new ModelAndView();
			mav.setViewName("/user/login");
		return mav;
	}
	
	
	@RequestMapping("/getVerifyCode")
	public void getVerifyCode(HttpServletResponse response,HttpSession httpSession) throws IOException{
		
		OutputStream out = response.getOutputStream();
		VerifyCode vc = new VerifyCode();
		vc.output(vc.getImage(), out);
		httpSession.setAttribute("verifyCode", vc.getText());
		
		
	}
}
