package com.jplus.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jplus.model.Jtask;
import com.jplus.model.TaskPage;
import com.jplus.model.User;
import com.jplus.model.UserMsg;
import com.jplus.service.UserMsgService;

/**
 * @title 访问量信息 动作控制层
 * 
 * @author Chitry
 * @time 2015.07.22 21:20:45
 */
@Controller
public class UserMsgMapperController {

	private UserMsgService userMsgService;
	
	public UserMsgService getUserMsgService() {
		return userMsgService;
	}
	@Autowired
	public void setUserMsgService(UserMsgService userMsgService) {
		this.userMsgService = userMsgService;
	}
	
	@SuppressWarnings("finally")
	@RequestMapping("addUserMsg")
	public String add(UserMsg userMsg,HttpServletRequest request){
		try {			
			String str = userMsgService.add(userMsg);
			request.setAttribute("InfoMessage", str);//操作消息
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "添加信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "/"; //这里要跳转的页面的名字，这个页面还没写，所以先空着了
		}
	}
	
	@RequestMapping("getAllUserMsg")
	public String getAll(HttpServletRequest request){
		try {			
			List<UserMsg> list = userMsgService.getAll();
			request.setAttribute("userMsglist", list);
			return "/";//listAll页面
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "/";
		}
	}
	
	@SuppressWarnings("finally")
	@RequestMapping("delUserMsg")
	public String del(Integer id,HttpServletRequest request){
		try {			
			String str = userMsgService.delete(id);
			request.setAttribute("InfoMessage", str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "删除信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "/";
		}
	}
	@RequestMapping("modifyUserMsg")
	public String modify(Integer id,HttpServletRequest request){
		try {			
			UserMsg userMsg = userMsgService.findById(id);
			request.setAttribute("userMsg", userMsg);
			return "/";//modify页面
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "/";
		}
	}
	@SuppressWarnings("finally")
	@RequestMapping("updateUserMsg")
	public String update(UserMsg userMsg,HttpServletRequest request){
		try {			
			String str = userMsgService.update(userMsg);
			request.setAttribute("InfoMessage", str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "/";
		}
	}
	@RequestMapping("findMsgNotRead")
	public String findMsgNotRead(HttpServletRequest request,@RequestParam(value=("flag"))int flag,@RequestParam(value=("pageno1"))int pageNo1,@RequestParam(value=("pageno2"))int pageNo2){
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("loginuser");
		if(flag>=0){
		TaskPage taskpage=userMsgService.countMsg(user.getId(), 0, pageNo1);
		List<UserMsg> userMsgNotReadList=userMsgService.findMsgNotRead(user.getId(), 0, taskpage);
		session.setAttribute("userMsgNotReadList",userMsgNotReadList);
		}
		session.setAttribute("pageno1",pageNo1);
		if(flag<=0){
		TaskPage taskpage1=userMsgService.countMsg(user.getId(), 1, pageNo2);
		session.setAttribute("pageno2",pageNo2);
		List<UserMsg> userMsgReadList=userMsgService.findMsgNotRead(user.getId(), 1, taskpage1);
		session.setAttribute("userMsgReadList",userMsgReadList);
		//System.out.println(userMsgNotReadList.get(0).getMsgcontent()+"************");
		
		//session.setAttribute("page", taskpage1);
		}
	    //System.out.println(userMsgNotReadList.get(0).getMsgcontent());
		session.setAttribute("pageno2",pageNo2);
		return "page/jemail";
	}
	
	
	
	
}
