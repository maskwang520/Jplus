package com.jplus.dao;

import java.util.List;

import com.jplus.model.ResClass;

/**
 * @author Chitry
 * 
 * @title 资源类目DAO
 * @since 2015-07-22 20:52:51
 */
public interface ResClassMapper {

	int deleteByPrimaryKey(Integer id);

    int insert(ResClass record);

    int insertSelective(ResClass record);

    ResClass selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ResClass record);

    int updateByPrimaryKey(ResClass record);
    
    List<ResClass> selectAll();
}