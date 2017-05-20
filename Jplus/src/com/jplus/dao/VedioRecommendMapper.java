package com.jplus.dao;

import java.util.List;

import com.jplus.model.VedioRecommend;


/**
 * @author Chitry
 * 
 * @title 专辑推荐信息DAO
 * @since 2015-07-22 20:52:51
 */
public interface VedioRecommendMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(VedioRecommend record);

    int insertSelective(VedioRecommend record);

    VedioRecommend selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(VedioRecommend record);

    int updateByPrimaryKey(VedioRecommend record);
    
    List<VedioRecommend> selectAll();
}