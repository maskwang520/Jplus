package com.jplus.dao;

import java.util.List;

import com.jplus.model.Videos;

public interface VideosMapper {
	Videos selectByPrimaryKey(int id);
	List<Videos> selectAllVideos(String courseid);
	int deleteByPrimaryKey(int id);
	int deleteByVideosid(String videosid);
	int insert(Videos videos);
	int updateByPrimaryKeySelective(Videos videos);
	int updateByPrimaryKey(Videos videos);

}
