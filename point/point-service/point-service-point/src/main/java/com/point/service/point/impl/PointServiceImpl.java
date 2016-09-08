package com.point.service.point.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.point.dao.point.PointCommentDao;
import com.point.dao.point.PointDao;
import com.point.entity.point.Point;
import com.point.entity.user.User;
import com.point.entity.user.UserPart;
import com.point.service.point.PointService;
import com.point.util.CommonUtils;
import com.point.util.GenerateCode;

public class PointServiceImpl implements PointService {

	private PointDao pointDao;

	private PointCommentDao pointCommentDao;

	public void setPointCommentDao(PointCommentDao pointCommentDao) {
		this.pointCommentDao = pointCommentDao;
	}
	public void setPointDao(PointDao pointDao) {
		this.pointDao = pointDao;
	}

	@Override
	public Map<String, Object> addPoint(HttpServletRequest httpServletRequest, MultipartFile photo, Point point) {

		Map<String, Object> result = new HashMap<String, Object>();
		HttpSession httpSession = httpServletRequest.getSession();
		User user = (User) httpSession.getAttribute("user");

		if (null == user) {
			result.put("errorMsg", "未登陆");
			return result;
		}

		if (null == photo) {
			result.put("errorMsg", "未上传照片");
			return result;
		}

		String oldFileNme = photo.getOriginalFilename();

		if (null == oldFileNme || oldFileNme.length() <= 0) {
			result.put("errorMsg", "未上传照片");
			return result;
		}
		SimpleDateFormat myformat = new SimpleDateFormat("yyyyMMdd");
		String date = myformat.format(new Date()); // id前缀

		String path = httpServletRequest.getSession().getServletContext().getRealPath("/");

		String newFileName = date + CommonUtils.uuid() + oldFileNme.substring(oldFileNme.lastIndexOf("."));

	

		File newFile = new File(path + "file"+System.getProperty("file.separator")+"user"+System.getProperty("file.separator")+"pointphoto"+System.getProperty("file.separator") + newFileName);

		try {
			photo.transferTo(newFile);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("errorMsg", "照片存储失败");
			return result;
		}

		// 设置主键
		point.setPointid(this.getPointId());
		// 设置照片路径
		point.setBigphoto("/file/user/pointphoto/" + newFileName);
		// 设置创建人
		point.setUser(new UserPart(user.getUid()));
		// 设置创建时间
		point.setCreatetime(new Date());
		pointDao.insertSelective(point);

		return result;
	}

	@Override
	public Map<String, Object> getPoints(String number, String city,String category) {

		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("city", city);
		map.put("status", "1");//查找已通过审核的
	
		/* 类别二表示查找自己的摄影点*/
		if ("2".equals(category)) {
			map.put("uid", category);
			map.put("status", null);
		}
		
		if (!"100".equals(number)) {
			map.put("start", 0);
			map.put("size", number);
		}

		List<Point> points = pointDao.findPoint(map);

		if (null == points || points.size()<1) {
			result.put("errorMsg", city+"还没有摄影点，赶紧添加一个吧!");
		}else{
			result.put("points", points);
		}

		return result;
	}

	private String getPointId() {
		String pointid = null;
		SimpleDateFormat myformat = new SimpleDateFormat("yyyyMMdd");
		String prefix = myformat.format(new Date()); // id前缀

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("prefix", prefix + "%");
		String tmp = pointDao.getMaxID(map);
		if (null == tmp) {
			pointid = prefix + "00000001";
		} else {
			pointid = prefix + GenerateCode.Generating(Long.parseLong(tmp.substring(8)), 8);
		}
		return pointid;

	}

	@Override
	public Map<String, Object> getOnePoint(String pointid) {
		Map<String, Object> result = new HashMap<String, Object>();
		Point point =pointDao.selectByPrimaryKey(pointid);
		
		if(null==point || null==point.getPointid()){
			result.put("errorMsg", "不存在该摄影点");
		}
		
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("pointid", pointid);
		Long total=pointCommentDao.getTotalPointComment(map);
		
		result.put("point", point);
		result.put("total", total);
		
		return result;
	}

	
	@Override
	public Map<String, Object> deletePoint(String pointid,String uid) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		Point point =pointDao.selectByPrimaryKey(pointid);
		
		if(uid.equals(point.getUser().getUid())){
			pointDao.deleteByPrimaryKey(pointid);
		}else{
			result.put("errorMsg", "无删除权限");
		}
		
		return result;
	}

}
