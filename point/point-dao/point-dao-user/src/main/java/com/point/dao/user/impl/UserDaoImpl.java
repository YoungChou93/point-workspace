package com.point.dao.user.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.point.dao.user.UserDao;
import com.point.entity.user.User;
import com.point.entity.user.UserPart;

public class UserDaoImpl implements UserDao {

	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	@Override
	public User selectByPrimaryKey(String uid) {
		return sessionTemplate.selectOne( "com.point.dao.user.UserDao.selectByPrimaryKey", uid);
	}

	@Override
	public User selectByMap(Map<String, Object> map) {
		return sessionTemplate.selectOne( "com.point.dao.user.UserDao.selectByMap", map);
	}

	@Override
	public int deleteByPrimaryKey(String uid) {
		return sessionTemplate.delete( "com.point.dao.user.UserDao.deleteByPrimaryKey", uid);
	}

	@Override
	public int deleteByMap(Map<String, Object> map) {
		return sessionTemplate.delete( "com.point.dao.user.UserDao.deleteByMap", map);
	}

	@Override
	public int insertSelective(User record) {
		return sessionTemplate.insert( "com.point.dao.user.UserDao.insertSelective", record);
	}

	@Override
	public int updateByPrimaryKeySelective(User record) {
		return sessionTemplate.update( "com.point.dao.user.UserDao.updateByPrimaryKeySelective", record);
	}

	@Override
	public List<User> findUser(Map<String, Object> map) {
		return sessionTemplate.selectList( "com.point.dao.user.UserDao.findUser", map);
	}

	@Override
	public Long getTotalUser(Map<String, Object> map) {
		return sessionTemplate.selectOne( "com.point.dao.user.UserDao.getTotalUser", map);
	}

	@Override
	public String getMaxID(Map<String, Object> map) {
		return sessionTemplate.selectOne( "com.point.dao.user.UserDao.getMaxID", map);
	}

	@Override
	public UserPart selectPartByPrimaryKey(String uid) {
		return sessionTemplate.selectOne( "com.point.dao.user.UserDao.selectPartByPrimaryKey", uid);
	}

	@Override
	public UserPart selectPartByMap(Map<String, Object> map) {
		return sessionTemplate.selectOne( "com.point.dao.user.UserDao.selectPartByMap", map);
	}

}
