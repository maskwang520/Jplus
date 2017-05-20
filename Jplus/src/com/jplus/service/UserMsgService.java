package com.jplus.service;

import java.util.List;

import com.jplus.model.TaskPage;
import com.jplus.model.UserMsg;
import com.jplus.model.User;

/**
 * 访问量信息 业务层接口
 * 
 * @author Chitry
 *
 */
public interface UserMsgService {

	String delete(Integer id);

    String add(UserMsg userMsg);
 
    UserMsg findById(Integer id);

    String update(UserMsg userMsg);
    
    List<UserMsg> getAll();
    
    List<UserMsg> getAllById(int id);
    
    int updateById(int id);
    
    int countNotRead(int id);
    
    TaskPage countMsg(int id,int rign,int pageNo);
    
    List<UserMsg> findMsgNotRead(int id,int rign,TaskPage taskPage);
    
}
