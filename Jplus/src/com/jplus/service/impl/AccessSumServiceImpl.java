package com.jplus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jplus.dao.AccessSumMapper;
import com.jplus.dao.UserMapper;
import com.jplus.model.AccessSum;
import com.jplus.service.AccessSumService;

/**
 * 访问量信息  业务层接口实现
 * 
 * @author Chitry
 *
 */
@Service("accessSumService")
public class AccessSumServiceImpl implements AccessSumService {
	
	//Dao Mapper   声明
	private AccessSumMapper accessSumMapper; 
	
	public AccessSumMapper getAccessSumMapper() {
		return accessSumMapper;
	}
	
	@Autowired
	public void setAccessSumMapper(AccessSumMapper accessSumMapper) {
		this.accessSumMapper = accessSumMapper;
	}

	@Override
	public String delete(Integer id) {
		if (accessSumMapper.deleteByPrimaryKey(id) == 1) {
			return "删除成功";
		}
		return "删除失败";
	}

	@Override
	public String add(AccessSum accessSum) {
		if (accessSumMapper.insertSelective(accessSum) == 1) {
			return "添加成功";
		}
		return "添加失败";
	}

	@Override
	public AccessSum findById(Integer id) {
		
		return accessSumMapper.selectByPrimaryKey(id);
	}

	@Override
	public String update(AccessSum accessSum) {
		if (accessSumMapper.updateByPrimaryKeySelective(accessSum) == 1) {
			return "更新成功";
		}
		return "更新失败";
	}

	@Override
	public List<AccessSum> getAll() {
		return accessSumMapper.selectAll();
	}
	
	
	
}
