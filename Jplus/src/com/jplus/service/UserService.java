package com.jplus.service;
/*
 * author maskwang
 */
import java.util.List;



import com.jplus.model.Member;
import com.jplus.model.User;

public interface UserService {
	String delete(Integer id);

    String add(User user);
 
    User findById(Integer id);

    String update(User user);
    
    List<User> getAll();
    
    List<Member> getUserMember();
    
    User getOneUser(String username);
    
    User getUserByEmail(String email);
    
    void updateByPrimaryKey(User user);
    
    /*
     * 加分函数，传入的参数分别是要加分用户的名字和你需要加分的多少 
     * ps:此函数可以用于减分，传入的参数为负数就可以）
     */
    void addScore(String username,int score);
}
