package com.jplus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jplus.dao.UserMapper;
import com.jplus.model.Member;
import com.jplus.model.User;
import com.jplus.service.UserService;
/*
 * author maskwang
 */
@Service("userService")
public class UserServiceImpl implements UserService {

	private UserMapper userMapper;
	

	public UserMapper getUserMapper() {
		return userMapper;
	}
	@Autowired
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	@Override
	public String delete(Integer id) {
		if (userMapper.deleteByPrimaryKey(id) == 1) {
			return "删除成功";
		}
		return "删除失败";
	}

	@Override
	public String add(User user) {
		if (userMapper.insert(user) == 1) {
			return "添加成功";
		}
		return "添加失败";
	}

	@Override
	public User findById(Integer id) {
		
		return userMapper.selectByPrimaryKey(id);
	}
	/*
	 * 更新等级表userlevelid
	 */
	@Override
	public String update(User user) {
		String levelmsg=null;
		if(user.getScores()>0&&user.getScores()<41){
			user.setUserlevelId(1);
			levelmsg="你距离下一等级差"+(41-user.getScores())+"积分";
		}
		if(user.getScores()>40&&user.getScores()<71){
			user.setUserlevelId(2);
			
			levelmsg="你距离下一等级差"+(71-user.getScores())+"积分";
		}
		if(user.getScores()>70&&user.getScores()<111){
			user.setUserlevelId(3);
			levelmsg="你距离下一等级差"+(111-user.getScores())+"积分";
		}
		if(user.getScores()>110&&user.getScores()<161){
			user.setUserlevelId(4);
			levelmsg="你距离下一等级差"+(161-user.getScores())+"积分";
		}
		if(user.getScores()>160&&user.getScores()<221){
			user.setUserlevelId(5);
			levelmsg="你距离下一等级差"+(221-user.getScores())+"积分";
		}
		if(user.getScores()>220&&user.getScores()<291){
			user.setUserlevelId(6);
			levelmsg="你距离下一等级差"+(291-user.getScores())+"积分";
		}
		if(user.getScores()>290&&user.getScores()<371){
			user.setUserlevelId(7);
			levelmsg="你距离下一等级差"+(371-user.getScores())+"积分";
		}
		if(user.getScores()>370&&user.getScores()<461){
			user.setUserlevelId(8);
			levelmsg="你距离下一等级差"+(461-user.getScores())+"积分";
		}
		if(user.getScores()>460&&user.getScores()<561){
			user.setUserlevelId(9);
			levelmsg="你距离下一等级差"+(561-user.getScores())+"积分";
		}
		if(user.getScores()>560){
			user.setUserlevelId(10);
			levelmsg="你已经达到最高级啦";
		}
		 userMapper.updateByPrimaryKeySelective(user);
			return levelmsg;
		
	}

	@Override
	public List<User> getAll() {
		// TODO Auto-generated method stub
		return userMapper.selectAll();
	}
	@Override
	public List<Member> getUserMember() {
		// TODO Auto-generated method stub
		return userMapper.getUserMember();
	}
	@Override
	public User getOneUser(String username) {
		// TODO Auto-generated method stub
		return userMapper.getOneUser(username);
	}
	@Override
	public void  addScore(	String username, int score) {
		// TODO Auto-generated method stub
		  userMapper.addScore(username, score);
	}
	@Override
	public User getUserByEmail(String email) {
		
		return  userMapper.getUserByEmail(email);
	}
	
	public void updateByPrimaryKey(User user){
		 userMapper.updateByPrimaryKey(user);
	}

}
