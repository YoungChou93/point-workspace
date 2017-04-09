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
	public Map<String,Object> getPoints(String number,String city,String category);
	
	/**
	 * 
	 * @brief 通过id查找摄影点
	 * @param pointid
	 * @return
	 * @author zhouyang
	 * @date 2016年3月8日 下午7:41:54
	 */
	public Map<String,Object> getOnePoint(String pointid);
	
	/**
	 * 
	 * @brief 通过id删除摄影点
	 * @logic
	 * @param pointid
	 * @return
	 * @author zhouyang
	 * @date 2016年8月16日 下午9:40:33
	 */
	public Map<String,Object> deletePoint(String pointid,String uid);

}
