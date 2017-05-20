package com.jplus.util;

public class InfoZHUtils {
	public static String limitZH(int limits){
		if(limits==0){
			return "普通用户（信息不完整）";
		}else if(1==limits){
			return "普通用户（信息完整）";
		}else if(2==limits){
			return "实验室成员";
		}else if(3==limits){
			return "网站管理员";
		}else if(4==limits){
			return "指导老师";
		}else{
			return "系统管理员";
		}
	}
	
	public static String identifyZH(int identifys){
		if(0==identifys){
			return "非认证用户";
		}else if(identifys==-1){
			return "指导老师";
		}else if(identifys==-2){
			return "企业用户";
		}else{
			return "第"+identifys+"届实验室成员";
		}
	}
	
	public static String viewTypeZH(int viewtype){
		if(0==viewtype){
			return "0:所有用户可见 ";
		}else if(viewtype==1){
			return "1:所有Jplus实验室成员可见";
		}else if(viewtype==2){
			return "2:管理员及指导老师可见";
		}else if(viewtype==3){
			return "3:仅系统管理员可见 ";
		}else{
			return "4:仅自己可见";
		}
	}
}
