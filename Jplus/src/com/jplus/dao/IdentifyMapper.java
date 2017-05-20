package com.jplus.dao;

import java.util.List;

import com.jplus.model.Identify;
import com.jplus.model.Member;

/**
 * @author Chitry
 * 
 * @title 认证DAO
 * @since 2015-07-22 20:52:51
 */
public interface IdentifyMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(Identify record);

    int insertSelective(Identify record);

    Identify selectByPrimaryKey(Integer id);
    
    Identify findByName(String uname);

    int updateByPrimaryKeySelective(Identify record);

    int updateByPrimaryKey(Identify record);
    
    List<Identify> selectAll();
    
    List<Member>getIdentifyMember();
}