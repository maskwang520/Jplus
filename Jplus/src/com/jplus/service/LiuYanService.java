package com.jplus.service;

import java.util.List;

import com.jplus.model.LiuYan;
import com.jplus.model.User;

/**
 * 访问量信息 业务层接口
 * 
 * @author Chitry
 *
 */
public interface LiuYanService {

	String delete(Integer id);

    String add(LiuYan liuYan);
 
    LiuYan findById(Integer id);

    String update(LiuYan liuYan);
    
    List<LiuYan> getAll();
}
