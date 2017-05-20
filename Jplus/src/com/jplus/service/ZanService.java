package com.jplus.service;

import java.util.List;

import com.jplus.model.Zan;
//fly  2015/8/1 赞的接口
public interface ZanService {
	List<Zan> selectAll();
	int insert(Zan record);
}
