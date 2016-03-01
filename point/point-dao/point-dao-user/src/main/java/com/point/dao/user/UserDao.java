package com.point.dao.user;

import java.util.List;
import java.util.Map;

import com.point.entity.user.User;

public interface UserDao {

    User selectByPrimaryKey(String uid);
    
    User selectByMap(Map<String, Object> map);
    
    int deleteByPrimaryKey(String uid);
    
    int deleteByMap( Map<String, Object> map );
    
    int insertSelective(User record);

    int updateByPrimaryKeySelective(User record);
    
    List<User> findUser(  Map<String, Object> map  );
    
    Long getTotalUser( Map<String, Object> map );
    
    String getMaxID(  Map<String, Object> map  ) ;

}
