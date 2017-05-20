package com.jplus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jplus.dao.ZanMapper;
import com.jplus.model.Zan;
import com.jplus.service.ZanService;
@Service("zanService")
public class ZanServiceImpl implements ZanService {
		private ZanMapper zanMapper;
	

	public ZanMapper getZanMapper() {
		return zanMapper;
	}
	@Autowired
	public void setZanMapper(ZanMapper zanMapper) {
		this.zanMapper = zanMapper;
	}
	@Override
	public List<Zan> selectAll() {
		// TODO Auto-generated method stub
		return zanMapper.selectAll();
	}

	@Override
	public int insert(Zan record) {
		// TODO Auto-generated method stub
		return zanMapper.insert(record);
	}

}
