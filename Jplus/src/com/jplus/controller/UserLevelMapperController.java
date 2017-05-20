package com.jplus.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jplus.model.User;
import com.jplus.model.UserLevel;
import com.jplus.service.UserLevelService;
import com.jplus.service.UserService;

/**
 * @title 访问量信息 动作控制层
 * 
 * @author Chitry
 * @time 2015.07.22 21:20:45
 */
@Controller
public class UserLevelMapperController {
	@Autowired
    private UserService userService;
	private UserLevelService userLevelService;
	
	public UserLevelService getUserLevelService() {
		return userLevelService;
	}
	@Autowired
	public void setUserLevelService(UserLevelService userLevelService) {
		this.userLevelService = userLevelService;
	}
	
	@SuppressWarnings("finally")
	@RequestMapping("addUserLevel")
	public String add(UserLevel userLevel,HttpServletRequest request){
		try {			
			String str = userLevelService.add(userLevel);
			request.setAttribute("InfoMessage", str);//操作消息
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "添加信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "/"; //这里要跳转的页面的名字，这个页面还没写，所以先空着了
		}
	}
	
	@RequestMapping("getAllUserLevel")
	public String getAll(HttpServletRequest request){
		try {			
			List<UserLevel> list = userLevelService.getAll();
			request.setAttribute("userLevellist", list);
			return "/";//listAll页面
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "/";
		}
	}
	
	@SuppressWarnings("finally")
	@RequestMapping("delUserLevel")
	public String del(Integer id,HttpServletRequest request){
		try {			
			String str = userLevelService.delete(id);
			request.setAttribute("InfoMessage", str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "删除信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "/";
		}
	}
	@RequestMapping("modifyUserLevel")
	public String modify(Integer id,HttpServletRequest request){
		try {			
			UserLevel userLevel = userLevelService.findById(id);
			request.setAttribute("userLevel", userLevel);
			return "/";//modify页面
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "/";
		}
	}
	@SuppressWarnings("finally")
	@RequestMapping("updateUserLevel")
	public String update(UserLevel userLevel,HttpServletRequest request){
		try {			
			String str = userLevelService.update(userLevel);
			request.setAttribute("InfoMessage", str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "/";
		}
	}
	
}
