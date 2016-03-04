package com.point.service.user.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;

import com.point.dao.user.OnlineUserDao;
import com.point.dao.user.UserDao;
import com.point.entity.user.OnlineUser;
import com.point.entity.user.User;
import com.point.entity.user.custom.UserCustom;
import com.point.service.user.UserService;
import com.point.util.CommonUtils;
import com.point.util.GenerateCode;
import com.point.util.mail.SendMail;

public class UserServiceImpl implements UserService {

	private UserDao userDao;

	private OnlineUserDao onlineUserDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public void setOnlineUserDao(OnlineUserDao onlineUserDao) {
		this.onlineUserDao = onlineUserDao;
	}

	@Override
	public Map<String, Object> addUser(UserCustom userCustom, HttpSession httpSession) {

		Map<String, Object> result = new HashMap<String, Object>();
		String registerVerifyCode = (String) httpSession.getAttribute("verifyCode");

		/* 数据非空验证 */
		if (null == userCustom.getEmail() || "".equals(userCustom.getEmail()) || null == userCustom.getPassword()
				|| null == userCustom.getConfirmPassword() || "".equals(userCustom.getConfirmPassword())) {
			result.put("errorMsg", "邮箱或密码为空！");
			return result;
		}

		/* 校验验证码 */
		if (null == userCustom.getVerifyCode() || "".equals(userCustom.getVerifyCode())) {
			result.put("errorMsg", "验证码为空！");
			return result;
		}
		if (!registerVerifyCode.equals(userCustom.getVerifyCode())) {
			result.put("errorMsg", "验证码错误！");
			return result;
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", userCustom.getEmail());
		User registerUser = userDao.selectByMap(map);

		/* 校验邮箱是否已存在 */
		if (registerUser != null && registerUser.getUid() != null && !"".equals(registerUser.getUid())) {
			result.put("errorMsg", "邮箱已存在！");
			return result;
		}

		/* 校验邮用户名是否已存在 */
		map.put("nickname", userCustom.getNickname());
		registerUser = userDao.selectByMap(map);
		if (registerUser != null && registerUser.getUid() != null && !"".equals(registerUser.getUid())) {
			result.put("errorMsg", "用户名已存在！");
			return result;
		}

		
		/* 插入新用户*/
		// 设置主键
		userCustom.setUid(this.getUid());
		// 设置激活码
		userCustom.setActivationcode(CommonUtils.uuid() + CommonUtils.uuid());
		// 设置注册日期
		userCustom.setRegistertime(new Date());
		// 设置默认头像
		userCustom.setHeadpicture("/1234.jpg");

		userDao.insertSelective(userCustom);
		
		/* 发送激活邮件邮件*/
		SendMail sendMail = new SendMail();
		sendMail.send(userCustom.getEmail(),userCustom.getActivationcode());

		return result;
	}

	@Override
	public Map<String, Object> activateUser(String activationCode) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		/* 数据非空验证 */
		if (null == activationCode || "".equals(activationCode)){
			result.put("errorMsg", "激活码为空！");
			return result;
		}
		
		/* 激活码是否存在验证 */
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("activationcode", activationCode);
		User activateUser=userDao.selectByMap(map);
		if(null==activateUser || null==activateUser.getUid() || "".equals(activateUser.getUid())){
			result.put("errorMsg", "激活码有误！");
			return result;
		}
		
		/* 对应账户是否激活验证 */
		if((byte)0!=activateUser.getStatus()){
			result.put("errorMsg", "账户已激活！");
			return result;
		}
		
		
		/* 更新账户为激活状态*/
		activateUser.setStatus((byte)1);
		userDao.updateByPrimaryKeySelective(activateUser);
		
		
		return result;
	}

	@Override
	public Map<String, Object> login(UserCustom userCustom,HttpServletRequest httpServletRequest) {

		HttpSession httpSession =httpServletRequest.getSession();
		
		Map<String, Object> result = new HashMap<String, Object>();

		String loginVerifyCode = (String) httpSession.getAttribute("verifyCode");
		

		/* 数据非空验证 */
		if (null == userCustom.getEmail() || "".equals(userCustom.getEmail()) || null == userCustom.getPassword()) {
			result.put("errorMsg", "邮箱或密码为空！");
			return result;
		}

		/* 校验验证码 */
		if (null == userCustom.getVerifyCode() || "".equals(userCustom.getVerifyCode())) {
			result.put("errorMsg", "验证码为空！");
			return result;
		}
		if (!loginVerifyCode.equals(userCustom.getVerifyCode())) {
			result.put("errorMsg", "验证码错误！");
			return result;
		}

		/* 校验用户名和密码 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", userCustom.getEmail());
		User loginUser = userDao.selectByMap(map);
		if (null == loginUser || null == loginUser.getUid() || "".equals(loginUser.getUid())) {
			result.put("errorMsg", "用户名不存在！");
		} else if (!loginUser.getPassword().equals(userCustom.getPassword())) {
			result.put("errorMsg", "密码错误！");
		}
		
		/* 账号是否可用*/
		if((byte)0==loginUser.getStatus()){
			result.put("errorMsg", "账号未激活！");
		}else if((byte)2==loginUser.getStatus()){
			result.put("errorMsg", "账号已注销！");
		}
		
		/* 判断用户是否已登录*/
		
		
		
		/* 修改用户登录次数、用户最后登录时间、用户最后登录地点、增加用户积分*/
		
		
		
		/* 账号信息存入session*/
		httpSession.setAttribute("user", loginUser);
		
		/* 插入在线用户表*/
		OnlineUser onlineUser=new OnlineUser(this.getOnlineUserId());
		onlineUser.setUser(loginUser);
		onlineUser.setIpcode(httpServletRequest.getRemoteAddr());
		onlineUser.setSessionid(httpSession.getId());
		onlineUserDao.insertSelective(onlineUser);
		
		/* 插入用户登录记录表*/
		
		
		return result;

	}
	
	@Override
	public Map<String, Object> loginOut(UserCustom userCustom, HttpServletRequest httpServletRequest) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteOnlineUser(String sessionid) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sessionid", sessionid);
		onlineUserDao.deleteByMap(map);
		
	}

	private String getUid() {
		String uid = null;
		SimpleDateFormat myformat = new SimpleDateFormat("yyyyMMdd");
		String prefix = myformat.format(new Date()); // id前缀

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("prefix", prefix + "%");
		String tmp = userDao.getMaxID(map);
		if (null == tmp) {
			uid = prefix + "00000001";
		} else {
			uid = prefix + GenerateCode.Generating(Long.parseLong(tmp.substring(8)), 8);
		}
		return uid;

	}
	
	private String getOnlineUserId() {
		String onlineUserId = null;
		SimpleDateFormat myformat = new SimpleDateFormat("yyyyMMdd");
		String prefix = myformat.format(new Date()); // id前缀

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("prefix", prefix + "%");
		String tmp = onlineUserDao.getMaxID(map);
		if (null == tmp) {
			onlineUserId = prefix + "00000001";
		} else {
			onlineUserId = prefix + GenerateCode.Generating(Long.parseLong(tmp.substring(8)), 8);
		}
		return onlineUserId;

	}

	

}
