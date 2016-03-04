package com.point.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.point.entity.user.custom.UserCustom;
import com.point.service.user.UserService;
import com.point.validation.LoginValidation;
import com.point.validation.RegisterValidation;

@Controller
@RequestMapping("/user")
public class UserController {

	@Resource
	private UserService userService;

	@RequestMapping("/login")
	public ModelAndView login(HttpSession httpSession,
			@Validated(value = { LoginValidation.class }) UserCustom userCustom, BindingResult bindingResult) {

		Map<String, Object> result = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView();

		/** springMVC校验 **/
		String errorMsg = "";
		if (bindingResult.hasErrors()) {
			List<ObjectError> allErrors = bindingResult.getAllErrors();
			for (ObjectError objectError : allErrors) {
				errorMsg = errorMsg + objectError.getDefaultMessage();
			}
			mav.addObject("errorMsg", errorMsg);
			mav.addObject("userCustom", userCustom);
			mav.setViewName("/user/login");
			return mav;
		}

		result = userService.login(userCustom, httpSession);
		if (result.containsKey("errorMsg")) {
			mav.addObject("errorMsg", result.get("errorMsg"));//添加错误信息
			mav.addObject("userCustom", userCustom);//数据回显
			mav.setViewName("/user/login");//设置视图
		} else {
			mav.setViewName("/main");
		}

		return mav;
	}

	@RequestMapping("/register")
	public ModelAndView register(HttpSession httpSession,
			@Validated(value = { RegisterValidation.class }) UserCustom userCustom, BindingResult bindingResult) {
		Map<String, Object> result = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView();

		/** springMVC校验 **/
		String errorMsg = "";
		if (bindingResult.hasErrors()) {
			List<ObjectError> allErrors = bindingResult.getAllErrors();
			for (ObjectError objectError : allErrors) {
				errorMsg = errorMsg + objectError.getDefaultMessage();
			}
			mav.addObject("errorMsg", errorMsg);
			mav.addObject("registerUserCustom", userCustom);
			mav.setViewName("/user/login");
			return mav;
		}
		
		
		result = userService.addUser(userCustom, httpSession);
		if (result.containsKey("errorMsg")) {
			mav.addObject("errorMsg", result.get("errorMsg"));
			mav.addObject("registerUserCustom", userCustom);
			mav.setViewName("/user/login");
		} else {
			mav.setViewName("/user/activative");
		}

		return mav;
	}

}
