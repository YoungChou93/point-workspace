package com.point.dao.user;

import java.util.List;
import java.util.Map;

import com.point.entity.user.LoginRecord;


public interface LoginRecordDao {

	LoginRecord selectByPrimaryKey(String id);
    
	LoginRecord selectByMap(Map<String, Object> map);
    
    int deleteByPrimaryKey(String id);
    
    int deleteByMap( Map<String, Object> map );
    
    int insertSelective(LoginRecord record);

    int updateByPrimaryKeySelective(LoginRecord record);
    
    List<LoginRecord> findLoginRecord(  Map<String, Object> map  );
    
    Long getTotalLoginRecord( Map<String, Object> map );
    
    String getMaxID(  Map<String, Object> map  ) ;
}
