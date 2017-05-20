package com.jplus.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jplus.model.Member;
import com.jplus.model.User;


/**
 * @author Chitry
 * 
 * @title 用户信息DAO
 * @since 2015-07-22 20:52:51
 */
public interface UserMapper {

	int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    List<User> selectAll();
    
    List<Member> getUserMember();
    
    User getOneUser(String name);
    
    User getUserByEmail(String email);
    
    int addScore(@Param(value="username")String username,@Param(value="score")int score);
   
    User findUserByNPL(String username,String password,String limit);

   	List<User> findAllUser();

	User findUserByuserId(@Param("id")String id);

	void deleteUserByuserId(@Param("id")String id);

	void updateScores(User user);

	void updateUserById(User user);

	User findUserBylimits(@Param("limits")int limits);
   	
   	
}