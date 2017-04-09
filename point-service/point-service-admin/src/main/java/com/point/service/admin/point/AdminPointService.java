package com.point.service.admin.point;

import java.util.Map;

import net.sf.json.JSONObject;

public interface AdminPointService {
	
	
	/*管理员获取摄影点*/
	public JSONObject getPoints(String page, String rows, String city,String status);
	
	/*管理员启用摄影点（审核通过）*/
	public JSONObject enablePoints(String pointid);
	
	/*管理员删除摄影点*/
	public JSONObject deletePoint(String pointid);

}
