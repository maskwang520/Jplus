package com.jplus.dao;

import java.util.List;

import com.jplus.model.ToolOfficeRecommend;

/**
 * @author Chitry
 * 
 * @title 工具官方推荐信息DAO
 * @since 2015-07-22 20:52:51
 */
public interface ToolOfficeRecommendMapper {

	int deleteByPrimaryKey(Integer id);

    int insert(ToolOfficeRecommend record);

    int insertSelective(ToolOfficeRecommend record);

    ToolOfficeRecommend selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ToolOfficeRecommend record);

    int updateByPrimaryKey(ToolOfficeRecommend record);
    
    List<ToolOfficeRecommend> selectAll();
}