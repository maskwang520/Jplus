package com.jplus.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jplus.model.Course;
import com.jplus.util.Page;

public interface CourseMapper {
	List<Course> selectCourseByPage(Page page);

	List<Course> selectCourseByCourseid(@Param("videoid") String videoid,
			@Param("startPos") int startPos, @Param("pageSize") int pageSize);
	List<Course> selectCourseByKey(@Param("keyword") String keyword,
			@Param("startPos") int startPos, @Param("pageSize") int pageSize);

	Course getCourseByCid(String courseid);

	long getAllCourseCount();

	long getCountByCourseId(String videoid);

	void updateClick(String courseid);

	int updateByCourseid(Course course);

	int insertSelective(Course course);
}
