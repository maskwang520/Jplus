package com.jplus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jplus.dao.UserLevelMapper;
import com.jplus.model.UserLevel;
import com.jplus.service.UserLevelService;

/**
 * 访问量信息  业务层接口实现
 * 
 * @author Chitry
 *
 */
@Service("userLevelService")
public class UserLevelServiceImpl implements UserLevelService {
	
	//Dao Mapper   声明
	private UserLevelMapper userLevelMapper; 
	
	public UserLevelMapper getUserLevelMapper() {
		return userLevelMapper;
	}
	
	@Autowired
	public void setUserLevelMapper(UserLevelMapper userLevelMapper) {
		this.userLevelMapper = userLevelMapper;
	}

	@Override
	public String delete(Integer id) {
		if (userLevelMapper.deleteByPrimaryKey(id) == 1) {
			return "删除成功";
		}
		return "删除失败";
	}

	@Override
	public String add(UserLevel userLevel) {
		if (userLevelMapper.insertSelective(userLevel) == 1) {
			return "添加成功";
		}
		return "添加失败";
	}

	@Override
	public UserLevel findById(Integer id) {
		
		return userLevelMapper.selectByPrimaryKey(id);
	}

	@Override
	public String update(UserLevel userLevel) {
		if (userLevelMapper.updateByPrimaryKeySelective(userLevel) == 1) {
			return "更新成功";
		}
		return "更新失败";
	}

	@Override
	public List<UserLevel> getAll() {
		return userLevelMapper.selectAll();
	}

	@Override
	public UserLevel findUserlevel(int userlevelId) {
		// TODO Auto-generated method stub
		return userLevelMapper.findUserlevel(userlevelId);
	}
	
	
	
}
