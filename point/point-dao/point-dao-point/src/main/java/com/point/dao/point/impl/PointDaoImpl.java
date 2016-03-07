package com.point.dao.point.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.point.dao.point.PointDao;
import com.point.entity.point.Point;

public class PointDaoImpl implements PointDao {

	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	@Override
	public Point selectByPrimaryKey(String pointid) {
		return sessionTemplate.selectOne( "com.point.dao.point.PointDao.selectByPrimaryKey", pointid);
	}

	@Override
	public Point selectByMap(Map<String, Object> map) {
		return sessionTemplate.selectOne( "com.point.dao.point.PointDao.selectByMap", map);
	}

	@Override
	public int deleteByPrimaryKey(String pointid) {
		return sessionTemplate.delete( "com.point.dao.point.PointDao.deleteByPrimaryKey", pointid);
	}

	@Override
	public int deleteByMap(Map<String, Object> map) {
		return sessionTemplate.delete( "com.point.dao.point.PointDao.deleteByMap", map);
	}

	@Override
	public int insertSelective(Point record) {
		return sessionTemplate.insert( "com.point.dao.point.PointDao.insertSelective", record);
	}

	@Override
	public int updateByPrimaryKeySelective(Point record) {
		return sessionTemplate.update( "com.point.dao.point.PointDao.updateByPrimaryKeySelective", record);
	}

	@Override
	public List<Point> findPoint(Map<String, Object> map) {
		return sessionTemplate.selectList( "com.point.dao.point.PointDao.findPoint", map);
	}

	@Override
	public Long getTotalPoint(Map<String, Object> map) {
		return sessionTemplate.selectOne( "com.point.dao.point.PointDao.getTotalPoint", map);
	}

	@Override
	public String getMaxID(Map<String, Object> map) {
		return sessionTemplate.selectOne( "com.point.dao.point.PointDao.getMaxID", map);
	}

}
