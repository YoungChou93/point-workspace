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

	@RequestMapping("/getVerifyCode")
	public void getVerifyCode(HttpServletResponse response,HttpSession httpSession) throws IOException{
		
		response.setHeader("Content-Type","image/jped");
		VerifyCode vc = new VerifyCode();
		VerifyCode.output(vc.getImage(), response.getOutputStream());
		httpSession.setAttribute("verifyCode", vc.getText());
		
		
	}
}
