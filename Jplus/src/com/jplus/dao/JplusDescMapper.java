package com.jplus.dao;

import java.util.List;

import com.jplus.model.JplusDesc;


/**
 * @author Chitry
 * 
 * @title Jplus简介DAO
 * @since 2015-07-22 20:52:51
 */
public interface JplusDescMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(JplusDesc record);

    int insertSelective(JplusDesc record);

    JplusDesc selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(JplusDesc record);

    int updateByPrimaryKeyWithBLOBs(JplusDesc record);

    int updateByPrimaryKey(JplusDesc record);
    
    List<JplusDesc> selectAll();
}