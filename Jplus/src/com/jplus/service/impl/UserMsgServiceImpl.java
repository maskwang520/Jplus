package com.jplus.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jplus.dao.UserMsgMapper;
import com.jplus.dao.UserMapper;
import com.jplus.model.TaskPage;
import com.jplus.model.User;
import com.jplus.model.UserMsg;
import com.jplus.service.UserMsgService;
import com.sun.xml.internal.xsom.impl.scd.Iterators.Map;

/**
 * 访问量信息  业务层接口实现
 * 
 * @author Chitry
 *
 */
@Service("userMsgService")
public class UserMsgServiceImpl implements UserMsgService {
	
	//Dao Mapper   声明
	private UserMsgMapper userMsgMapper; 
	
	public UserMsgMapper getUserMsgMapper() {
		return userMsgMapper;
	}
	
	@Resource 
	public void setUserMsgMapper(UserMsgMapper userMsgMapper) {
		this.userMsgMapper = userMsgMapper;
	}

	@Override
	public String delete(Integer id) {
		if (userMsgMapper.deleteByPrimaryKey(id) == 1) {
			return "删除成功";
		}
		return "删除失败";
	}

	@Override
	public String add(UserMsg userMsg) {
		if (userMsgMapper.insertSelective(userMsg) == 1) {
			return "添加成功";
		}
		return "添加失败";
	}

	@Override
	public UserMsg findById(Integer id) {
		
		return userMsgMapper.selectByPrimaryKey(id);
	}

	@Override
	public String update(UserMsg userMsg) {
		if (userMsgMapper.updateByPrimaryKeySelective(userMsg) == 1) {
			return "更新成功";
		}
		return "更新失败";
	}

	@Override
	public List<UserMsg> getAll() {
		return userMsgMapper.selectAll();
	}

	@Override
	public int updateById(int id) {
		
		return userMsgMapper.updateById(id);
	}

	@Override
	public List<UserMsg> getAllById(int id) {
		// TODO Auto-generated method stub
		return userMsgMapper.getAllById(id);
	}

	@Override
	public int countNotRead(int id) {	
		// TODO Auto-generated method stub
		return userMsgMapper.countNotRead(id);
	}

	@Override
	public List<UserMsg> findMsgNotRead(int id, int rign, TaskPage taskPage) {
		// TODO Auto-generated method stub
		HashMap paramMap=new HashMap();
		paramMap.put("id",id);
		paramMap.put("rign", rign);
		//paramMap.put("taskPage", taskPage);
		paramMap.put("startRow",taskPage.getStartRow());
		paramMap.put("endRow",taskPage.getEndRow());
		return userMsgMapper.findMsgNotRead(paramMap) ;
	}

	@Override
	public TaskPage countMsg(int id, int rign,int pageNo) {
		TaskPage taskpage=new TaskPage();
		int total=0;
		int zongshu=userMsgMapper.countMsg(id,rign);
		if(zongshu%10==0){
			total=zongshu/10;
		}
		else{
			total=zongshu/10+1;
		}
		
		if(pageNo<=0){
			
			taskpage.setStartRow(0);
			taskpage.setEndRow(10);
			taskpage.setPageNo(1);
			
		}
		
		else{
			
			if(pageNo>=total){
				taskpage.setPageNo(total);
			}
			if(pageNo==0){
				taskpage.setPageNo(1);
			}
			if(pageNo<total&&pageNo>0){
			taskpage.setPageNo(pageNo);
			}
			taskpage.setStartRow((pageNo-1)*1);
			taskpage.setEndRow(10);
		}
		return taskpage;
	}

	
	
	
	

	

	

	
	
	
	
	
}
