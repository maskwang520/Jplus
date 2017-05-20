package com.jplus.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jplus.model.Jnotice;
import com.jplus.service.JnoticeService;

/**
 * @title 访问量信息 动作控制层
 * 
 * @author maskwang
 * @time 2015.07.22 21:20:45
 */
@Controller
public class JnoticeMapperController {

	private JnoticeService jnoticeService;
	
	public JnoticeService getJnoticeService() {
		return jnoticeService;
	}
	@Autowired
	public void setJnoticeService(JnoticeService jnoticeService) {
		this.jnoticeService = jnoticeService;
	}
	
	@SuppressWarnings("finally")
	@RequestMapping("addJnotice")
	public String add(Jnotice jnotice,HttpServletRequest request){
		try {			
			String str = jnoticeService.add(jnotice);
			request.setAttribute("InfoMessage", str);//操作消息
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "添加信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "/"; //这里要跳转的页面的名字，这个页面还没写，所以先空着了
		}
	}
	
	@RequestMapping("getAllJnotice")
	public String getAll(HttpServletRequest request){
		try {			
			List<Jnotice> list = jnoticeService.getAll();
			request.setAttribute("jnoticelist", list);
			return "/";//listAll页面
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "/";
		}
	}
	
	@SuppressWarnings("finally")
	@RequestMapping("delJnotice")
	public String del(Integer id,HttpServletRequest request){
		try {			
			String str = jnoticeService.delete(id);
			request.setAttribute("InfoMessage", str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "删除信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "/";
		}
	}
	@RequestMapping("modifyJnotice")
	public String modify(@RequestParam(value="id")Integer id,HttpServletRequest request){
		try {
			HttpSession session=request.getSession();
			Jnotice jnotice = jnoticeService.findById(id);
			session.setAttribute("jnotice", jnotice);
			return "page/jnoticedetail";//modify页面
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "/";
		}
	}
	@SuppressWarnings("finally")
	@RequestMapping("updateJnotice")
	public String update(Jnotice jnotice,HttpServletRequest request){
		try {			
			String str = jnoticeService.update(jnotice);
			request.setAttribute("InfoMessage", str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "/";
		}
	}
	@RequestMapping("getUserJnotice")
	public String getUserJnotice(HttpServletRequest request){
		try {			
		    HttpSession session=request.getSession();
			List<Jnotice> list = jnoticeService.getUserJnotice();
			session.setAttribute("userJnoticelist", list);
			return "page/task";//listAll页面
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "/";
		}
	}
	
}
