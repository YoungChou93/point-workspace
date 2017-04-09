package com.point.service.point.impl;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.point.dao.point.PointCommentDao;
import com.point.entity.point.PointComment;
import com.point.entity.user.UserPart;
import com.point.service.point.PointCommentService;
import com.point.util.DateJsonValueProcessor;
import com.point.util.GenerateCode;
import com.point.util.PageBean;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

public class PointCommentServiceImpl implements PointCommentService {

	private PointCommentDao pointCommentDao;

	public void setPointCommentDao(PointCommentDao pointCommentDao) {
		this.pointCommentDao = pointCommentDao;
	}

	@Override
	public Map<String, Object> addPointComment(String uid, PointComment pointComment) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		pointComment.setId(this.getPointCommentId(pointComment.getPointid()));
		pointComment.setUser(new UserPart(uid));
		pointComment.setCreatetime(new Date());

		pointCommentDao.insertSelective(pointComment);

		return map;
	}

	@Override
	public JSONObject getPointComment(String page,String rows,String pointId) {
		JSONObject result = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		JSONObject data = new JSONObject();
		result.put("errormsg", null);
		
		Map<String, Object> map=new HashMap<String,Object>();
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		map.put("pointid", pointId);
		List<PointComment> pointComments=pointCommentDao.findPointComment(map);
		
		Long total=pointCommentDao.getTotalPointComment(map);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class,
				new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
		jsonArray = JSONArray.fromObject(pointComments, jsonConfig);
		data.put("rows", jsonArray);
		data.put("total", total);	
		result.put("data", data);
		
		return result;
	}

	@Override
	public JSONObject deletePointComment(String pointCommentId) {
		// TODO Auto-generated method stub
		return null;
	}

	private String getPointCommentId(String pointid) {
		String prefix = pointid;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("prefix", prefix + "%");
		String tmp = pointCommentDao.getMaxID(map);
		if (null == tmp) {
			pointid = prefix + "00000001";
		} else {
			pointid = prefix + GenerateCode.Generating(Long.parseLong(tmp.substring(16)), 8);
		}
		return pointid;

	}

}
