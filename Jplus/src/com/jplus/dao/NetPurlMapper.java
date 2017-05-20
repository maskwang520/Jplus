package com.jplus.dao;

import java.util.List;

import com.jplus.model.NetPurl;

/**
 * @author Chitry
 * 
 * @title 网站静态图片信息DAO
 * @since 2015-07-22 20:52:51
 */
public interface NetPurlMapper {

	int deleteByPrimaryKey(Integer id);

    int insert(NetPurl record);

    int insertSelective(NetPurl record);

    NetPurl selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(NetPurl record);

    int updateByPrimaryKey(NetPurl record);
    
    List<NetPurl> selectAll();
}