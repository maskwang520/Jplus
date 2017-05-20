package com.jplus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jplus.dao.NavUrlMapper;
import com.jplus.dao.UserMapper;
import com.jplus.model.NavUrl;
import com.jplus.service.NavUrlService;

/**
 * 访问量信息  业务层接口实现
 * 
 * @author Chitry
 *
 */
@Service("navUrlService")
public class NavUrlServiceImpl implements NavUrlService {
	
	//Dao Mapper   声明
	private NavUrlMapper navUrlMapper; 
	
	public NavUrlMapper getNavUrlMapper() {
		return navUrlMapper;
	}
	
	@Autowired
	public void setNavUrlMapper(NavUrlMapper navUrlMapper) {
		this.navUrlMapper = navUrlMapper;
	}

	@Override
	public String delete(Integer id) {
		if (navUrlMapper.deleteByPrimaryKey(id) == 1) {
			return "删除成功";
		}
		return "删除失败";
	}

	@Override
	public String add(NavUrl navUrl) {
		if (navUrlMapper.insertSelective(navUrl) == 1) {
			return "添加成功";
		}
		return "添加失败";
	}

	@Override
	public NavUrl findById(Integer id) {
		
		return navUrlMapper.selectByPrimaryKey(id);
	}

	@Override
	public String update(NavUrl navUrl) {
		if (navUrlMapper.updateByPrimaryKeySelective(navUrl) == 1) {
			return "更新成功";
		}
		return "更新失败";
	}

	@Override
	public List<NavUrl> getAll() {
		return navUrlMapper.selectAll();
	}
	
	
	
}
