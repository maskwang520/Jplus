package com.jplus.dao;

import java.util.List;

import com.jplus.model.CrowdFunding;


/**
 * @author Chitry
 * 
 * @title 众筹赛场DAO
 * @since 2015-07-22 20:52:51
 */
public interface CrowdFundingMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(CrowdFunding record);

    int insertSelective(CrowdFunding record);

    CrowdFunding selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CrowdFunding record);

    int updateByPrimaryKeyWithBLOBs(CrowdFunding record);

    int updateByPrimaryKey(CrowdFunding record);
    
    List<CrowdFunding> selectAll();
}