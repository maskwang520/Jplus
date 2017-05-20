package com.jplus.service;

import java.util.List;

import com.jplus.model.BBSRecommend;

/**
 * 访问量信息 业务层接口
 * 
 * @author Chitry
 *
 */
public interface BBSRecommendService {

	String delete(Integer id);

    String add(BBSRecommend bbsRecommend);
 
    BBSRecommend findById(Integer id);

    String update(BBSRecommend bbsRecommend);
    
    List<BBSRecommend> getAll();
}
