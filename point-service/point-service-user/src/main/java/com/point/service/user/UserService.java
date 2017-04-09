package com.point.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.point.entity.user.User;
import com.point.entity.user.custom.UserCustom;

import net.sf.json.JSONObject;


public interface UserService {
	
	
	/**
	 * 
	 * @brief 用户注册
	 * @param userCustom
	 * @return Map<String,Object>
	 * @author zhouyang
	 * @date 2016年3月4日 下午2:39:35
	 */
	public Map<String,Object> addUser(UserCustom userCustom,HttpSession httpSession)throws Exception;
	
	/**
	 * 
	 * @brief 用户激活
	 * @param activationCode
	 * @return Map<String,Object>
	 * @author zhouyang
	 * @date 2016年3月4日 下午2:41:24
	 */
	public Map<String,Object> activateUser(String activationCode)throws Exception;
	
	/**
	 * 
	 * @brief 用户登录
	 * @param userCustom
	 * @param httpSession
	 * @author zhouyang
	 * @date 2016年3月4日 下午2:37:35
	 */
	public Map<String,Object> login(UserCustom userCustom,HttpServletRequest httpServletRequest)throws Exception;
	
	/**
	 * 
	 * @brief 用户登出
	 * @param userCustom
	 * @param httpServletRequest
	 * @author zhouyang
	 * @date 2016年3月4日 下午7:31:20
	 */
	public void loginOut(HttpSession httpSession)throws Exception;
	
	
	
	/**
	 * 
	 * @brief 判断用户是否还在登录状态
	 * @param httpSession
	 * @author zhouyang
	 * @date 2016年3月6日 下午7:17:36
	 */
	public Map<String, Object> getOnlineExisting(HttpSession httpSession)throws Exception;
	
	
	/**
	 * 
	 * @brief 修改密码
	 * @param httpSession
	 * @param userCustom
	 * @return
	 * @author zhouyang
	 * @date 2016年3月12日 下午2:04:59
	 */
	public  Map<String, Object> modifyPassword(HttpSession httpSession,UserCustom userCustom)throws Exception;
	/**
	 * 
	 * @brief 修改头像
	 * @param httpSession
	 * @param headpicture
	 * @return
	 * @author zhouyang
	 * @date 2016年3月12日 下午2:05:15
	 */
	public  Map<String, Object> modifyHeadPicture(HttpSession httpSession,String headpicture)throws Exception;
	
	/**
	 * 
	 * @brief 修改基本信息
	 * @param httpSession
	 * @param user
	 * @return
	 * @author zhouyang
	 * @date 2016年3月12日 下午2:05:33
	 */
	public  Map<String, Object> modifyUserInfo(HttpSession httpSession,User user)throws Exception;

}
