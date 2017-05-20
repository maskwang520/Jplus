package com.jplus.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jplus.model.AccessSum;
import com.jplus.service.AccessSumService;

/**
 * @title 访问量信息 动作控制层
 * 
 * @author Chitry
 * @time 2015.07.22 21:20:45
 */
@Controller
public class AccessSumMapperController {

	private AccessSumService accessSumService;
	
	public AccessSumService getAccessSumService() {
		return accessSumService;
	}
	@Autowired
	public void setAccessSumService(AccessSumService accessSumService) {
		this.accessSumService = accessSumService;
	}
	
	@SuppressWarnings("finally")
	@RequestMapping("addAccessSum")
	public String add(AccessSum accessSum,HttpServletRequest request){
		try {			
			String str = accessSumService.add(accessSum);
			request.setAttribute("InfoMessage", str);//操作消息
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "添加信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "/"; //这里要跳转的页面的名字，这个页面还没写，所以先空着了
		}
	}
	
	@RequestMapping("getAllAccessSum")
	public String getAll(HttpServletRequest request){
		try {			
			List<AccessSum> list = accessSumService.getAll();
			request.setAttribute("accessSumlist", list);
			return "/";//listAll页面
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "/";
		}
	}
	
	@SuppressWarnings("finally")
	@RequestMapping("delAccessSum")
	public String del(Integer id,HttpServletRequest request){
		try {			
			String str = accessSumService.delete(id);
			request.setAttribute("InfoMessage", str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "删除信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "/";
		}
	}
	@RequestMapping("modifyAccessSum")
	public String modify(Integer id,HttpServletRequest request){
		try {			
			AccessSum accessSum = accessSumService.findById(id);
			request.setAttribute("accessSum", accessSum);
			return "/";//modify页面
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "/";
		}
	}
	@SuppressWarnings("finally")
	@RequestMapping("updateAccessSum")
	public String update(AccessSum accessSum,HttpServletRequest request){
		try {			
			String str = accessSumService.update(accessSum);
			request.setAttribute("InfoMessage", str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "/";
		}
	}
}
