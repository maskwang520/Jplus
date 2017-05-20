package com.jplus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jplus.dao.LiuYanMapper;
import com.jplus.model.LiuYan;
import com.jplus.service.LiuYanService;

/**
 * 访问量信息  业务层接口实现
 * 
 * @author Chitry
 *
 */
@Service("liuYanService")
public class LiuYanServiceImpl implements LiuYanService {
	
	//Dao Mapper   声明
	private LiuYanMapper liuYanMapper; 
	
	public LiuYanMapper getLiuYanMapper() {
		return liuYanMapper;
	}
	
	@Autowired
	public void setLiuYanMapper(LiuYanMapper liuYanMapper) {
		this.liuYanMapper = liuYanMapper;
	}

	@Override
	public String delete(Integer id) {
		if (liuYanMapper.deleteByPrimaryKey(id) == 1) {
			return "删除成功";
		}
		return "删除失败";
	}

	@Override
	public String add(LiuYan liuYan) {
		if (liuYanMapper.insert(liuYan) == 1) {
			return "添加成功";
		}
		return "添加失败";
	}

	@Override
	public LiuYan findById(Integer id) {
		
		return liuYanMapper.selectByPrimaryKey(id);
	}

	@Override
	public String update(LiuYan liuYan) {
		if (liuYanMapper.updateByPrimaryKey(liuYan) == 1) {
			return "更新成功";
		}
		return "更新失败";
	}

	@Override
	public List<LiuYan> getAll() {
		return liuYanMapper.selectAll();
	}
	
	
	
}
