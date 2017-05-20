package com.jplus.dao;

import java.util.List;

import com.jplus.model.Recruit;

/**
 * @author Chitry
 * 
 * @title 招聘信息DAO
 * @since 2015-07-22 20:52:51
 */
public interface RecruitMapper {

	int deleteByPrimaryKey(Integer id);

    int insert(Recruit record);

    int insertSelective(Recruit record);

    Recruit selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Recruit record);

    int updateByPrimaryKeyWithBLOBs(Recruit record);

    int updateByPrimaryKey(Recruit record);
    
    List<Recruit> selectAll();
}