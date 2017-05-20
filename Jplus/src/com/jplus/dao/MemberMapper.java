package com.jplus.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jplus.model.Member;

/**
 * @author Chitry
 * 
 * @title 实验室成员信息DAO
 * @since 2015-07-22 20:52:51
 */
public interface MemberMapper {

	int deleteByPrimaryKey(Integer id);

    int insert(Member record);

    int insertSelective(Member record);

    Member selectByPrimaryKey(Integer id);
    
    Member selectByPrimary(Integer id);
    
    int updateByPrimaryKeySelective(Member record);

    int updateByPrimaryKey(Member record);
    
    List<Member> selectAll();
    
    List<Member> getIdentifyUserMember(int id);
	
	Member findMemberByuserId(@Param("id")String id);
}