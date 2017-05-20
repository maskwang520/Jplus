package com.jplus.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jplus.model.AccessSum;
import com.jplus.model.BBSRecommend;
import com.jplus.model.FriendLink;
import com.jplus.model.NavUrl;
import com.jplus.service.AccessSumService;
import com.jplus.service.BBSRecommendService;
import com.jplus.service.FriendLinkService;
import com.jplus.service.NavUrlService;
import com.jplus.service.SystemManageService;
import com.jplus.util.DateUtil;

/**
 * @title 系统初始化  动作控制层
 * 
 * @author Chitry
 * @time 2015.10.30
 * 
 * @description 需要进行初始化的session域对象数据
 * 				1.访问量
 * 				2.友情链接
 * 				3.合作案例
 * 				4.合作单位
 */
@Controller
public class IndexMapperController {

	private AccessSumService accessSumService;//访问量信息
	private FriendLinkService friendLinkService;//友情链接信息
	private NavUrlService navUrlService;//合作案例信息
	private BBSRecommendService bbsRecommendService;//合作单位信息
	private SystemManageService systemManageService;

	public SystemManageService getSystemManageService() {
		return systemManageService;
	}

	@Autowired
	public void setSystemManageService(SystemManageService systemManageService) {
		this.systemManageService = systemManageService;
	}
	public AccessSumService getAccessSumService() {
		return accessSumService;
	}
	public FriendLinkService getFriendLinkService() {
		return friendLinkService;
	}
	public NavUrlService getNavUrlService() {
		return navUrlService;
	}
	public BBSRecommendService getBBSRecommendService() {
		return bbsRecommendService;
	}
	@Autowired
	public void setAccessSumService(AccessSumService accessSumService) {
		this.accessSumService = accessSumService;
	}
	@Autowired
	public void setFriendLinkService(FriendLinkService friendLinkService) {
		this.friendLinkService = friendLinkService;
	}
	@Autowired
	public void setNavUrlService(NavUrlService navUrlService) {
		this.navUrlService = navUrlService;
	}
	@Autowired
	public void setBBSRecommendService(BBSRecommendService bbsRecommendService) {
		this.bbsRecommendService = bbsRecommendService;
	}
	
	@SuppressWarnings("finally")
	@RequestMapping("JplusIndex")
	public String index(HttpServletRequest request){
		try {			
			HttpSession session = request.getSession();
			
			/**
			 * 1.访问量更新数据初始化
			 */
			List<AccessSum> aslist = new ArrayList<AccessSum>();
			aslist = accessSumService.getAll();
			//访问量更新
			String now = DateUtil.getnow();
			String old = null;
			long tdday = 0;
			int nowacces = 0;
			int lastyear = 0;
			int lastmonth = 0;
			int lastweek = 0;
			int yest = 0;
			int yyest = 0;
			AccessSum asses = new AccessSum();
			for (int od = 0; od < aslist.size(); od++) {
				asses = aslist.get(od);
				old = DateUtil.cknow(asses.getAsMaxdate());
				try {
					tdday = Long.parseLong(DateUtil.getTimeDifferent(now, old, 1));
				} catch (NumberFormatException e) {
					e.printStackTrace();
				} catch (ParseException e) {
					e.printStackTrace();
				}
				// 年浏览量初始化
				switch (asses.getId()) {
				case 1:// 历史总浏览量
					nowacces = asses.getAsSum()+1;// 记录本次是历史上第几次访问
					asses.setAsSum(nowacces);
					asses.setAsMax(asses.getAsSum());//记录历史峰值
					break;
				case 2:// 今年总浏览量
					if (tdday >= 365) {lastyear=asses.getAsSum();asses.setAsSum(0);asses.setAsMaxdate(DateUtil.kcnow((now)));}
					asses.setAsSum(asses.getAsSum() + 1);
					asses.setAsMax(asses.getAsSum());//记录历史峰值
					break;
				case 3:// 本月总流量
					if (tdday >= 30) {lastmonth=asses.getAsSum();asses.setAsSum(0);asses.setAsMaxdate(DateUtil.kcnow((now)));}
					asses.setAsSum(asses.getAsSum() + 1);
					asses.setAsMax(asses.getAsSum());//记录历史峰值
					break;
				case 4:// 本周总浏览量
					if (tdday >= 7) {lastweek=asses.getAsSum();asses.setAsSum(0);asses.setAsMaxdate(DateUtil.kcnow((now)));}
					asses.setAsSum(asses.getAsSum() + 1);
					asses.setAsMax(asses.getAsSum());//记录历史峰值
					break;
				case 5:// 今天浏览量
					if (tdday >= 1) {yest=asses.getAsSum();asses.setAsSum(0);asses.setAsMaxdate(DateUtil.kcnow((now)));}
					asses.setAsSum(asses.getAsSum() + 1);
					asses.setAsMax(asses.getAsSum());//记录历史峰值
					break;
				case 6:// 去年浏览量
					if (lastyear!=0) {asses.setAsSum(lastyear);asses.setAsMax(asses.getAsSum());asses.setAsMaxdate(DateUtil.kcnow((now)));}break;
				case 7:// 上月浏览量
					if (lastmonth!=0) {asses.setAsSum(lastmonth);asses.setAsMax(asses.getAsSum());asses.setAsMaxdate(DateUtil.kcnow((now)));}break;
				case 8:// 上周浏览量
					if (lastweek!=0) {asses.setAsSum(lastweek);asses.setAsMax(asses.getAsSum());asses.setAsMaxdate(DateUtil.kcnow((now)));}break;
				case 9:// 昨天浏览量
					if (yest!=0) {yyest=asses.getAsSum();asses.setAsSum(yest);asses.setAsMax(asses.getAsSum());asses.setAsMaxdate(DateUtil.kcnow((now)));}break;
				case 10://前天浏览量
					if (yyest!=0) {asses.setAsSum(yyest);asses.setAsMax(asses.getAsSum());asses.setAsMaxdate(DateUtil.kcnow((now)));}break;
				default:
					break;
				}
				try {
					accessSumService.update(asses);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			session.setAttribute("nowaccess", nowacces);
			
			
			/**
			 * 2.友情链接数据初始化
			 */
			List<FriendLink> friendlinklist = new ArrayList<FriendLink>();
			friendlinklist = systemManageService.findFriendlink();
			session.setAttribute("fllist", friendlinklist);
			
			/**
			 * 3.合作案例数据初始化
			 */
			//1.合作案例-作品
			List<NavUrl> allist = new ArrayList<NavUrl>();
			List<NavUrl> navlist = new ArrayList<NavUrl>();
			allist = navUrlService.getAll();
			for(NavUrl n:allist){
				NavUrl nav = new NavUrl();
				String []str1=n.getnUrl().split("@");
				nav.setNpic(str1[0]);//图片路径
				nav.setnUrl(str1[1]);//链接地址
				nav.setnName(n.getnName());//作品名称
				nav.setnTitle(n.getnTitle());//作品小标题
				nav.setnDescriptions(n.getnDescriptions());//作品描述
				navlist.add(nav);
			}
			session.setAttribute("examplelist", navlist);
			
			
			/**
			 * 4.合作单位数据初始化
			 */
			List<BBSRecommend> bbsrecommendlist = new ArrayList<BBSRecommend>();
			List<BBSRecommend> bbsrelist = new ArrayList<BBSRecommend>();
			bbsrecommendlist = bbsRecommendService.getAll();
			for(BBSRecommend n:bbsrecommendlist){
				String []str1=n.getBrPurl().split("@");
				BBSRecommend br = new BBSRecommend();
				br.setBrPurl(str1[0]);//图片1路径
				br.setBrPurl2(str1[1]);//图片1路径
				br.setBrUrl(n.getBrUrl());//链接地址
				br.setBrName(n.getBrName());//单位名称
				br.setBrTitle(n.getBrTitle());//单位标题
				br.setBrDescriptions(n.getBrDescriptions());//单位描述
				bbsrelist.add(br);
			}
			session.setAttribute("bbslist", bbsrelist);
			
			/**
			 * 汇总转发
			 */
			//return "index";//listAll页面
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "添加信息失败！具体异常信息：" + e.getMessage());
		} finally {			
			return "index"; 
		}
	}
	
}
