package com.point.dao.user;

import java.util.List;
import java.util.Map;

import com.point.entity.user.OnlineUser;


public interface OnlineUserDao {
	
	OnlineUser selectByPrimaryKey(String id);
    
	OnlineUser selectByMap(Map<String, Object> map);
    
    int deleteByPrimaryKey(String id);
    
    int deleteByMap( Map<String, Object> map );
    
    int insertSelective(OnlineUser record);

    int updateByPrimaryKeySelective(OnlineUser record);
    
    List<OnlineUser> findOnlineUser(  Map<String, Object> map  );
    
    Long getTotalOnlineUser( Map<String, Object> map );
    
    String getMaxID(  Map<String, Object> map  ) ;

}
