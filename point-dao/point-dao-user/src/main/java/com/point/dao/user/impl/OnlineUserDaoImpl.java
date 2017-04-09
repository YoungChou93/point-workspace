package com.point.dao.user.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.point.dao.user.OnlineUserDao;
import com.point.entity.user.OnlineUser;

public class OnlineUserDaoImpl implements OnlineUserDao {

	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	@Override
	public OnlineUser selectByPrimaryKey(String id) {
		return sessionTemplate.selectOne( "com.point.dao.user.OnlineUserDao.selectByPrimaryKey", id);
	}

	@Override
	public OnlineUser selectByMap(Map<String, Object> map) {
		return sessionTemplate.selectOne( "com.point.dao.user.OnlineUserDao.selectByMap", map);
	}

	@Override
	public int deleteByPrimaryKey(String id) {
		return sessionTemplate.delete( "com.point.dao.user.OnlineUserDao.deleteByPrimaryKey", id);
	}

	@Override
	public int deleteByMap(Map<String, Object> map) {
		return sessionTemplate.delete( "com.point.dao.user.OnlineUserDao.deleteByMap", map);
	}

	@Override
	public int insertSelective(OnlineUser record) {
		return sessionTemplate.insert( "com.point.dao.user.OnlineUserDao.insertSelective", record);
	}

	@Override
	public int updateByPrimaryKeySelective(OnlineUser record) {
		return sessionTemplate.update( "com.point.dao.user.OnlineUserDao.updateByPrimaryKeySelective", record);
	}

	@Override
	public List<OnlineUser> findOnlineUser(Map<String, Object> map) {
		return sessionTemplate.selectList( "com.point.dao.user.OnlineUserDao.findOnlineUser", map);
	}

	@Override
	public Long getTotalOnlineUser(Map<String, Object> map) {
		return sessionTemplate.selectOne( "com.point.dao.user.OnlineUserDao.getTotalOnlineUser", map);
	}

	@Override
	public String getMaxID(Map<String, Object> map) {
		return sessionTemplate.selectOne( "com.point.dao.user.OnlineUserDao.getMaxID", map);
	}

}
