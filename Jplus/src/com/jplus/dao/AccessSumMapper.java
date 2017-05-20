package com.jplus.dao;

import java.util.List;

import com.jplus.model.AccessSum;

/**
 * @author Chitry
 * 
 * @title 访问量DAO
 * @since 2015-07-22 20:52:51
 */

public interface AccessSumMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(AccessSum record);

    int insertSelective(AccessSum record);
 
    AccessSum selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AccessSum record);
    
    int updateByPrimaryKey(AccessSum record);
    
    List<AccessSum> selectAll();
}