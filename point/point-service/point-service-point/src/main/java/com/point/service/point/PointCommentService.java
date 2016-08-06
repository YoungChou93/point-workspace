package com.point.service.point;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.point.entity.point.PointComment;

import net.sf.json.JSONObject;

public interface PointCommentService {
	
	/**
	 * 
	 * @brief 添加评论
	 * @param httpSession
	 * @param pointId
	 * @return
	 * @author zhouyang
	 * @throws Exception 
	 * @date 2016年3月14日 下午1:55:47
	 */
	public Map<String, Object> addPointComment(HttpSession httpSession,PointComment pointComment) throws Exception;
	
	/**
	 * 
	 * @brief 获取评论
	 * @param pointId
	 * @return
	 * @author zhouyang
	 * @date 2016年3月14日 下午1:56:11
	 */
	public JSONObject getPointComment(String pointId);
	
	/**
	 * 
	 * @brief 删除评论
	 * @param pointCommentId
	 * @return
	 * @author zhouyang
	 * @date 2016年3月14日 下午1:56:44
	 */
	public JSONObject deletePointComment(String pointCommentId);

}
