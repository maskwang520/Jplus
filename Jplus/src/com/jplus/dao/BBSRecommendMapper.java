package com.jplus.dao;

import java.util.List;

import com.jplus.model.BBSRecommend;

/**
 * @author Chitry
 * 
 * @title 论坛版块推荐信息DAO
 * @since 2015-07-22 20:52:51
 */
public interface BBSRecommendMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(BBSRecommend record);

    int insertSelective(BBSRecommend record);

    BBSRecommend selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BBSRecommend record);

    int updateByPrimaryKey(BBSRecommend record);
    
    List<BBSRecommend> selectAll();
}