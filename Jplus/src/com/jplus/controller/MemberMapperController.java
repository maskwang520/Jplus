package com.jplus.controller;
/*
 * author maskwang
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jplus.model.Identify;
import com.jplus.model.JplusDesc;
import com.jplus.model.Member;
import com.jplus.service.IdentifyService;
import com.jplus.service.JplusDescService;
import com.jplus.service.MemberService;
import com.jplus.service.UserService;
@Controller
public class MemberMapperController {
	 @Autowired
     private MemberService memberService;
     @Autowired
     private JplusDescService jplusDescService;
     @Autowired
     private IdentifyService identifyService;
	@SuppressWarnings("finally")
	@RequestMapping("addMember")
	public String add(Member member,HttpServletRequest request){
		try {			
			String str = memberService.add(member);
			request.setAttribute("InfoMessage", str);//操作消息
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "添加信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "/"; //这里要跳转的页面的名字，这个页面还没写，所以先空着了
		}
	}
	@RequestMapping("getAllMember")
	public String getAll(HttpServletRequest request){
		try {			
			List<Member> list = memberService.getAll();
			request.setAttribute("memberlist", list);
			return "test";//listAll页面
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "/";
		}
	}
	@SuppressWarnings("finally")
	@RequestMapping("delMember")
	public String del(Integer id,HttpServletRequest request){
		try {			
			String str = memberService.delete(id);
			request.setAttribute("InfoMessage", str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "删除信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "/";
		}
	}
	@RequestMapping("modifyMember")
	public void modify(@RequestParam(value="id")Integer id,HttpServletResponse response){
				
			Member member= memberService.findById(id);
			try {
				JSONArray json = JSONArray.fromObject(member);
				response.setContentType("text/html; charset=utf-8");
				 PrintWriter out = response.getWriter();
				    System.out.println(json.toString());
				    out.print(json.toString());
				    out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			//modify页面
		
		
	}
	@SuppressWarnings("finally")
	@RequestMapping("updateMember")
	public String update(Member member,HttpServletRequest request){
		try {			
			String str = memberService.update(member);
			request.setAttribute("InfoMessage", str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "更新信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "/";
		}
	}
   @RequestMapping("getMemberAllMessage")
   public String getMemberAllMessage(HttpServletRequest request,@RequestParam(value="sessionid")int sessionid){
	   try {
		    HttpSession session =request.getSession();
		    List<Member> list=memberService.getIdentifyUserMember(sessionid);
		    List<Identify> list3 = identifyService.getAll();
		    //List<JplusDesc> list1=jplusDescService.getAll();
		    request.setAttribute("sessionNumber",sessionid);
		    session.setAttribute("list3", list3);
			session.setAttribute("identifyUserMemberlist", list);
			//session.setAttribute("jplusDesclist", list1);
			if(list.size() == 0){
				request.setAttribute("message", "对不起，本届团队暂时还没有相关信息！！！");
	            request.setAttribute("msgurl", "/getMemberAll.do?sessionid=4");
				return "page/message";
			}else{
				return "page/jmember";//listAll页面
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "/";
		}
   }
   
   @RequestMapping("getMemberAll")
   public String getMemberAll(HttpServletRequest request,@RequestParam(value="sessionid")int sessionid){
	   try {
		    HttpSession session =request.getSession();
		    List<Member> list=memberService.getIdentifyUserMember(sessionid);
		   // System.out.println(list.get(0).getIdentify().getDescriptions()+"****"+list.get(0).getIdentify().getPositions());
		    List<Identify> list3 = identifyService.getAll();
		    List<JplusDesc> list1=jplusDescService.getAll();
		    session.setAttribute("list3", list3);
			session.setAttribute("identifyUserMemberlist", list);
			session.setAttribute("jplusDesclist", list1);
			return "page/jgroup";//listAll页面
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "/";
		}
   }
   
   @RequestMapping("getMemberMessage")
   public void getMemberMessage(HttpServletResponse response,@RequestParam(value="sessionid") int sessionid){
	   try {
		    
		    List<Member> list=memberService.getIdentifyUserMember(sessionid);
		    JSONArray json=JSONArray.fromObject(list);
		    response.setContentType("application/json;charset=UTF-8");
		   // System.out.println(json);
		    PrintWriter out = response.getWriter();  
		    out.print(json.toString());
		    out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
   }
}
