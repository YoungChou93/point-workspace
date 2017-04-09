package com.point.service.admin.user;

import net.sf.json.JSONObject;

public interface AdminUserService {
	
	/*管理员获取用户信息*/
	public JSONObject getUsers(String page,String rows,String filter);
	
	/*管理员获取在线用户信息*/
	public JSONObject getOnlineUsers(String page,String rows,String filter);
	
	/*管理员获取用户信息登录记录*/
	public JSONObject getLoginRecord(String page,String rows,String filter);

}
