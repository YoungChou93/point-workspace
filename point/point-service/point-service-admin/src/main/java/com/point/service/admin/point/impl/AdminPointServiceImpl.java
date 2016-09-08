package com.point.service.admin.point.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.point.dao.point.PointDao;
import com.point.entity.point.Point;
import com.point.service.admin.point.AdminPointService;
import com.point.util.DateJsonValueProcessor;
import com.point.util.PageBean;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

public class AdminPointServiceImpl implements AdminPointService {
	
	private PointDao pointDao;

	public void setPointDao(PointDao pointDao) {
		this.pointDao = pointDao;
	}

	@Override
	public JSONObject getPoints(String page, String rows, String city, String status) {
		
		JSONObject result = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		JSONObject data = new JSONObject();
		result.put("errormsg", null);
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		map.put("city", city);
	    map.put("status", status);
		
		
		List<Point> points = pointDao.findPoint(map);
		Long total=pointDao.getTotalPoint(map);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class,
				new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
		jsonArray = JSONArray.fromObject(points, jsonConfig);
		data.put("rows", jsonArray);
		data.put("total", total);	
		result.put("data", data);
		
		return result;
	}

	@Override
	public JSONObject enablePoints(String pointid) {

		JSONObject result = new JSONObject();
		result.put("errormsg", null);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pointid", pointid);
		
		Point point=pointDao.selectByPrimaryKey(pointid);
		
		if(point==null){
			result.put("errormsg", "不存在该点");
		}
		point.setStatus(1);
		
		pointDao.updateByPrimaryKeySelective(point);
		
		return result;
	}

	@Override
	public JSONObject deletePoint(String pointid) {
		JSONObject result = new JSONObject();
		result.put("errormsg", null);
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("pointid", pointid);
		Point point=pointDao.selectByPrimaryKey(pointid);
		if(point==null){
			result.put("errormsg", "不存在该点");
		}
		point.setStatus(-1);
		
		pointDao.updateByPrimaryKeySelective(point);
		
		return result;
			
	}

}
