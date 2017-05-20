package com.jplus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jplus.dao.VideosMapper;
import com.jplus.model.Videos;
import com.jplus.service.VideosService;

@Service("videosService")
public class VideosServiceImpl implements VideosService {
	private VideosMapper videosMapper;

	public VideosMapper getVideosMapper() {
		return videosMapper;
	}

	@Autowired
	public void setVideosMapper(VideosMapper videosMapper) {
		this.videosMapper = videosMapper;
	}

	@Override
	public Videos selectByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		return videosMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Videos> selectAllVideos(String courseid) {
		// TODO Auto-generated method stub
		return videosMapper.selectAllVideos(courseid);
	}

	@Override
	public int deleteByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		return videosMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int deleteByVideosid(String videosid) {
		// TODO Auto-generated method stub
		return videosMapper.deleteByVideosid(videosid);
	}

	@Override
	public int insert(Videos videos) {
		// TODO Auto-generated method stub
		return videosMapper.insert(videos);
	}

	@Override
	public int updateByPrimaryKeySelective(Videos videos) {
		// TODO Auto-generated method stub
		return videosMapper.updateByPrimaryKeySelective(videos);
	}

	@Override
	public int updateByPrimaryKey(Videos videos) {
		// TODO Auto-generated method stub
		return videosMapper.updateByPrimaryKey(videos);
	}

}
