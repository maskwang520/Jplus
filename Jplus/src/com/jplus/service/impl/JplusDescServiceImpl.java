package com.jplus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jplus.dao.JplusDescMapper;
import com.jplus.model.JplusDesc;
import com.jplus.service.JplusDescService;
@Service("jplusDescService")
public class JplusDescServiceImpl implements JplusDescService {

	private JplusDescMapper jplusDescMapper;
	

	public JplusDescMapper getJplusDescMapper() {
		return jplusDescMapper;
	}
	@Autowired
	public void setJplusDescMapper(JplusDescMapper jplusDescMapper) {
		this.jplusDescMapper = jplusDescMapper;
	}

	@Override
	public String delete(Integer id) {
		if (jplusDescMapper.deleteByPrimaryKey(id) == 1) {
			return "删除成功";
		}
		return "删除失败";
	}

	@Override
	public String add(JplusDesc jplusDesc) {
		if (jplusDescMapper.insert(jplusDesc) == 1) {
			return "添加成功";
		}
		return "添加失败";
	}

	@Override
	public JplusDesc findById(Integer id) {
		return jplusDescMapper.selectByPrimaryKey(id);
	}

	@Override
	public String update(JplusDesc jplusDesc) {
		if (jplusDescMapper.updateByPrimaryKeySelective(jplusDesc) == 1) {
			return "更新成功";
		}
		return "更新失败";
	}

	@Override
	public List<JplusDesc> getAll() {
		return 	jplusDescMapper.selectAll();
		
	}

}
