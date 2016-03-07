package com.point.service.point.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.point.dao.point.PointDao;
import com.point.entity.point.Point;
import com.point.entity.user.User;
import com.point.service.point.PointService;
import com.point.util.CommonUtils;
import com.point.util.GenerateCode;

public class PointServiceImpl implements PointService {
	
	private PointDao pointDao;

	public void setPointDao(PointDao pointDao) {
		this.pointDao = pointDao;
	}

	@Override
	public Map<String, Object> addPoint(HttpServletRequest httpServletRequest,MultipartFile photo,Point point) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		HttpSession httpSession=httpServletRequest.getSession();
		User user=(User) httpSession.getAttribute("user");
		
		if(null==user){
			result.put("errorMsg", "未登陆");
			return result;
		}
		
		if(null== photo){
			result.put("errorMsg", "未上传照片");
			return result;
		}
		
		String oldFileNme=photo.getOriginalFilename();
		
		System.out.println(oldFileNme);
		
		if(null==oldFileNme || oldFileNme.length()<=0){
			result.put("errorMsg", "未上传照片");
			return result;
		}
		SimpleDateFormat myformat = new SimpleDateFormat("yyyyMMdd");
		String date=myformat.format(new Date()); // id前缀
		
		String path=httpServletRequest.getSession().getServletContext().getRealPath("/");
		
		String newFileName=date+CommonUtils.uuid()+oldFileNme.substring(oldFileNme.lastIndexOf("."));
		
		System.out.println(path+ "file\\user\\pointphoto\\" +newFileName);
		
		File newFile=new File(path+ "file\\user\\pointphoto\\" +newFileName);
		
		try {
			photo.transferTo(newFile);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("errorMsg", "照片存储失败");
			return result;
		} 
		
		//设置主键
		point.setPointid(this.getPointId());
		//设置照片路径
		point.setBigphoto("/file/pointphoto/"+newFileName);
		//设置创建人
		point.setUser(user);
		//设置创建时间
		point.setCreatetime(new Date());
		pointDao.insertSelective(point);
		
		return result;
	}

	@Override
	public Map<String, Object> getPoints(HttpSession httpSession, String city) {
		// TODO Auto-generated method stub
		return null;
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

}
