package com.jplus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jplus.dao.SectionMapper;
import com.jplus.model.Section;
import com.jplus.service.SectionService;

@Service("sectionService")
public class SectionServiceImpl implements SectionService {
	private SectionMapper sectionMapper;

	public SectionMapper getSectionMapper() {
		return sectionMapper;
	}

	@Autowired
	public void setSectionMapper(SectionMapper sectionMapper) {
		this.sectionMapper = sectionMapper;
	}

	@Override
	public Section selectByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		return sectionMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<String> selectKeyWordInSec() {
		// TODO Auto-generated method stub
		return sectionMapper.selectKeyWordInSec();
	}

	@Override
	public int deleteByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		return sectionMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Section section) {
		// TODO Auto-generated method stub
		return sectionMapper.insert(section);
	}

	@Override
	public int insertSelective(Section section) {
		// TODO Auto-generated method stub
		return sectionMapper.insertSelective(section);
	}

	@Override
	public int updateByPrimaryKeySelective(Section section) {
		// TODO Auto-generated method stub
		return sectionMapper.updateByPrimaryKey(section);
	}

	@Override
	public int updateByPrimaryKey(Section section) {
		// TODO Auto-generated method stub
		return sectionMapper.updateByPrimaryKeySelective(section);
	}

	@Override
	public Section selectByCourseid(String courseid) {
		// TODO Auto-generated method stub
		return sectionMapper.selectByCourseid(courseid);
	}

	@Override
	public List<Section> selectAllSection() {
		return sectionMapper.selectAllSection();
	}

}
