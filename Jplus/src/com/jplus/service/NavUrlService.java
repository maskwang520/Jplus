package com.jplus.service;

import java.util.List;

import com.jplus.model.NavUrl;
import com.jplus.model.User;

/**
 * 访问量信息 业务层接口
 * 
 * @author Chitry
 *
 */
public interface NavUrlService {

	String delete(Integer id);

    String add(NavUrl navUrl);
 
    NavUrl findById(Integer id);

    String update(NavUrl navUrl);
    
    List<NavUrl> getAll();
}
