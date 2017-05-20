package com.jplus.service;

import java.util.List;

import com.jplus.model.Videos;

public interface VideosService {
	Videos selectByPrimaryKey(int id);

	List<Videos> selectAllVideos(String courseid);

	int deleteByPrimaryKey(int id);

	int deleteByVideosid(String videosid);

	int insert(Videos videos);


	int updateByPrimaryKeySelective(Videos videos);

	int updateByPrimaryKey(Videos videos);

}
