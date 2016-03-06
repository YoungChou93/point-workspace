package com.point.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.point.entity.user.custom.UserCustom;


public interface UserService {
	
	
	/**
	 * 
	 * @brief 用户注册
	 * @param userCustom
	 * @return Map<String,Object>
	 * @author zhouyang
	 * @date 2016年3月4日 下午2:39:35
	 */
	public Map<String,Object> addUser(UserCustom userCustom,HttpSession httpSession);
	
	/**
	 * 
	 * @brief 用户激活
	 * @param activationCode
	 * @return Map<String,Object>
	 * @author zhouyang
	 * @date 2016年3月4日 下午2:41:24
	 */
	public Map<String,Object> activateUser(String activationCode);
	
	/**
	 * 
	 * @brief 用户登录
	 * @param userCustom
	 * @param httpSession
	 * @author zhouyang
	 * @date 2016年3月4日 下午2:37:35
	 */
	public Map<String,Object> login(UserCustom userCustom,HttpServletRequest httpServletRequest);
	
	/**
	 * 
	 * @brief 用户登出
	 * @param userCustom
	 * @param httpServletRequest
	 * @author zhouyang
	 * @date 2016年3月4日 下午7:31:20
	 */
	public void loginOut(HttpSession httpSession);
	
	
	
	/**
	 * 
	 * @brief 判断用户是否还在登录状态
	 * @param httpSession
	 * @author zhouyang
	 * @date 2016年3月6日 下午7:17:36
	 */
	public Map<String, Object> getOnlineExisting(HttpSession httpSession);

}
