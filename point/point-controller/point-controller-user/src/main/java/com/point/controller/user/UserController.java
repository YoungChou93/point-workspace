package com.point.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.json.JsonObject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.point.entity.user.User;
import com.point.entity.user.custom.UserCustom;
import com.point.service.user.UserService;
import com.point.util.ResponseUtil;
import com.point.validation.LoginValidation;
import com.point.validation.RegisterValidation;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/user")
public class UserController {

	@Resource
	private UserService userService;

	
	/**
	 * @brief 登录
	 * @param httpSession
	 * @param userCustom
	 * @param bindingResult
	 * @author zhouyang
	 * @date 2016年3月4日 下午6:56:21
	 */
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest httpServletRequest,
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

		result = userService.login(userCustom, httpServletRequest);
		if (result.containsKey("errorMsg")) {
			mav.addObject("errorMsg", result.get("errorMsg"));//添加错误信息
			mav.addObject("userCustom", userCustom);//数据回显
			mav.setViewName("/user/login");//设置视图
		} else {
			mav.setViewName("/main");
		}

		return mav;
	}

	/**
	 * 
	 * @brief 注册
	 * @param httpSession
	 * @param userCustom
	 * @param bindingResult
	 * @author zhouyang
	 * @date 2016年3月4日 下午6:56:45
	 */
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
			mav.addObject("message", "注册成功！");
			mav.addObject("content", "尊敬的"+userCustom.getNickname()+"，请到邮箱"+userCustom.getEmail()+"中查看激活邮件，若找不到邮件，可能在垃圾箱中!");
			mav.setViewName("/user/activative");//跳转到激活提示页面
		}

		return mav;
	}

	/**
	 * 
	 * @brief 激活
	 * @logic
	 * @param activationCode
	 * @author zhouyang
	 * @date 2016年3月4日 下午6:57:02
	 */
	@RequestMapping("/activate")
	public ModelAndView activate(@RequestParam(value="activationCode",required=true)String activationCode){
		Map<String, Object> result = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView();
		
		result = userService.activateUser(activationCode);
		if (result.containsKey("errorMsg")) {
			mav.addObject("errorMsg", result.get("errorMsg"));
			mav.setViewName("/user/activative");
		} else {
			mav.addObject("message", "激活成功！");
			mav.setViewName("/user/activative");
		}
		return mav;
	}
	
	/**
	 * 
	 * @brief 退出登录
	 * @param httpSession
	 * @return
	 * @author zhouyang
	 * @date 2016年3月9日 下午9:01:20
	 */
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession httpSession){
		ModelAndView mav = new ModelAndView();
		
		userService.loginOut(httpSession);
		mav.setViewName("/user/login");
		
		return mav;
	}
	
	@RequestMapping("/getUserInfo")
	public ModelAndView getUserInfo(HttpSession httpSession){
        ModelAndView mav = new ModelAndView();
		
		User user=(User) httpSession.getAttribute("user");
		mav.addObject(user);
		mav.setViewName("/user/userinfo");
		
		return mav;
	}
	
	
	@RequestMapping("/timer")
	public String timer(HttpSession httpSession, HttpServletResponse response) throws Exception{
		Map<String, Object> restlt=userService.getOnlineExisting(httpSession);
		JSONObject jsonObject=new JSONObject();
		if(restlt.containsKey("success")){
			jsonObject.put("success", true);
		}else{
			jsonObject.put("success", false);
		}
		ResponseUtil.write(response,jsonObject);
		return null;
	}
	
}
