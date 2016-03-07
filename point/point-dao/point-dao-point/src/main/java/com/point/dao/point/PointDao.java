package com.point.dao.point;

import java.util.List;
import java.util.Map;

import com.point.entity.point.Point;

public interface PointDao {

	Point selectByPrimaryKey(String pointid);

	Point selectByMap(Map<String, Object> map);

	int deleteByPrimaryKey(String pointid);

	int deleteByMap(Map<String, Object> map);

	int insertSelective(Point record);

	int updateByPrimaryKeySelective(Point record);

	List<Point> findPoint(Map<String, Object> map);

	Long getTotalPoint(Map<String, Object> map);

	String getMaxID(Map<String, Object> map);

}
