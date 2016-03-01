package com.point.dao.user.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.point.dao.user.LoginRecordDao;
import com.point.entity.user.LoginRecord;

public class LoginRecordDaoImpl implements LoginRecordDao {

	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	@Override
	public LoginRecord selectByPrimaryKey(String id) {
		return sessionTemplate.selectOne( "com.point.dao.user.LoginRecordDao.selectByPrimaryKey", id);
	}

	@Override
	public LoginRecord selectByMap(Map<String, Object> map) {
		return sessionTemplate.selectOne( "com.point.dao.user.LoginRecordDao.selectByMap", map);
	}

	@Override
	public int deleteByPrimaryKey(String id) {
		return sessionTemplate.delete( "com.point.dao.user.LoginRecordDao.deleteByPrimaryKey", id);
	}

	@Override
	public int deleteByMap(Map<String, Object> map) {
		return sessionTemplate.delete( "com.point.dao.user.LoginRecordDao.deleteByMap", map);
	}

	@Override
	public int insertSelective(LoginRecord record) {
		return sessionTemplate.insert( "com.point.dao.user.LoginRecordDao.insertSelective", record);
	}

	@Override
	public int updateByPrimaryKeySelective(LoginRecord record) {
		return sessionTemplate.update( "com.point.dao.user.LoginRecordDao.updateByPrimaryKeySelective", record);
	}

	@Override
	public List<LoginRecord> findLoginRecord(Map<String, Object> map) {
		return sessionTemplate.selectList( "com.point.dao.user.LoginRecordDao.findLoginRecord", map);
	}

	@Override
	public Long getTotalLoginRecord(Map<String, Object> map) {
		return sessionTemplate.selectOne( "com.point.dao.user.LoginRecordDao.getTotalLoginRecord", map);
	}

	@Override
	public String getMaxID(Map<String, Object> map) {
		return sessionTemplate.selectOne( "com.point.dao.user.LoginRecordDao.getMaxID", map);
	}

}
