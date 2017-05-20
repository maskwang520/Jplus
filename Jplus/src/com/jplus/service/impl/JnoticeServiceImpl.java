package com.jplus.service.impl;
/*
 * author maskwang
 */
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jplus.dao.JnoticeMapper;
import com.jplus.model.Jnotice;
import com.jplus.service.JnoticeService;
@Service("jnoticeService")
public class JnoticeServiceImpl implements JnoticeService {

	private JnoticeMapper jnoticeMapper;
	

	public JnoticeMapper getJnoticeMapper() {
		return jnoticeMapper;
	}
	@Autowired
	public void setJnoticeMapper(JnoticeMapper jnoticeMapper) {
		this.jnoticeMapper = jnoticeMapper;
	}

	@Override
	public String delete(Integer id) {
		if (jnoticeMapper.deleteByPrimaryKey(id) == 1) {
			return "删除成功";
		}
		return "删除失败";
	}

	@Override
	public String add(Jnotice jnotice) {
		if (jnoticeMapper.insert(jnotice) == 1) {
			return "添加成功";
		}
		return "添加失败";
	}

	@Override
	public Jnotice findById(Integer id) {
		return jnoticeMapper.selectByPrimaryKey(id);
	}

	@Override
	public String update(Jnotice jnotice) {
		if (jnoticeMapper.updateByPrimaryKeySelective(jnotice) == 1) {
			return "更新成功";
		}
		return "更新失败";
	}

	@Override
	public List<Jnotice> getAll() {
		return jnoticeMapper.selectAll();
	}
	@Override
	public List<Jnotice> getUserJnotice() {
		
		return jnoticeMapper.getUserJnotice();
	}
	
	

}
