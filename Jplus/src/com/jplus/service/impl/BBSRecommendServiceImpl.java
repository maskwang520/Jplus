package com.jplus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jplus.dao.BBSRecommendMapper;
import com.jplus.dao.UserMapper;
import com.jplus.model.BBSRecommend;
import com.jplus.service.BBSRecommendService;

/**
 * 访问量信息  业务层接口实现
 * 
 * @author Chitry
 *
 */
@Service("RecommendSumService")
public class BBSRecommendServiceImpl implements BBSRecommendService {
	
	//Dao Mapper   声明
	private BBSRecommendMapper bbsRecommendMapper; 
	
	public BBSRecommendMapper getBBSRecommendMapper() {
		return bbsRecommendMapper;
	}
	
	@Autowired
	public void setBBSRecommendMapper(BBSRecommendMapper bbsRecommendMapper) {
		this.bbsRecommendMapper = bbsRecommendMapper;
	}

	@Override
	public String delete(Integer id) {
		if (bbsRecommendMapper.deleteByPrimaryKey(id) == 1) {
			return "删除成功";
		}
		return "删除失败";
	}

	@Override
	public String add(BBSRecommend bbsRecommend) {
		if (bbsRecommendMapper.insertSelective(bbsRecommend) == 1) {
			return "添加成功";
		}
		return "添加失败";
	}

	@Override
	public BBSRecommend findById(Integer id) {
		
		return bbsRecommendMapper.selectByPrimaryKey(id);
	}

	@Override
	public String update(BBSRecommend bbsRecommend) {
		if (bbsRecommendMapper.updateByPrimaryKeySelective(bbsRecommend) == 1) {
			return "更新成功";
		}
		return "更新失败";
	}

	@Override
	public List<BBSRecommend> getAll() {
		return bbsRecommendMapper.selectAll();
	}
	
	
	
}
