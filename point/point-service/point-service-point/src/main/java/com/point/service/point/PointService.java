package com.point.service.point;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.point.entity.point.Point;



public interface PointService {
	
	/**
	 * 
	 * @brief 添加摄影点
	 * @param httpSession
	 * @return
	 * @author zhouyang
	 * @date 2016年3月7日 下午5:01:07
	 */
	public Map<String,Object> addPoint(HttpServletRequest httpServletRequest,MultipartFile photo,Point point);
	/**
	 * 
	 * @brief 通过城市名获取摄影点
	 * @param httpSession
	 * @param city
	 * @return
	 * @author zhouyang
	 * @date 2016年3月7日 下午5:01:32
	 */
	public Map<String,Object> getPoints(HttpSession httpSession,String city);

}
