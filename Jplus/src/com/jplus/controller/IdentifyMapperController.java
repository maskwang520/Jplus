package com.jplus.controller;
/*
 * author maskwang
 */
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jplus.model.Identify;
import com.jplus.model.Member;
import com.jplus.service.IdentifyService;
@Controller
public class IdentifyMapperController {
     private IdentifyService identifyService;

	public IdentifyService getIdentifyService() {
		return identifyService;
	}
	@Autowired
	public void setIdentifyService(IdentifyService identifyService) {
		this.identifyService = identifyService;
	}
	@SuppressWarnings("finally")
	@RequestMapping("addIdentify")
	public String add(Identify identify,HttpServletRequest request){
		try {			
			String str = identifyService.add(identify);
			request.setAttribute("InfoMessage", str);//操作消息
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "添加信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "/"; //这里要跳转的页面的名字，这个页面还没写，所以先空着了
		}
	}
	@RequestMapping("getAllIdentify")
	public String getAll(HttpServletRequest request){
		try {			
			List<Identify> list = identifyService.getAll();
			request.setAttribute("identifylist", list);
			return "test";//listAll页面
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "/";
		}
	}
	@SuppressWarnings("finally")
	@RequestMapping("delIdentify")
	public String del(Integer id,HttpServletRequest request){
		try {			
			String str = identifyService.delete(id);
			request.setAttribute("InfoMessage", str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "删除信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "/";
		}
	}
	@RequestMapping("modifyIdentify")
	public String modify(Integer id,HttpServletRequest request){
		try {			
			Identify identify= identifyService.findById(id);
			request.setAttribute("identify", identify);
			return "/";//modify页面
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "/";
		}
	}
	@SuppressWarnings("finally")
	@RequestMapping("updateIdentify")
	public String update(Identify identify,HttpServletRequest request){
		try {			
			String str = identifyService.update(identify);
			request.setAttribute("InfoMessage", str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "/";
		}
	}
	@RequestMapping("getIdentifyMember")
	public String getIdentifyMember(HttpServletRequest request){
		try {			
			List<Member> list = identifyService.getIdentifyMember();
			request.setAttribute("identifyMemberlist", list);
			return "test";//listAll页面
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "/";
		}
	}

}
