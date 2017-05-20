package com.jplus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jplus.dao.CourseMapper;
import com.jplus.model.Course;
import com.jplus.service.CourseService;

@Service("courseService")
public class CourseServiceImpl implements CourseService {
	private CourseMapper courseMapper;

	public CourseMapper getCourseMapper() {
		return courseMapper;
	}

	@Autowired
	public void setCourseMapper(CourseMapper courseMapper) {
		this.courseMapper = courseMapper;
	}

	@Override
	public List<Course> selectCourseByPage(com.jplus.util.Page page) {
		// TODO Auto-generated method stub
		return courseMapper.selectCourseByPage(page);
	}

	@Override
	public long getAllCourseCount() {
		// TODO Auto-generated method stub
		return courseMapper.getAllCourseCount();
	}

	@Override
	public List<Course> selectCourseByCourseid(String videoid,int startPos, int pageSize) {
		// TODO Auto-generated method stub
		return courseMapper
				.selectCourseByCourseid(videoid,startPos, pageSize );
	}

	@Override
	public long getCountByCourseId(String videoid) {
		// TODO Auto-generated method stub
		return courseMapper.getCountByCourseId(videoid);
	}

	@Override
	public Course getCourseByCid(String courseid) {
		// TODO Auto-generated method stub
		return courseMapper.getCourseByCid(courseid);
	}
	
	@Override
	public int updateByCourseid(Course course) {
		// TODO Auto-generated method stub
		return courseMapper.updateByCourseid(course);
	}

	@Override
	public void updateClick(String courseid) {
		// TODO Auto-generated method stub
		courseMapper.updateClick(courseid);
	}

	@Override
	public int insertSelective(Course course) {
		// TODO Auto-generated method stub
		return courseMapper.insertSelective(course);
	}

	@Override
	public List<Course> selectCourseByKey(String keyword, int startPos,
			int pageSize) {
		// TODO Auto-generated method stub
		return courseMapper.selectCourseByKey(keyword, startPos, pageSize);
	}

}
