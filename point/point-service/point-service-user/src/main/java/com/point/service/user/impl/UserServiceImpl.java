package com.point.service.user.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.point.dao.user.UserDao;
import com.point.entity.user.User;
import com.point.entity.user.custom.UserCustom;
import com.point.service.user.UserService;
import com.point.util.CommonUtils;
import com.point.util.GenerateCode;
import com.point.util.mail.SendMail;

public class UserServiceImpl implements UserService {

	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
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
		
		// 发送激活邮件邮件
		SendMail sendMail = new SendMail();
		sendMail.send(userCustom.getEmail(),userCustom.getActivationcode());

		return result;
	}

	@Override
	public Map<String, Object> activateUser(String activationCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> login(UserCustom userCustom, HttpSession httpSession) {

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

		return result;

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

}
