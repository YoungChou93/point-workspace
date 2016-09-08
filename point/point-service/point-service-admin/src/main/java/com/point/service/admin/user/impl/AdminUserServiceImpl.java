package com.point.service.admin.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.point.dao.user.LoginRecordDao;
import com.point.dao.user.OnlineUserDao;
import com.point.dao.user.UserDao;
import com.point.entity.point.Point;
import com.point.entity.user.LoginRecord;
import com.point.entity.user.OnlineUser;
import com.point.entity.user.User;
import com.point.service.admin.user.AdminUserService;
import com.point.util.DateJsonValueProcessor;
import com.point.util.PageBean;
import com.point.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

public class AdminUserServiceImpl implements AdminUserService {
	
	private UserDao userDao;
	
	private OnlineUserDao onlineUserDao;
	
	private LoginRecordDao loginRecordDao;

	public void setOnlineUserDao(OnlineUserDao onlineUserDao) {
		this.onlineUserDao = onlineUserDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public void setLoginRecordDao(LoginRecordDao loginRecordDao) {
		this.loginRecordDao = loginRecordDao;
	}

	@Override
	public JSONObject getUsers(String page, String rows, String filter) {
		JSONObject result = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		JSONObject data = new JSONObject();
		result.put("errormsg", null);
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		map.put("filter", StringUtil.formatLike(filter));

		List<User> users = userDao.findUser(map);
		Long total=userDao.getTotalUser(map);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class,
				new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
		jsonArray = JSONArray.fromObject(users, jsonConfig);
		data.put("rows", jsonArray);
		data.put("total", total);	
		result.put("data", data);
		
		return result;
	}



	@Override
	public JSONObject getOnlineUsers(String page, String rows, String filter) {
		JSONObject result = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		JSONObject data = new JSONObject();
		result.put("errormsg", null);
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		map.put("filter", StringUtil.formatLike(filter));

		List<OnlineUser> onlineUsers = onlineUserDao.findOnlineUser(map);
		Long total=onlineUserDao.getTotalOnlineUser(map);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class,
				new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
		jsonArray = JSONArray.fromObject(onlineUsers, jsonConfig);
		
		for(int i=0;i<jsonArray.size();i++){
			JSONObject jsonObject=jsonArray.getJSONObject(i);
			JSONObject user=(JSONObject) jsonObject.get("user");
			jsonObject.put("email", user.getString("email"));
			jsonObject.put("lasttime", user.getString("lasttime"));
			jsonObject.put("role", user.getString("role"));
		}
		
		data.put("rows", jsonArray);
		data.put("total", total);	
		result.put("data", data);
		
		return result;
	}

	@Override
	public JSONObject getLoginRecord(String page, String rows, String filter) {
		JSONObject result = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		JSONObject data = new JSONObject();
		result.put("errormsg", null);
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		map.put("filter", StringUtil.formatLike(filter));

		List<LoginRecord> loginRecords = loginRecordDao.findLoginRecord(map);
		Long total=loginRecordDao.getTotalLoginRecord(map);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class,
				new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
		jsonArray = JSONArray.fromObject(loginRecords, jsonConfig);
		data.put("rows", jsonArray);
		data.put("total", total);	
		result.put("data", data);
		
		return result;
	}

}
