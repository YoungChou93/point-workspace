package com.point.service.point.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.dao.DataAccessException;

import com.point.dao.point.PointCommentDao;
import com.point.entity.point.PointComment;
import com.point.entity.user.User;
import com.point.entity.user.UserPart;
import com.point.service.point.PointCommentService;
import com.point.util.DaoDataAccessException;
import com.point.util.GenerateCode;
import com.point.util.PointServiceException;

import net.sf.json.JSONObject;

public class PointCommentServiceImpl implements PointCommentService {

	private PointCommentDao pointCommentDao;

	public void setPointCommentDao(PointCommentDao pointCommentDao) {
		this.pointCommentDao = pointCommentDao;
	}

	@Override
	public Map<String, Object> addPointComment(HttpSession httpSession, PointComment pointComment) throws Exception {

		Map<String,Object> map=new HashMap<String,Object>();
		
		try {
			User user = (User) httpSession.getAttribute("user");
			pointComment.setId(this.getPointCommentId(pointComment.getPointid()));
			pointComment.setUser(new UserPart(user.getUid()));
			pointComment.setCreatetime(new Date());

			pointCommentDao.insertSelective(pointComment);
			
		} catch (DataAccessException e) {
            throw new DaoDataAccessException("Dao层出错！");
		} catch (Exception e) {
            throw new PointServiceException("Service层出错！");
		}

		return map;
	}

	@Override
	public JSONObject getPointComment(String pointId) {
		// TODO Auto-generated method stub
		return null;
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
