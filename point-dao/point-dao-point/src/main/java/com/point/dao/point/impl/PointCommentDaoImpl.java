package com.point.dao.point.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.point.dao.point.PointCommentDao;
import com.point.entity.point.PointComment;

public class PointCommentDaoImpl implements PointCommentDao {

	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	@Override
	public PointComment selectByPrimaryKey(String id) {
		return sessionTemplate.selectOne( "com.point.dao.point.PointCommentDao.selectByPrimaryKey", id);
	}

	@Override
	public PointComment selectByMap(Map<String, Object> map) {
		return sessionTemplate.selectOne( "com.point.dao.point.PointCommentDao.selectByMap", map);
	}

	@Override
	public int deleteByPrimaryKey(String id) {
		return sessionTemplate.delete( "com.point.dao.point.PointCommentDao.deleteByPrimaryKey", id);
	}

	@Override
	public int deleteByMap(Map<String, Object> map) {
		return sessionTemplate.delete( "com.point.dao.point.PointCommentDao.deleteByMap", map);
	}

	@Override
	public int insertSelective(PointComment record) {
		return sessionTemplate.insert( "com.point.dao.point.PointCommentDao.insertSelective", record);
	}

	@Override
	public int updateByPrimaryKeySelective(PointComment record) {
		return sessionTemplate.update( "com.point.dao.point.PointCommentDao.updateByPrimaryKeySelective", record);
	}

	@Override
	public List<PointComment> findPointComment(Map<String, Object> map) {
		return sessionTemplate.selectList( "com.point.dao.point.PointCommentDao.findPointComment", map);
	}

	@Override
	public Long getTotalPointComment(Map<String, Object> map) {
		return sessionTemplate.selectOne( "com.point.dao.point.PointCommentDao.getTotalPointComment", map);
	}

	@Override
	public String getMaxID(Map<String, Object> map) {
		return sessionTemplate.selectOne( "com.point.dao.point.PointCommentDao.getMaxID", map);
	}

}
