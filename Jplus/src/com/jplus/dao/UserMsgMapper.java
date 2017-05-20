package com.jplus.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jplus.model.TaskPage;
import com.jplus.model.UserMsg;


/**
 * @author Chitry
 * 
 * @title 用户信箱DAO
 * @since 2015-07-22 20:52:51
 */
public interface UserMsgMapper {

	int deleteByPrimaryKey(Integer id);

    int insert(UserMsg record);

    int insertSelective(UserMsg record);

    UserMsg selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserMsg record);

    int updateByPrimaryKey(UserMsg record);
    
    int updateById(int id);
    
    List<UserMsg> getAllById(int id);
    
    List<UserMsg> selectAll();
    
    int countNotRead(int id);
    
    int countMsg(@Param("id")int id,@Param("rign")int rign);
    
    List<UserMsg> findMsgNotRead(HashMap map);
}