package com.jplus.dao;

import java.util.List;

import com.jplus.model.UserLevel;

/**
 * @author Chitry
 * 
 * @title 积分等级信息DAO
 * @since 2015-07-22 20:52:51
 */
public interface UserLevelMapper {

	int deleteByPrimaryKey(Integer id);

    int insert(UserLevel record);

    int insertSelective(UserLevel record);

    UserLevel selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserLevel record);

    int updateByPrimaryKey(UserLevel record);
    
    List<UserLevel> selectAll();

	UserLevel findUserlevel(int userlevelId);
}