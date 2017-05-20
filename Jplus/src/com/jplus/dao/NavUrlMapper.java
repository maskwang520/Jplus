package com.jplus.dao;

import java.util.List;

import com.jplus.model.NavUrl;

/**
 * @author Chitry
 * 
 * @title 网站导航信息DAO
 * @since 2015-07-22 20:52:51
 */
public interface NavUrlMapper {

	int deleteByPrimaryKey(Integer id);

    int insert(NavUrl record);

    int insertSelective(NavUrl record);

    NavUrl selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(NavUrl record);

    int updateByPrimaryKey(NavUrl record);
    
    List<NavUrl> selectAll();
}