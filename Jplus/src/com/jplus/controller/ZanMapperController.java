package com.jplus.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jplus.model.Zan;
import com.jplus.service.ZanService;

@Controller
public class ZanMapperController {
	private ZanService zanservice;
	public ZanService getZanservice() {
		return zanservice;
	}
	@Autowired
	public void setZanservice(ZanService zanservice) {
		this.zanservice = zanservice;
	}
	
	@RequestMapping("zan")
	public String zan(Zan z, HttpServletRequest request,HttpServletResponse response) throws IOException{
		System.out.println("++++++++++++++++++");
		System.out.println(z.getId());
		request.setCharacterEncoding("utf-8"); 
		Zan zz = new Zan();
		response.setContentType("text/html;chatset=utf-8");
		PrintWriter out = response.getWriter();
		String one = request.getParameter("id");
		String two = request.getParameter("userid");
		Integer id = Integer.parseInt(one);
		Integer userid = Integer.parseInt(two);
		zz.setId(id);
		zz.setUserid(userid);
		int ff = zanservice.insert(zz);
		System.out.println(ff);
		
		out.write("fuck!");
//		mav.addObject("one", map1);
//		mav.addObject("two", map2);
		return "ziyuan/newjsp1";

	}
}
