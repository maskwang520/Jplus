package com.jplus.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jplus.model.NavUrl;
import com.jplus.service.NavUrlService;

/**
 * @title 访问量信息 动作控制层
 * 
 * @author Chitry
 * @time 2015.07.22 21:20:45
 */
@Controller
public class NavUrlMapperController {
	@Autowired
	private NavUrlService navUrlService;
	
	/*@RequestMapping("getAllNavUrl")
	public String getAll(HttpServletRequest request){
		try {
			*//**
			 * 默认主页入口：所有数据初始化
			 *//*
			//1.合作案例-作品
			List<NavUrl> list = new ArrayList<NavUrl>();
			List<NavUrl> navlist = new ArrayList<NavUrl>();
			list = navUrlService.getAll();
			NavUrl nav = new NavUrl();
			for(NavUrl n:list){
				String []str=n.getnUrl().split("@");
				nav.setNpic(str[0]);//图片路径
				nav.setnUrl(str[1]);//链接地址
				nav.setnName(n.getnName());//作品名称
				nav.setnTitle(n.getnTitle());//作品小标题
				nav.setnDescriptions(n.getnDescriptions());//作品描述
				navlist.add(nav);
			}
			request.getSession().setAttribute("examplelist", navlist);
			return "index";//listAll页面
		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "/";
		}
	}
	*/
	
	
	
}
