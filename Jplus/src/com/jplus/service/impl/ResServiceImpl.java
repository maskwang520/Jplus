package com.jplus.service.impl;


import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jplus.dao.ResClassMapper;
import com.jplus.dao.ResMapper;
import com.jplus.dao.Tieba;
import com.jplus.model.Res;
import com.jplus.model.ResClass;
import com.jplus.service.ResService;
@Service
public class ResServiceImpl implements ResService {
	private ResMapper resmapper;
	private ResClassMapper resClassMapper;
	
	
	public ResClassMapper getResClassMapper() {
		return resClassMapper;
	}
	@Autowired
	public void setResClassMapper(ResClassMapper resClassMapper) {
		this.resClassMapper = resClassMapper;
	}
	public ResMapper getResmapper() {
		return resmapper;
	}
	@Autowired
	public void setResmapper(ResMapper resmapper) {
		this.resmapper = resmapper;
	}
	@Override
	public int insertSelective(Res record) {
		// TODO Auto-generated method stub
		return resmapper.insertSelective(record);
	}
	@Override
	public List<Res> selectAll() {
		// TODO Auto-generated method stub
		return resmapper.selectAll();
	}
	@Override
	public List<Res> selectAllByrid(Integer id) {
		return resmapper.selectAllByrid(id);
	}
	@Override
	public Res selectByPrimaryKey(Integer id) {
		
		return resmapper.selectByPrimaryKey(id);
	}
	@Override
	public int updateByPrimaryKeySelective(Res record) {
		// TODO Auto-generated method stub
		return resmapper.updateByPrimaryKeySelective(record);
	}
	@Override
	public List<Res> findResBysouinfo(String souinfo) {
		return resmapper.findResBysouinfo(souinfo);
	}
	@Override
	public List<ResClass> selectAllResClass() {
		return resClassMapper.selectAll();
	}

}
