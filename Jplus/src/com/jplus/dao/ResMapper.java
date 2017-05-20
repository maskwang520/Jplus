package com.jplus.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jplus.model.Res;

/**
 * @author Chitry
 * 
 * @title 资源信息DAO
 * @since 2015-07-22 20:52:51
 */
public interface ResMapper {

	int deleteByPrimaryKey(Integer id);

    int insert(Res record);

    int insertSelective(Res record);

    Res selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Res record);

    int updateByPrimaryKey(Res record);
    
    List<Res> selectAll();

	List<Res> findResBysouinfo(@Param(value="resname")String resname);

	List<Res> selectAllByrid(@Param(value="id")Integer id);
}