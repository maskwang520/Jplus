package com.jplus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jplus.dao.FriendLinkMapper;
import com.jplus.model.FriendLink;
import com.jplus.service.FriendLinkService;

/**
 * 友情链接信息  业务层接口实现
 * 
 * @author Chitry
 *
 */
@Service("friendLinkService")
public class FriendLinkServiceImpl implements FriendLinkService {
	
	//Dao Mapper   声明
	private FriendLinkMapper friendLinkMapper; 
	
	public FriendLinkMapper getFriendLinkMapper() {
		return friendLinkMapper;
	}
	
	@Autowired
	public void setFriendLinkMapper(FriendLinkMapper FriendLinkMapper) {
		this.friendLinkMapper = friendLinkMapper;
	}

	@Override
	public String delete(Integer id) {
		if (friendLinkMapper.deleteByPrimaryKey(id) == 1) {
			return "删除成功";
		}
		return "删除失败";
	}

	@Override
	public String add(FriendLink FriendLink) {
		if (friendLinkMapper.insertSelective(FriendLink) == 1) {
			return "添加成功";
		}
		return "添加失败";
	}

	@Override
	public FriendLink findById(Integer id) {
		
		return friendLinkMapper.selectByPrimaryKey(id);
	}

	@Override
	public String update(FriendLink FriendLink) {
		if (friendLinkMapper.updateByPrimaryKeySelective(FriendLink) == 1) {
			return "更新成功";
		}
		return "更新失败";
	}

	@Override
	public List<FriendLink> getAll() {
		return friendLinkMapper.selectAll();
	}
	
	
	
}
