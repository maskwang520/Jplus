package com.jplus.service.impl;
/*
 * author maskwang
 */
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jplus.dao.IdentifyMapper;
import com.jplus.model.Identify;
import com.jplus.model.Member;
import com.jplus.service.IdentifyService;
@Service("identifyService")
public class IdentifyServiceImpl implements IdentifyService {

	private IdentifyMapper identifyMapper;
	

	public IdentifyMapper getIdentifyMapper() {
		return identifyMapper;
	}
	@Autowired
	public void setIdentifyMapper(IdentifyMapper identifyMapper) {
		this.identifyMapper = identifyMapper;
	}

	@Override
	public String delete(Integer id) {
		if (identifyMapper.deleteByPrimaryKey(id) == 1) {
			return "删除成功";
		}
		return "删除失败";
	}

	@Override
	public String add(Identify identify) {
		if (identifyMapper.insert(identify) == 1) {
			return "添加成功";
		}
		return "添加失败";
	}

	@Override
	public Identify findById(Integer id) {
		return identifyMapper.selectByPrimaryKey(id);
	}

	@Override
	public String update(Identify identify) {
		if (identifyMapper.updateByPrimaryKeySelective(identify) == 1) {
			return "更新成功";
		}
		return "更新失败";
	}

	@Override
	public List<Identify> getAll() {
		return identifyMapper.selectAll();
	}
	@Override
	public List<Member> getIdentifyMember() {
		// TODO Auto-generated method stub
		return identifyMapper.getIdentifyMember();
	}
	@Override
	public Identify findByName(String uname) {
		// TODO Auto-generated method stub
		return identifyMapper.findByName(uname);
	}
   
}
