package com.point.dao.point;

import java.util.List;
import java.util.Map;

import com.point.entity.point.PointComment;

public interface PointCommentDao {

	PointComment selectByPrimaryKey(String id);

	PointComment selectByMap(Map<String, Object> map);

	int deleteByPrimaryKey(String id);

	int deleteByMap(Map<String, Object> map);

	int insertSelective(PointComment record);

	int updateByPrimaryKeySelective(PointComment record);

	List<PointComment> findPointComment(Map<String, Object> map);

	Long getTotalPointComment(Map<String, Object> map);

	String getMaxID(Map<String, Object> map);
}
