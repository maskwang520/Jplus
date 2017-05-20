package com.jplus.model;

public class Videos {
	private Integer id;
	private String courseid;
	private String videosid;
	public String getVideosid() {
		return videosid;
	}
	public void setVideosid(String videosid) {
		this.videosid = videosid;
	}
	private String title;
	private String description;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCourseid() {
		return courseid;
	}
	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
