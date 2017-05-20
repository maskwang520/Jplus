package com.jplus.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jplus.model.Jnotice;
import com.jplus.model.Jtask;
import com.jplus.model.TaskPage;
import com.jplus.service.JnoticeService;
import com.jplus.service.JtaskService;

/**
 * @title 访问量信息 动作控制层
 * 
 * @author maskwang
 * @time 3015.07.33 31:30:45
 */
@Controller
public class JtaskMapperController {
	@Autowired
	private JnoticeService jnoticeService;

	private JtaskService jtaskService;
	
	public JtaskService getJtaskService() {
		return jtaskService;
	}
	@Autowired
	public void setJtaskService(JtaskService jtaskService) {
		this.jtaskService = jtaskService;
	}
	
	@SuppressWarnings("finally")
	@RequestMapping("addJtask")
	public String add(Jtask jtask,HttpServletRequest request){
		try {			
			String str = jtaskService.add(jtask);
			request.setAttribute("InfoMessage", str);//操作消息
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "添加信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "/"; //这里要跳转的页面的名字，这个页面还没写，所以先空着了
		}
	}
	
	@RequestMapping("getAllJtask")
	public String getAll(HttpServletRequest request){
		try {			
			List<Jtask> list = jtaskService.getAll();
			request.setAttribute("jtasklist", list);
			return "page/jtask";//listAll页面
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "/";
		}
	}
	
	@SuppressWarnings("finally")
	@RequestMapping("delJtask")
	public String del(Integer id,HttpServletRequest request){
		try {			
			String str = jtaskService.delete(id);
			request.setAttribute("InfoMessage", str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "删除信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "/";
		}
	}
	@RequestMapping("modifyJtask")
	public String modify(Integer id,HttpServletRequest request){
		try {			
			HttpSession session=request.getSession();
			Jtask jtask = jtaskService.findById(id);
			session.setAttribute("jtask", jtask);
			return "page/jtaskdetail";//modify页面
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "/";
		}
	}
	@SuppressWarnings("finally")
	@RequestMapping("updateJtask")
	public String update(Jtask jtask,HttpServletRequest request){
		try {			
			String str = jtaskService.update(jtask);
			request.setAttribute("InfoMessage", str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "/";
		}
	}
	@RequestMapping("getUserJtask")
	public String getUserJtask(HttpServletRequest request,@RequestParam(value=("pageNo"))int pageNo)throws Exception{
		HttpSession session=request.getSession();
		TaskPage taskpage=new TaskPage();
		try {
			int total=0;
			int zongshu=jtaskService.getTaskTotal();
			if(zongshu%3==0){
				total=zongshu/3;
			}
			else{
				total=zongshu/3+1;
			}
			
			if(pageNo<=0){
				
				taskpage.setStartRow(0);
				taskpage.setEndRow(3);
				taskpage.setPageNo(3);
				
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
				taskpage.setEndRow(3);
			}
			session.setAttribute("total", total);
			session.setAttribute("page", taskpage);
			List<Jtask> list = jtaskService.getUserJtask(taskpage);
			session.setAttribute("userJtasklist", list);
			List<Jnotice> list1 = jnoticeService.getUserJnotice();
			session.setAttribute("userJnoticelist", list1);
			return "page/jtask";//listAll页面
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "/";
		}
	}
}
