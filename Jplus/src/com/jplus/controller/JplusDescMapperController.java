package com.jplus.controller;
/*
 * author maskwang
 */
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jplus.model.JplusDesc;
import com.jplus.service.JplusDescService;
@Controller
public class JplusDescMapperController {
     private JplusDescService jplusDescService;

	public JplusDescService getJplusDescService() {
		return jplusDescService;
	}
	@Autowired
	public void setJplusDescService(JplusDescService jplusDescService) {
		this.jplusDescService = jplusDescService;
	}
	@SuppressWarnings("finally")
	@RequestMapping("addJplusDesc")
	public String add(JplusDesc jplusDesc,HttpServletRequest request){
		try {			
			String str = jplusDescService.add(jplusDesc);
			request.setAttribute("InfoMessage", str);//操作消息
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "添加信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "/"; //这里要跳转的页面的名字，这个页面还没写，所以先空着了
		}
	}
	@RequestMapping("getAllJplusDesc")
	public String getAll(HttpServletRequest request){
				
			List<JplusDesc> list = jplusDescService.getAll();
			request.setAttribute("jplusDesclist", list);
			return "test";//listAll页面
		
	}
	@SuppressWarnings("finally")
	@RequestMapping("delJplusDesc")
	public String del(Integer id,HttpServletRequest request){
		try {			
			String str = jplusDescService.delete(id);
			request.setAttribute("InfoMessage", str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "删除信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "/";
		}
	}
	@RequestMapping("modifyJplusDesc")
	public String modify(Integer id,HttpServletRequest request){
		try {			
			JplusDesc jplusDesc= jplusDescService.findById(id);
			request.setAttribute("jplusDesc", jplusDesc);
			return "/";//modify页面
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "/";
		}
	}
	@SuppressWarnings("finally")
	@RequestMapping("updateJplusDesc")
	public String update(JplusDesc jplusDesc,HttpServletRequest request){
		try {			
			String str = jplusDescService.update(jplusDesc);
			request.setAttribute("InfoMessage", str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "/";
		}
	}

}
