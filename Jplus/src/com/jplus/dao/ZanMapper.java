package com.jplus.dao;

import java.util.List;

import com.jplus.model.Res;
import com.jplus.model.Zan;

public interface ZanMapper {
	List<Zan> selectAll();
	int insert(Zan record);
}
