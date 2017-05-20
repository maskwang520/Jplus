package com.jplus.service;

import java.util.List;

import com.jplus.model.FriendLink;

/**
 * 友情链接信息 业务层接口
 * 
 * @author Chitry
 *
 */
public interface FriendLinkService {

	String delete(Integer id);

    String add(FriendLink friendLink);
 
    FriendLink findById(Integer id);

    String update(FriendLink friendLink);
    
    List<FriendLink> getAll();
}
