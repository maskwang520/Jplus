package com.jplus.service;

import java.util.List;

import com.jplus.model.UserLevel;
import com.jplus.model.User;

/**
 * 访问量信息 业务层接口
 * 
 * @author Chitry
 *
 */
public interface UserLevelService {

	String delete(Integer id);

    String add(UserLevel userLevel);
 
    UserLevel findById(Integer id);

    String update(UserLevel userLevel);
    
    List<UserLevel> getAll();
    
    UserLevel findUserlevel(int userlevelId);
}
