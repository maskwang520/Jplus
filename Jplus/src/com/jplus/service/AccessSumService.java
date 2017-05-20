package com.jplus.service;

import java.util.List;

import com.jplus.model.AccessSum;
import com.jplus.model.User;

/**
 * 访问量信息 业务层接口
 * 
 * @author Chitry
 *
 */
public interface AccessSumService {

	String delete(Integer id);

    String add(AccessSum accessSum);
 
    AccessSum findById(Integer id);

    String update(AccessSum accessSum);
    
    List<AccessSum> getAll();
}
