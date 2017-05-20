package com.jplus.dao;


import com.jplus.model.Closeweb;

/**
 * @author Chitry
 * 
 * @title 网站导航信息DAO
 * @since 2015-07-22 20:52:51
 */
public interface ClosewebMapper {

    Closeweb selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Closeweb record);

}