package com.jplus.model;
/**
 * 板块表
 * @author Sizhentao
 *
 */
public class Section {
	private Integer	id;
	private String name;
	private String courseid;		//视频id 为一门课程id
	private String keyword;	
	
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCourseid() {
		return courseid;
	}
	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}
	
	
}
