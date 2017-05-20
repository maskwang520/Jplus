package com.jplus.service;

import java.util.List;

import com.jplus.model.Section;

public interface SectionService {
	Section selectByPrimaryKey(int id);
	Section selectByCourseid(String courseid);
	List<Section> selectAllSection();
	List<String>  selectKeyWordInSec();
	int deleteByPrimaryKey(int id);
	int insert(Section section);
	int insertSelective(Section section);
	int updateByPrimaryKeySelective(Section section);
	int updateByPrimaryKey(Section section);
}
