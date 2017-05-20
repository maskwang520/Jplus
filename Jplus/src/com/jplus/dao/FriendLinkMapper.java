package com.jplus.dao;

import java.util.List;

import com.jplus.model.FriendLink;

/**
 * @author Chitry
 * 
 * @title 友链DAO
 * @since 2015-07-22 20:52:51
 */
public interface FriendLinkMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(FriendLink record);

    int insertSelective(FriendLink record);

    FriendLink selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(FriendLink record);

    int updateByPrimaryKey(FriendLink record);
    
    List<FriendLink> selectAll();
}