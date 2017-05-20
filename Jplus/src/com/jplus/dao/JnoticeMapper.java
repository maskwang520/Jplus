package com.jplus.dao;

import java.util.List;

import com.jplus.model.Jnotice;

/**
 * @author Chitry
 * 
 * @title JPlus常务公告DAO
 * @since 2015-07-22 20:52:51
 */
public interface JnoticeMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(Jnotice record);

    int insertSelective(Jnotice record);

    Jnotice selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Jnotice record);

    int updateByPrimaryKeyWithBLOBs(Jnotice record);

    int updateByPrimaryKey(Jnotice record);
    
    List<Jnotice> selectAll();
    
    List<Jnotice> getUserJnotice();
}