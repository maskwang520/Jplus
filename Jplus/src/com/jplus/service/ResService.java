package com.jplus.service;

import java.util.List;

import com.jplus.dao.Tieba;
import com.jplus.model.Res;
import com.jplus.model.ResClass;

public interface ResService {
	int insertSelective(Res record);
	List<Res> selectAll();
	List<Res> selectAllByrid(Integer id);
	 Res selectByPrimaryKey(Integer id);	
	 int updateByPrimaryKeySelective(Res record);
	List<Res> findResBysouinfo(String souinfo);
	List<ResClass> selectAllResClass();
}
