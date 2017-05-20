package com.jplus.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jplus.json.JSONArray;
import com.jplus.json.JSONObject;
import com.jplus.model.AccessSum;
import com.jplus.model.BBSRecommend;
import com.jplus.model.Closeweb;
import com.jplus.model.FriendLink;
import com.jplus.model.Identify;
import com.jplus.model.Jnotice;
import com.jplus.model.JplusDesc;
import com.jplus.model.Jtask;
import com.jplus.model.Member;
import com.jplus.model.NavUrl;
import com.jplus.model.NetPurl;
import com.jplus.model.Res;
import com.jplus.model.ResClass;
import com.jplus.model.ToolOfficeRecommend;
import com.jplus.model.User;
import com.jplus.model.UserLevel;
import com.jplus.model.UserMsg;
import com.jplus.model.VedioRecommend;
import com.jplus.service.SystemManageService;
import com.jplus.util.InfoZHUtils;

/**
 * info:系统管理页面
 * 
 * @author hu
 * 
 */
@Controller
public class SystemManageController {
	private SystemManageService systemManageService;

	public SystemManageService getSystemManageService() {
		return systemManageService;
	}

	@Autowired
	public void setSystemManageService(SystemManageService systemManageService) {
		this.systemManageService = systemManageService;
	}

	@RequestMapping("login_manage")
	public String loginPage(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("limit") String limit) {
		HttpSession session = request.getSession();
		User user = systemManageService.findUserByNPL(username, password, limit);
		if (user != null) {
			session.setAttribute("user", user);
			if ("5".equals(limit)) {
				return "manage/sysManage/main_sysManage";
			} else if ("3".equals(limit)) {
				return "manage/webManage/main_webManage";
			} else if ("2".equals(limit)) {
				return "manage/memManage/main_memManage";
			} else if ("4".equals(limit)) {
				return "manage/teaManage/main_teaManage";
			}
		}
		request.setAttribute("message", "用户名或者密码错误");
		if ("5".equals(limit) || "3".equals(limit)) {
			return "manage/login/login_sys";
		} else {
			return "manage/login/login_mem";
		}

	}

	@RequestMapping("login_out")
	public String login_out(HttpServletRequest request) {
		String method = request.getParameter("method");
		request.getSession().removeAttribute("user");
		if ("sys".equals(method)) {
			return "manage/login/login_sys";
		}
		return "manage/login/login_mem";
	}

	@RequestMapping("findAllUsers")
	public void findAllUser(HttpServletResponse response) throws Exception {
		List<User> users = systemManageService.findAllUser();
		ArrayList<User> a = new ArrayList<User>();
		for (User u : users) {
			if (u.getUsername() == null) {
				u.setUsername("无");
			}
			if (u.getRealname() == null) {
				u.setRealname("无");
			}

			if (u.getRegtime() == null) {
				u.setRegtimeString("无");
			} else {
				u.setRegtimeString(u.getRegtime().toLocaleString());
			}
			if (u.getEmail() == null) {
				u.setEmail("无");
			}
			if (u.getQq() == null) {
				u.setQq("无");
			}
			if (u.getTelephone() == null) {
				u.setTelephone("无");
			}
			int limits = u.getLimits();
			int identifys = u.getIdentifys();
			int userlevelId = u.getUserlevelId();
			String limit = InfoZHUtils.limitZH(limits);
			String identify = InfoZHUtils.identifyZH(identifys);
			String userlevels = userlevelId + ":" + systemManageService.findUserlevel(userlevelId).getDescriptions();
			u.setLimitsString(limit);
			u.setIdentifysString(identify);
			u.setUserlevelsString(userlevels);
			a.add(u);
		}
		JSONArray json = new JSONArray(a);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("findUserByuserId")
	public void findUserByuserId(HttpServletResponse response, @RequestParam("id") String id) throws Exception {
		User u = systemManageService.findUserByuserId(id);
		if (u.getRegtime() == null) {
			u.setRegtimeString("");
		} else {
			u.setRegtimeString(u.getRegtime().toLocaleString());
		}
		int userlevelId = u.getUserlevelId();
		String userlevels = userlevelId + ":" + systemManageService.findUserlevel(userlevelId).getDescriptions();
		u.setUserlevelsString(userlevels);
		response.setContentType("text/html;charset=UTF-8");
		JSONObject jb = new JSONObject(u);
		response.getWriter().println(jb);
	}

	@RequestMapping("updateUserById")
	public void updateUserById(HttpServletResponse response, @RequestParam("id") String id,
			@RequestParam("username") String username, @RequestParam("realname") String realname,
			@RequestParam("age") String age, @RequestParam("sex") String sex, @RequestParam("birthday") String birthday,
			@RequestParam("certsnum") String certsnum, @RequestParam("telephone") String telephone,
			@RequestParam("email") String email, @RequestParam("address") String address,
			@RequestParam("hobby") String hobby, @RequestParam("regtime") String regtime,
			@RequestParam(value = "limits", required = false) String limits,
			@RequestParam(value = "userlevelId", required = false) String userlevelId,
			@RequestParam(value = "identifys", required = false) Integer identifys,
			@RequestParam("scores") String scores, @RequestParam("qq") String qq) throws Exception {
		User user = systemManageService.findUserByuserId(id);
		user.setUsername(username);
		user.setRealname(realname);
		if (age != "") {
			user.setAge(Integer.valueOf(age));
		}
		user.setSex(Integer.valueOf(sex));
		user.setBirthday(birthday);
		user.setCertsnum(certsnum);
		user.setTelephone(telephone);
		user.setEmail(email);
		user.setAddress(address);
		user.setHobby(hobby);
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		user.setRegtime(date.parse(regtime));
		if (limits != null) {
			user.setLimits(Integer.valueOf(limits));
		}
		if (userlevelId != null) {
			user.setUserlevelId(Integer.valueOf(userlevelId));
		}
		if (identifys != null) {
			user.setIdentifys(identifys);
		}
		user.setScores(Integer.valueOf(scores));
		user.setQq(qq);
		systemManageService.updateUser(user);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write("修改成功");
	}

	@RequestMapping(value = "deleteUserByuserId")
	public String deleteUserByuserId(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		systemManageService.deleteUserByuserId(id);
		response.getWriter().print("");
		return null;
	}

	@RequestMapping("findAllUsermsg")
	public void findAllUsermsg(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<UserMsg> usermsgs = systemManageService.findAllUsermsg();
		ArrayList<Map> a = new ArrayList<Map>();
		for (UserMsg um : usermsgs) {
			User u = systemManageService.findUserByuserId(String.valueOf(um.getUserId()));
			Map<String, String> map = new HashMap<String, String>();
			map.put("username", u.getUsername());
			map.put("realname", u.getRealname());
			map.put("id", String.valueOf(um.getId()));
			map.put("msgcontent", um.getMsgcontent());
			int readsign = um.getReadsign();
			if (readsign == 1) {
				map.put("readsign", "已读");
			} else {
				map.put("readsign", "未读");
			}
			map.put("gettime", um.getGettime().toLocaleString());
			map.put("sendauthor", um.getSendauthor());
			a.add(map);
		}
		JSONArray json = new JSONArray(a);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("findUserMsgById")
	public void findUserMsgById(HttpServletResponse response, @RequestParam("id") String id) throws Exception {
		UserMsg um = systemManageService.findUserMsgById(id);
		um.setDatetimeString(um.getGettime().toLocaleString());
		JSONObject json = new JSONObject(um);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("updateUserMsgById")
	public void updateUserMsgById(HttpServletResponse response, @RequestParam("id") String id,
			@RequestParam("msgcontent") String msgcontent, @RequestParam("readsign") String readsign,
			@RequestParam("sendauthor") String sendauthor, @RequestParam("gettime") String gettime) throws Exception {
		UserMsg usermsg = systemManageService.findUserMsgById(id);
		usermsg.setMsgcontent(msgcontent);
		usermsg.setReadsign(Integer.valueOf(readsign));
		usermsg.setSendauthor(sendauthor);
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		usermsg.setGettime(date.parse(gettime));
		systemManageService.updateUserMsgById(usermsg);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write("修改成功");
	}

	@RequestMapping("deleteUserMsgById")
	public void deleteUserMsgById(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		systemManageService.deletedeleteUserMsgById(id);
		response.getWriter().print("");
	}

	@RequestMapping("findAllLevel")
	public void findAllLevel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<UserLevel> uls = systemManageService.findAllLevel();
		JSONArray json = new JSONArray(uls);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("findUserLevelById")
	public void findUserLevelById(HttpServletResponse response, @RequestParam("id") String id) throws Exception {
		UserLevel ul = systemManageService.findUserlevel(Integer.valueOf(id));
		JSONObject json = new JSONObject(ul);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("updateUserLevelById")
	public void updateUserLevelById(HttpServletResponse response, @RequestParam("id") String id,
			@RequestParam("levels") String levels, @RequestParam("minscores") String minscores,
			@RequestParam("descriptions") String descriptions, @RequestParam("maxscores") String maxscores)
					throws Exception {
		UserLevel ul = systemManageService.findUserlevel(Integer.valueOf(id));
		ul.setDescriptions(descriptions);
		ul.setLevels(Integer.valueOf(levels));
		ul.setMaxscores(Integer.valueOf(maxscores));
		ul.setMinscores(Integer.valueOf(minscores));
		systemManageService.updateUserLevel(ul);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write("修改成功");
	}

	@RequestMapping("findALlMember")
	public void findALlMember(HttpServletResponse response) throws Exception {
		List<Member> members = systemManageService.findAllMembers();
		ArrayList<Map> a = new ArrayList<Map>();
		for (Member m : members) {
			Map<String, String> map = new HashMap<String, String>();
			User user = systemManageService.findUserByuserId(String.valueOf(m.getUserId()));
			map.put("certsnum", user.getCertsnum());
			map.put("membername", user.getRealname());
			String identify = InfoZHUtils.identifyZH(m.getIdentifyId());
			map.put("identify", identify);
			if (m.getDescriptions() == null) {
				map.put("descriptions", "无");
			} else {
				map.put("descriptions", m.getDescriptions());
			}
			if (m.getIndentifytime() == null) {
				map.put("indentifytime", "无");
			} else {
				map.put("indentifytime", m.getIndentifytime().toLocaleString());
			}
			if (m.getNowaddress() == null) {
				map.put("nowaddress", "无");
			} else {
				map.put("nowaddress", m.getNowaddress());
			}

			if (m.getNowwork() == null) {
				map.put("nowwork", "无");
			} else {
				map.put("nowwork", m.getNowwork());
			}

			if (m.getKnowsphere() == null) {
				map.put("knowsphere", "无");
			} else {
				map.put("knowsphere", m.getKnowsphere());
			}

			if (m.getQq() == null) {
				map.put("qq", "无");
			} else {
				map.put("qq", m.getQq());
			}

			if (m.getTelephone() == null) {
				map.put("telephone", "无");
			} else {
				map.put("telephone", m.getTelephone());
			}

			if (m.getBlogs() == null) {
				map.put("blogs", "无");
			} else {
				map.put("blogs", m.getBlogs());
			}
			map.put("id", String.valueOf(m.getId()));
			a.add(map);
		}
		JSONArray json = new JSONArray(a);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("findMemberByuserId")
	public void findMemberByuserId(HttpServletResponse response, @RequestParam("id") String id) throws Exception {
		Member m = systemManageService.findMemberById(id);
		m.setIdentifyname(InfoZHUtils.identifyZH(m.getIdentifyId()));
		m.setViewtypename(InfoZHUtils.viewTypeZH(m.getViewtype()));
		m.setIndentifytimeString(m.getIndentifytime().toLocaleString());
		response.setContentType("text/html;charset=UTF-8");
		JSONObject jb = new JSONObject(m);
		response.getWriter().println(jb);
	}

	@RequestMapping("updateMemberById")
	public void updateMemberById(HttpServletResponse response, @RequestParam("id") String id,
			@RequestParam("descriptions") String descriptions, @RequestParam("cotents") String cotents,
			@RequestParam("purl") String purl, @RequestParam("nowaddress") String nowaddress,
			@RequestParam("nowwork") String nowwork, @RequestParam("knowsphere") String knowsphere,
			@RequestParam("skills") String skills, @RequestParam("educations") String educations,
			@RequestParam("workbk") String workbk, @RequestParam("myplan") String myplan,
			@RequestParam("suggestions") String suggestions, @RequestParam("qq") String qq,
			@RequestParam("telephone") String telephone, @RequestParam("email") String email,
			@RequestParam("weixinnum") String weixinnum, @RequestParam("blogs") String blogs,
			@RequestParam("viewtypename") String viewtypename, @RequestParam("pwurl") String pwurl,
			@RequestParam("indentifytime") String indentifytime) throws Exception {
		Member m = systemManageService.findMemberById(id);
		m.setDescriptions(descriptions);
		m.setCotents(cotents);
		m.setPurl(purl);
		m.setNowaddress(nowaddress);
		m.setMyplan(myplan);
		m.setNowwork(nowwork);
		m.setKnowsphere(knowsphere);
		m.setSkills(skills);
		m.setEducations(educations);
		m.setWeixinnum(weixinnum);
		m.setWorkbk(workbk);
		m.setSuggestions(suggestions);
		m.setQq(qq);
		m.setTelephone(telephone);
		m.setEmail(email);
		m.setBlogs(blogs);
		m.setViewtype(Integer.valueOf(viewtypename));
		m.setPwurl(pwurl);
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		m.setIndentifytime(date.parse(indentifytime));
		systemManageService.updateMember(m);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write("修改成功");
	}

	@RequestMapping("deleteMemberByuserId")
	public void deleteMemberByuserId(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		systemManageService.deleteMemberByuserId(id);
		response.getWriter().print("");
	}

	@RequestMapping("findAllIndentify")
	public void findAllIndentify(HttpServletResponse response) throws Exception {
		List<Identify> idens = systemManageService.findAllIndentify();
		JSONArray json = new JSONArray(idens);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("findIdentifyById")
	public void updateIdentifyById(HttpServletResponse response, @RequestParam("id") String id) throws Exception {
		Identify iden = systemManageService.findIdentifyById(id);
		JSONObject json = new JSONObject(iden);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("updateIdentify1")
	public void updateIdentify1(HttpServletResponse response, @RequestParam("id") String id,
			@RequestParam("iname") String iname, @RequestParam("certnum") String certnum,
			@RequestParam("sessions") String sessions, @RequestParam("descriptions") String descriptions,
			@RequestParam("positions") String positions) throws Exception {
		Identify iden = systemManageService.findIdentifyById(id);
		iden.setIname(iname);
		iden.setCertnum(certnum);
		iden.setSessions(Integer.valueOf(sessions));
		iden.setPositions(positions);
		iden.setDescriptions(descriptions);
		systemManageService.updateIdentify(iden);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write("修改成功");
	}

	@RequestMapping("deleteIdentifyById")
	public void deleteIdentifyById(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		systemManageService.deleteIdentifyById(id);
		response.getWriter().print("");
	}

	@RequestMapping("insertIdentify")
	public void insertIdentify(HttpServletResponse response, @RequestParam("iname") String iname,
			@RequestParam("certnum") String certnum, @RequestParam("sessions") String sessions,
			@RequestParam("descriptions") String descriptions, @RequestParam("positions") String positions)
					throws Exception {
		Identify iden = new Identify();
		iden.setIname(iname);
		iden.setCertnum(certnum);
		iden.setSessions(Integer.valueOf(sessions));
		iden.setPositions(positions);
		iden.setDescriptions(descriptions);
		systemManageService.addIdentify(iden);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write("添加成功");
	}

	@RequestMapping("updateUserpassword")
	public void updateUserpassword(HttpServletResponse response, @RequestParam("id") String id,
			@RequestParam("p1") String p1, @RequestParam("p2") String p2) throws Exception {
		User user = systemManageService.findUserByuserId(id);
		if (p1.equals(user.getPassword())) {
			user.setPassword(p2);
			systemManageService.updateUser(user);
			response.getWriter().print("true");
		} else {
			response.getWriter().print("false");
		}
	}

	@RequestMapping("updateUserById1")
	public void updateUserById1(HttpServletResponse response, @RequestParam("id") String id,
			@RequestParam("realname") String realname, @RequestParam("age") String age, @RequestParam("sex") String sex,
			@RequestParam("certsnum") String certsnum, @RequestParam("birthday") String birthday,
			@RequestParam("telephone") String telephone, @RequestParam("email") String email,
			@RequestParam("address") String address, @RequestParam("hobby") String hobby, @RequestParam("qq") String qq)
					throws Exception {
		User user = systemManageService.findUserByuserId(id);
		user.setRealname(realname);
		if (age != "") {
			user.setAge(Integer.valueOf(age));
		}
		user.setSex(Integer.valueOf(sex));
		user.setBirthday(birthday);
		user.setTelephone(telephone);
		user.setCertsnum(certsnum);
		user.setEmail(email);
		user.setAddress(address);
		user.setHobby(hobby);
		user.setQq(qq);
		systemManageService.updateUser(user);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write("修改成功");
	}

	@RequestMapping("findMemberByuserId1")
	public void findMemberByuserId1(HttpServletResponse response, @RequestParam("id") String id) throws Exception {
		Member m = systemManageService.findMemberByuserId(id);
		User user = systemManageService.findUserByuserId(String.valueOf(m.getUserId()));
		Identify iden = systemManageService.findIdentifyById(String.valueOf(m.getIdentifyId()));
		Map<String, String> map = new HashMap<String, String>();
		map.put("membername", user.getRealname());
		map.put("purl", m.getPurl());
		map.put("descriptions", m.getDescriptions());
		map.put("cotents", m.getCotents());
		map.put("nowaddress", m.getNowaddress());
		map.put("nowwork", m.getNowwork());
		map.put("myplan", m.getMyplan());
		map.put("skills", m.getSkills());
		map.put("knowsphere", m.getKnowsphere());
		map.put("educations", m.getEducations());
		map.put("workbk", m.getWorkbk());
		map.put("suggestions", m.getSuggestions());
		map.put("qq", m.getQq());
		map.put("telephone", m.getTelephone());
		map.put("email", m.getEmail());
		map.put("weixinnum", m.getWeixinnum());
		map.put("blogs", m.getBlogs());
		map.put("viewtype", String.valueOf(m.getViewtype()));
		map.put("pwurl", m.getPwurl());
		map.put("id", String.valueOf(m.getId()));
		if (iden == null) {
			map.put("sessions", "没有认证");
			map.put("positions", "没有认证");
		} else {
			map.put("sessions", String.valueOf(iden.getSessions()));
			map.put("positions", iden.getPositions());
		}
		response.setContentType("text/html;charset=UTF-8");
		JSONObject json = new JSONObject(map);
		response.getWriter().println(json);
	}

	@RequestMapping("updateMemberById1")
	public void updateMemberById1(HttpServletResponse response, @RequestParam("id") String id,
			@RequestParam("sessions") String sessions, @RequestParam("descriptions") String descriptions,
			@RequestParam("cotents") String cotents, @RequestParam("nowaddress") String nowaddress,
			@RequestParam("nowwork") String nowwork, @RequestParam("myplan") String myplan,
			@RequestParam("knowsphere") String knowsphere, @RequestParam("skills") String skills,
			@RequestParam("workbk") String workbk, @RequestParam("suggestions") String suggestions,
			@RequestParam("qq") String qq, @RequestParam("weixinnum") String weixinnum,
			@RequestParam("email") String email, @RequestParam("educations") String educations,
			@RequestParam("blogs") String blogs, @RequestParam("pwurl") String pwurl,
			@RequestParam("viewtype") String viewtype) throws Exception {
		Member m = systemManageService.findMemberById(id);
		Identify iden = systemManageService.findIdentifyById(String.valueOf(m.getIdentifyId()));
		iden.setSessions(Integer.valueOf(sessions));
		systemManageService.updateIdentify(iden);
		m.setDescriptions(descriptions);
		m.setCotents(cotents);
		m.setNowaddress(nowaddress);
		m.setNowwork(nowwork);
		m.setMyplan(myplan);
		m.setKnowsphere(knowsphere);
		m.setSkills(skills);
		m.setWorkbk(workbk);
		m.setSuggestions(suggestions);
		m.setQq(qq);
		m.setWeixinnum(weixinnum);
		m.setEmail(email);
		m.setEducations(educations);
		m.setBlogs(blogs);
		m.setPwurl(pwurl);
		m.setViewtype(Integer.valueOf(viewtype));
		systemManageService.updateMember(m);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println("修改成功");
	}

	// 图片上传
	@RequestMapping("uploadPicture")
	public void uploadPicture(@RequestParam("file") MultipartFile file, @RequestParam("id") String id,
			HttpServletResponse response, HttpServletRequest request) throws Exception {
		try {
			Member member = systemManageService.findMemberByuserId(id);
			String savepath = request.getSession().getServletContext().getRealPath("/style/images/images_purl");
			String filename = file.getOriginalFilename();
			int size = filename.lastIndexOf(".");
			String name = member.getId() + filename.substring(size, filename.length());
			File targetFile = new File(savepath, name);
			file.transferTo(targetFile);
			member.setPurl("/style/images/images_purl/" + name);
			systemManageService.updateMember(member);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().println("上传成功！！");
		} catch (Exception e) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().println("上传失败！！");
		}
	}

	// 通讯录
	@RequestMapping("findAllCommication")
	public void findAllCommication(HttpServletResponse response, HttpServletRequest request) throws Exception {
		List<Member> ms = systemManageService.findAllMembers();
		ArrayList<Map> a = new ArrayList<Map>();
		for (Member m : ms) {
			Map<String, String> map = new HashMap<String, String>();
			User user = systemManageService.findUserByuserId(String.valueOf(m.getUserId()));
			Identify iden = systemManageService.findIdentifyById(String.valueOf(m.getIdentifyId()));
			map.put("sf", "第" + iden.getSessions() + "届" + iden.getPositions());
			map.put("membername", user.getRealname());
			map.put("nowaddress", m.getNowaddress());
			map.put("nowaddress", m.getNowaddress());
			map.put("nowwork", m.getNowwork());
			map.put("qq", m.getQq());
			map.put("email", m.getEmail());
			map.put("telephone", m.getTelephone());
			map.put("blogs", m.getBlogs());
			map.put("pwurl", m.getPwurl());
			a.add(map);
		}
		JSONArray json = new JSONArray(a);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	// 联系管理员
	@RequestMapping("findSysmanage")
	public void findSysmanage(HttpServletResponse response, HttpServletRequest request) throws Exception {
		User user = systemManageService.findUserBylimits(5);
		Map<String, String> map = new HashMap<String, String>();
		String str = "qq：";
		if (user.getQq() == null) {
			str = str + "无,";
		} else {
			str = str + user.getQq() + ",";
		}
		if (user.getEmail() == null) {
			str = str + "邮箱：无,";
		} else {
			str = str + "邮箱：" + user.getEmail() + ",";
		}
		if (user.getTelephone() == null) {
			str = str + "电话：无,";
		} else {
			str = str + "电话：" + user.getTelephone() + ",";
		}
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(str);
	}

	// 用户访问量修改
	@RequestMapping("findUserAccess")
	public void findUserAccess(HttpServletResponse response, HttpServletRequest request) throws Exception {
		List<AccessSum> as = systemManageService.findUserAccess();
		ArrayList<Map> a = new ArrayList<Map>();
		for (AccessSum acc : as) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", String.valueOf(acc.getId()));
			map.put("as_name", acc.getAsName());
			map.put("as_sum", String.valueOf(acc.getAsSum()));
			map.put("as_max", String.valueOf(acc.getAsMax()));
			if (acc.getAsMaxdate() == null) {
				map.put("as_maxdate", "无");
			} else {
				map.put("as_maxdate", acc.getAsMaxdate().toLocaleString());
			}
			if (acc.getAsDescription() == null) {
				map.put("as_description", "无");
			} else {
				map.put("as_description", acc.getAsDescription());
			}
			a.add(map);
		}
		JSONArray json = new JSONArray(a);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("findUserAccessById")
	public void findUserAccessById(@RequestParam("id") String id, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		AccessSum acc = systemManageService.findUserAccessById(id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", String.valueOf(acc.getId()));
		map.put("as_name", acc.getAsName());
		map.put("as_sum", String.valueOf(acc.getAsSum()));
		map.put("as_max", String.valueOf(acc.getAsMax()));
		map.put("as_maxdate", acc.getAsMaxdate().toLocaleString());
		map.put("as_description", acc.getAsDescription());
		JSONObject json = new JSONObject(map);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("updateUserAccess")
	public void updateUserAccess(@RequestParam("id") String id, @RequestParam("as_max") int as_max,
			@RequestParam("as_sum") int as_sum, @RequestParam("as_maxdate") String as_maxdate,
			@RequestParam("as_description") String as_description, HttpServletResponse response) throws Exception {
		AccessSum acc = systemManageService.findUserAccessById(id);
		acc.setAsMax(as_max);
		acc.setAsSum(as_sum);
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		acc.setAsMaxdate(date.parse(as_maxdate));
		acc.setAsDescription(as_description);
		systemManageService.updateUserAccess(acc);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println("修改成功!!!");
	}

	// 友情链接
	@RequestMapping("findFriendlink")
	public void findFriendlink(HttpServletResponse response, HttpServletRequest request) throws Exception {
		List<FriendLink> fls = systemManageService.findFriendlink();
		ArrayList<Map> a = new ArrayList<Map>();
		for (FriendLink fl : fls) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", String.valueOf(fl.getId()));
			if (fl.getFlName() == null) {
				map.put("fl_name", "无");
			} else {
				map.put("fl_name", fl.getFlName());
			}
			if (fl.getFlUrl() == null) {
				map.put("fl_url", "无");
			} else {
				map.put("fl_url", fl.getFlUrl());
			}
			if (fl.getFlDescriptions() == null) {
				map.put("fl_descriptions", "无");
			} else {
				map.put("fl_descriptions", fl.getFlDescriptions());
			}
			a.add(map);
		}
		JSONArray json = new JSONArray(a);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("findFriendlinkById")
	public void findFriendlinkById(@RequestParam("id") String id, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		FriendLink fl = systemManageService.findFriendLinkById(id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", String.valueOf(fl.getId()));
		map.put("fl_name", fl.getFlName());
		map.put("fl_url", fl.getFlUrl());
		map.put("fl_descriptions", fl.getFlDescriptions());
		JSONObject json = new JSONObject(map);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("addFriendLink")
	public void addFriendLink(@RequestParam("fl_name") String fl_name, @RequestParam("fl_url") String fl_url,
			@RequestParam("fl_des") String fl_des, HttpServletResponse response) throws Exception {
		FriendLink fl = new FriendLink();
		fl.setFlName(fl_name);
		fl.setFlUrl(fl_url);
		fl.setFlDescriptions(fl_des);
		systemManageService.addFriendLink(fl);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println("友链添加成功!!!");
	}

	@RequestMapping("updateFriendlink1")
	public void updateFriendlink(@RequestParam("id") String id, @RequestParam("fl_name") String fl_name,
			@RequestParam("fl_url") String fl_url, @RequestParam("fl_descriptions") String fl_descriptions,
			HttpServletResponse response) throws Exception {
		FriendLink fl = systemManageService.findFriendLinkById(id);
		fl.setFlName(fl_name);
		fl.setFlUrl(fl_url);
		fl.setFlDescriptions(fl_descriptions);
		systemManageService.updateFriendlink(fl);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println("修改成功!!!");
	}

	// 网站静态图片地址修改
	@RequestMapping("findNetPurl")
	public void findNetPurl(HttpServletResponse response, HttpServletRequest request) throws Exception {
		List<NetPurl> nps = systemManageService.findNetPurl();
		ArrayList<Map> a = new ArrayList<Map>();
		for (NetPurl np : nps) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", String.valueOf(np.getId()));
			if (np.getNpTitle() == null) {
				map.put("np_title", "无");
			} else {
				map.put("np_title", np.getNpTitle());
			}
			if (np.getNpUrl() == null) {
				map.put("np_url", "无");
			} else {
				map.put("np_url", np.getNpUrl());
			}
			if (np.getNpDescriptions() == null) {
				map.put("np_description", "无");
			} else {
				map.put("np_description", np.getNpDescriptions());
			}
			a.add(map);
		}
		JSONArray json = new JSONArray(a);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("findNetPurlById")
	public void findNetPurlById(@RequestParam("id") String id, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		NetPurl np = systemManageService.findNetPurlById(id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", String.valueOf(np.getId()));
		map.put("np_title", np.getNpTitle());
		map.put("np_url", np.getNpUrl());
		map.put("np_description", np.getNpDescriptions());
		JSONObject json = new JSONObject(map);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("updateNetPurl")
	public void updateNetPurl(@RequestParam("id") String id, @RequestParam("np_title") String np_title,
			@RequestParam("np_url") String np_url, @RequestParam("np_description") String np_description,
			HttpServletResponse response) throws Exception {
		NetPurl np = systemManageService.findNetPurlById(id);
		np.setNpTitle(np_title);
		np.setNpUrl(np_url);
		np.setNpDescriptions(np_description);
		systemManageService.updateNetPurl(np);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println("修改成功!!!");
	}

	// 导航栏目修改
	@RequestMapping("findNavUrl")
	public void findNavUrl(HttpServletResponse response, HttpServletRequest request) throws Exception {
		List<NavUrl> nvs = systemManageService.findNavUrl();
		ArrayList<Map> a = new ArrayList<Map>();
		for (NavUrl nv : nvs) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", String.valueOf(nv.getId()));
			if (nv.getnName() == null) {
				map.put("n_name", "无");
			} else {
				map.put("n_name", nv.getnName());
			}
			if (nv.getnTitle() == null) {
				map.put("n_title", "无");
			} else {
				map.put("n_title", nv.getnTitle());
			}
			if (nv.getnUrl() == null) {
				map.put("n_url", "无");
			} else {
				map.put("n_url", nv.getnUrl());
			}
			if (nv.getnDescriptions() == null) {
				map.put("n_descriptions", "无");
			} else {
				map.put("n_descriptions", nv.getnDescriptions());
			}
			a.add(map);
		}
		JSONArray json = new JSONArray(a);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("findNavUrlById")
	public void findNavUrlById(@RequestParam("id") String id, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		NavUrl nv = systemManageService.findNavUrlById(id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", String.valueOf(nv.getId()));
		map.put("n_name", nv.getnName());
		map.put("n_title", nv.getnTitle());
		map.put("n_url", nv.getnUrl());
		map.put("n_descriptions", nv.getnDescriptions());
		JSONObject json = new JSONObject(map);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("updateNavUrl")
	public void updateNetPurl(@RequestParam("id") String id, @RequestParam("n_name") String n_name,
			@RequestParam("n_title") String n_title, @RequestParam("n_url") String n_url,
			@RequestParam("n_descriptions") String n_descriptions, HttpServletResponse response) throws Exception {
		NavUrl nv = systemManageService.findNavUrlById(id);
		nv.setnName(n_name);
		nv.setnTitle(n_title);
		nv.setnUrl(n_url);
		nv.setnDescriptions(n_descriptions);
		systemManageService.updateNavUrl(nv);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println("修改成功!!!");
	}

	// 论坛板块推荐修改
	@RequestMapping("findBbsRecommend")
	public void findBbsRecommend(HttpServletResponse response, HttpServletRequest request) throws Exception {
		List<BBSRecommend> brs = systemManageService.findBbsRecommend();
		ArrayList<Map> a = new ArrayList<Map>();
		for (BBSRecommend br : brs) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", String.valueOf(br.getId()));
			if (br.getBrName() == null) {
				map.put("vr_name", "无");
			} else {
				map.put("vr_name", br.getBrName());
			}
			if (br.getBrTitle() == null) {
				map.put("vr_title", "无");
			} else {
				map.put("vr_title", br.getBrTitle());
			}
			if (br.getBrUrl() == null) {
				map.put("vr_url", "无");
			} else {
				map.put("vr_url", br.getBrUrl());
			}
			if (br.getBrPurl() == null) {
				map.put("vr_purl", "无");
			} else {
				map.put("vr_purl", br.getBrPurl());
			}
			if (br.getBrDescriptions() == null) {
				map.put("vr_descriptions", "无");
			} else {
				map.put("vr_descriptions", br.getBrDescriptions());
			}
			a.add(map);
		}
		JSONArray json = new JSONArray(a);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("findBbsRecommendById")
	public void findBbsRecommendById(@RequestParam("id") String id, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		BBSRecommend br = systemManageService.findBbsRecommendById(id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", String.valueOf(br.getId()));
		map.put("vr_name", br.getBrName());
		map.put("vr_title", br.getBrTitle());
		map.put("vr_url", br.getBrUrl());
		map.put("vr_purl", br.getBrPurl());
		map.put("vr_descriptions", br.getBrDescriptions());
		JSONObject json = new JSONObject(map);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("updateBbsRecommend")
	public void updateBbsRecommend(@RequestParam("id") String id, @RequestParam("vr_name") String vr_name,
			@RequestParam("vr_title") String vr_title, @RequestParam("vr_url") String vr_url,
			@RequestParam("vr_purl") String vr_purl, @RequestParam("vr_descriptions") String vr_descriptions,
			HttpServletResponse response) throws Exception {
		BBSRecommend br = systemManageService.findBbsRecommendById(id);
		br.setBrName(vr_name);
		br.setBrTitle(vr_title);
		br.setBrUrl(vr_url);
		br.setBrPurl(vr_purl);
		br.setBrDescriptions(vr_descriptions);
		systemManageService.updateBbsRecommend(br);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println("修改成功!!!");
	}

	// 专辑推荐修改
	@RequestMapping("findVedioRecommend")
	public void findVedioRecommend(HttpServletResponse response, HttpServletRequest request) throws Exception {
		List<VedioRecommend> vrs = systemManageService.findVedioRecommend();
		ArrayList<Map> a = new ArrayList<Map>();
		for (VedioRecommend vr : vrs) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", String.valueOf(vr.getId()));
			if (vr.getVrName() == null) {
				map.put("vr_name", "无");
			} else {
				map.put("vr_name", vr.getVrName());
			}
			if (vr.getVrTitle() == null) {
				map.put("vr_title", "无");
			} else {
				map.put("vr_title", vr.getVrTitle());
			}
			if (vr.getVrUrl() == null) {
				map.put("vr_url", "无");
			} else {
				map.put("vr_url", vr.getVrUrl());
			}
			if (vr.getVrPurl() == null) {
				map.put("vr_purl", "无");
			} else {
				map.put("vr_purl", vr.getVrPurl());
			}
			if (vr.getVrDescriptions() == null) {
				map.put("vr_descriptions", "无");
			} else {
				map.put("vr_descriptions", vr.getVrDescriptions());
			}
			a.add(map);
		}
		JSONArray json = new JSONArray(a);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("findVedioRecommendId")
	public void findVedioRecommendId(@RequestParam("id") String id, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		VedioRecommend vr = systemManageService.findVedioRecommendId(id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", String.valueOf(vr.getId()));
		map.put("vr_name", vr.getVrName());
		map.put("vr_title", vr.getVrTitle());
		map.put("vr_url", vr.getVrUrl());
		map.put("vr_purl", vr.getVrPurl());
		map.put("vr_descriptions", vr.getVrDescriptions());
		JSONObject json = new JSONObject(map);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("updateVedioRecommend")
	public void updateVedioRecommend(@RequestParam("id") String id, @RequestParam("vr_name") String vr_name,
			@RequestParam("vr_title") String vr_title, @RequestParam("vr_url") String vr_url,
			@RequestParam("vr_purl") String vr_purl, @RequestParam("vr_descriptions") String vr_descriptions,
			HttpServletResponse response) throws Exception {
		VedioRecommend vr = systemManageService.findVedioRecommendId(id);
		vr.setVrName(vr_name);
		vr.setVrTitle(vr_title);
		vr.setVrUrl(vr_url);
		vr.setVrPurl(vr_purl);
		vr.setVrDescriptions(vr_descriptions);
		systemManageService.updateVedioRecommend(vr);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println("修改成功!!!");
	}

	// 实用工具推荐修改
	@RequestMapping("findToolRecommend")
	public void findToolRecommend(HttpServletResponse response, HttpServletRequest request) throws Exception {
		List<ToolOfficeRecommend> trs = systemManageService.findToolRecommend();
		ArrayList<Map> a = new ArrayList<Map>();
		for (ToolOfficeRecommend tr : trs) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", String.valueOf(tr.getId()));
			if (tr.getTorName() == null) {
				map.put("tr_name", "无");
			} else {
				map.put("tr_name", tr.getTorName());
			}
			if (tr.getTorTitle() == null) {
				map.put("tr_title", "无");
			} else {
				map.put("tr_title", tr.getTorTitle());
			}
			if (tr.getTorUrl() == null) {
				map.put("tr_url", "无");
			} else {
				map.put("tr_url", tr.getTorUrl());
			}
			if (tr.getTorPurl() == null) {
				map.put("tr_purl", "无");
			} else {
				map.put("tr_purl", tr.getTorPurl());
			}
			if (tr.getTorDescriptions() == null) {
				map.put("tr_descriptions", "无");
			} else {
				map.put("tr_descriptions", tr.getTorDescriptions());
			}
			a.add(map);
		}
		JSONArray json = new JSONArray(a);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("findToolRecommendById")
	public void findToolRecommendById(@RequestParam("id") String id, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		ToolOfficeRecommend tr = systemManageService.findToolRecommendById(id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", String.valueOf(tr.getId()));
		map.put("tr_name", tr.getTorName());
		map.put("tr_title", tr.getTorTitle());
		map.put("tr_url", tr.getTorUrl());
		map.put("tr_purl", tr.getTorPurl());
		map.put("tr_descriptions", tr.getTorDescriptions());
		JSONObject json = new JSONObject(map);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("updateToolRecommend")
	public void updateToolRecommend(@RequestParam("id") String id, @RequestParam("tr_name") String tr_name,
			@RequestParam("tr_title") String tr_title, @RequestParam("tr_url") String tr_url,
			@RequestParam("tr_purl") String tr_purl, @RequestParam("tr_descriptions") String tr_descriptions,
			HttpServletResponse response) throws Exception {
		ToolOfficeRecommend tr = systemManageService.findToolRecommendById(id);
		tr.setTorName(tr_name);
		tr.setTorTitle(tr_title);
		tr.setTorUrl(tr_url);
		tr.setTorPurl(tr_purl);
		tr.setTorDescriptions(tr_descriptions);
		systemManageService.updateToolRecommend(tr);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println("修改成功!!!");
	}

	// 公告管理
	@RequestMapping("findNotices")
	public void findNotices(HttpServletResponse response, HttpServletRequest request) throws Exception {
		List<Jnotice> jts = systemManageService.findNotices();
		ArrayList<Map> a = new ArrayList<Map>();
		for (Jnotice jt : jts) {
			Map<String, String> map = new HashMap<String, String>();
			User user = systemManageService.findUserByuserId(String.valueOf(jt.getNoticeAuthorId()));
			map.put("realname", user.getRealname());
			map.put("id", String.valueOf(jt.getId()));
			map.put("n_title", jt.getNoticeTitle());
			map.put("n_content", jt.getNoticeContent());
			map.put("n_reltime", jt.getNoticeReltime().toLocaleString());
			a.add(map);
		}
		JSONArray json = new JSONArray(a);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("findNoticesById")
	public void findNoticesById(@RequestParam("id") String id, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		Jnotice jt = systemManageService.findNoticesById(id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", String.valueOf(jt.getId()));
		map.put("n_title", jt.getNoticeTitle());
		map.put("n_content", jt.getNoticeContent());
		map.put("n_reltime", jt.getNoticeReltime().toLocaleString());
		JSONObject json = new JSONObject(map);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("updateNotices")
	public void updateNotices(@RequestParam("id") String id, @RequestParam("n_title") String n_title,
			@RequestParam("n_content") String n_content, @RequestParam("n_reltime") String n_reltime,
			HttpServletResponse response) throws Exception {
		Jnotice jt = systemManageService.findNoticesById(id);
		jt.setNoticeTitle(n_title);
		jt.setNoticeContent(n_content);
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		jt.setNoticeReltime(date.parse(n_reltime));
		systemManageService.updateNotices(jt);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println("修改成功!!!");
	}

	@RequestMapping("deleteNotices")
	public void deleteNotices(@RequestParam("id") Integer id, HttpServletResponse response) throws Exception {
		systemManageService.deleteNotices(id);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println("删除成功!!!");
	}

	@RequestMapping("addNotices")
	public void addNotices(@RequestParam("userId") Integer userid, @RequestParam("n_title") String n_title,
			@RequestParam("n_content") String n_content, @RequestParam("n_reltime") String n_reltime,
			HttpServletResponse response) throws Exception {
		Jnotice jt = new Jnotice();
		jt.setNoticeTitle(n_title);
		jt.setNoticeContent(n_content);
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		jt.setNoticeReltime(date.parse(n_reltime));
		jt.setNoticeAuthorId(userid);
		systemManageService.addNotices(jt);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println("公告发布成功!!!");
	}

	// 任务管理
	@RequestMapping("findTaks")
	public void findTaks(HttpServletResponse response, HttpServletRequest request) throws Exception {
		List<Jtask> jts = systemManageService.findTaks();
		ArrayList<Map> a = new ArrayList<Map>();
		for (Jtask jt : jts) {
			Map<String, String> map = new HashMap<String, String>();
			User user = systemManageService.findUserByuserId(String.valueOf(jt.getTaskAuthorId()));
			map.put("realname", user.getRealname());
			map.put("id", String.valueOf(jt.getId()));
			map.put("n_title", jt.getTaskTitle());
			map.put("n_content", jt.getTaskContent());
			map.put("n_des", jt.getTaskDescription());
			map.put("n_reltime", jt.getTaskReltime().toLocaleString());
			a.add(map);
		}
		JSONArray json = new JSONArray(a);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("findTasksById")
	public void findTasksById(@RequestParam("id") String id, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		Jtask jt = systemManageService.findTasksById(id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", String.valueOf(jt.getId()));
		map.put("n_title", jt.getTaskTitle());
		map.put("n_content", jt.getTaskContent());
		map.put("n_des", jt.getTaskDescription());
		map.put("n_reltime", jt.getTaskReltime().toLocaleString());
		JSONObject json = new JSONObject(map);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("updateTasks")
	public void updateTasks(@RequestParam("id") String id, @RequestParam("n_title") String n_title,
			@RequestParam("n_content") String n_content, @RequestParam("n_des") String n_des,
			@RequestParam("n_reltime") String n_reltime, HttpServletResponse response) throws Exception {
		Jtask jt = systemManageService.findTasksById(id);
		jt.setTaskTitle(n_title);
		jt.setTaskContent(n_content);
		jt.setTaskDescription(n_des);
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		jt.setTaskReltime(date.parse(n_reltime));
		systemManageService.updateTasks(jt);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println("修改成功!!!");
	}

	@RequestMapping("deleteTasks")
	public void deleteTasks(@RequestParam("id") Integer id, HttpServletResponse response) throws Exception {
		systemManageService.deleteTasks(id);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println("删除成功!!!");
	}

	@RequestMapping("addTasks")
	public void addTasks(@RequestParam("userId") Integer userid, @RequestParam("n_title") String n_title,
			@RequestParam("n_content") String n_content, @RequestParam("n_des") String n_des,
			@RequestParam("n_reltime") String n_reltime, HttpServletResponse response) throws Exception {
		Jtask jt = new Jtask();
		jt.setTaskTitle(n_title);
		jt.setTaskContent(n_content);
		jt.setTaskDescription(n_des);
		jt.setTaskAuthorId(userid);
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		jt.setTaskReltime(date.parse(n_reltime));
		systemManageService.addTasks(jt);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println("任务发布成功!!!");
	}

	// 资源类目管理
	@RequestMapping("findResclass")
	public void findResclass(HttpServletResponse response, HttpServletRequest request) throws Exception {
		List<ResClass> rcs = systemManageService.findResclass();
		ArrayList<Map> a = new ArrayList<Map>();
		for (ResClass rc : rcs) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", String.valueOf(rc.getId()));
			map.put("resname", rc.getResname());
			map.put("isbdydown", rc.getIsbdydown() == 1 ? "允许" : "不允许");
			map.put("is360down", rc.getIs360down() == 1 ? "允许" : "不允许");
			map.put("islocationdown", rc.getIslocationdown() == 1 ? "允许" : "不允许");
			map.put("resdescription", rc.getResdescription());
			map.put("respurl", rc.getRespurl());
			a.add(map);
		}
		JSONArray json = new JSONArray(a);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("findResclassById")
	public void findResclassById(@RequestParam("id") Integer id, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		ResClass rc = systemManageService.findResclassById(id);
		JSONObject json = new JSONObject(rc);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("updateResclass")
	public void updateResclass(@RequestParam("id") Integer id, @RequestParam("resname") String resname,
			@RequestParam("resdescription") String resdescription, @RequestParam("isbdydown") Integer isbdydown,
			@RequestParam("is360down") Integer is360down, @RequestParam("islocationdown") Integer islocationdown,
			@RequestParam("respurl") String respurl, HttpServletResponse response) throws Exception {
		ResClass rc = systemManageService.findResclassById(id);
		rc.setResname(resname);
		rc.setResdescription(resdescription);
		rc.setIsbdydown(isbdydown);
		rc.setIs360down(is360down);
		rc.setIslocationdown(islocationdown);
		rc.setRespurl(respurl);
		systemManageService.updateResclass(rc);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println("修改成功!!!");
	}

	@RequestMapping("deleteResclass")
	public void deleteResclass(@RequestParam("id") Integer id, HttpServletResponse response) throws Exception {
		systemManageService.deleteResclass(id);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println("删除成功!!!");
	}

	@RequestMapping("addResclass")
	public void addResclass(@RequestParam("resname") String resname,
			@RequestParam("resdescription") String resdescription, @RequestParam("isbdydown") Integer isbdydown,
			@RequestParam("is360down") Integer is360down, @RequestParam("islocationdown") Integer islocationdown,
			@RequestParam("respurl") String respurl, HttpServletResponse response) throws Exception {
		ResClass rc = new ResClass();
		rc.setResname(resname);
		rc.setResdescription(resdescription);
		rc.setIs360down(is360down);
		rc.setIsbdydown(isbdydown);
		rc.setIslocationdown(islocationdown);
		rc.setRespurl(respurl);
		systemManageService.addResclass(rc);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println("资源类目添加成功!!!");
	}

	// 资源管理
	@RequestMapping("findRes")
	public void findRes(HttpServletResponse response, HttpServletRequest request) throws Exception {
		List<Res> res = systemManageService.findRes();
		ArrayList<Map> a = new ArrayList<Map>();
		for (Res r : res) {
			Map<String, String> map = new HashMap<String, String>();
			User user = systemManageService.findUserByuserId(String.valueOf(r.getUserId()));
			map.put("username", user.getUsername());
			ResClass rc = systemManageService.findResclassById(r.getResclassId());
			map.put("resClass", rc.getResname());
			map.put("id", String.valueOf(r.getId()));
			map.put("resname", r.getResname());
			map.put("resdescription", r.getResdescription());
			map.put("res_bdypath", r.getResBdypath());
			map.put("res_bdypassword", r.getResBdypassword());
			map.put("res_360path", r.getRes360path());
			map.put("res_360password", r.getRes360password());
			map.put("res_locationpath", r.getResLocationpath());
			map.put("downloadnum", String.valueOf(r.getDownloadnum()));
			map.put("downloadscore", String.valueOf(r.getDownloadscore()));
			map.put("resdate", r.getResdate().toLocaleString());
			int resstate = r.getResstate();
			if (resstate == 0) {
				map.put("resstate", "审核未通过");
			} else if (resstate == 1) {
				map.put("resstate", "正在审核");
			} else {
				map.put("resstate", "审核通过");
			}
			map.put("resdiscuss", String.valueOf(r.getResdiscuss()));
			a.add(map);
		}
		JSONArray json = new JSONArray(a);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("findResById")
	public void findResById(@RequestParam("id") Integer id, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		Res r = systemManageService.findResById(id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", String.valueOf(r.getId()));
		map.put("resname", r.getResname());
		map.put("resclassId", String.valueOf(r.getResclassId()));
		map.put("resdescription", r.getResdescription());
		map.put("resBdypath", r.getResBdypath());
		map.put("resBdypassword", r.getResBdypassword());
		map.put("res360path", r.getRes360path());
		map.put("res360password", r.getRes360password());
		map.put("resLocationpath", r.getResLocationpath());
		map.put("downloadnum", String.valueOf(r.getDownloadnum()));
		map.put("downloadscore", String.valueOf(r.getDownloadscore()));
		map.put("resdate1", r.getResdate().toLocaleString());
		int resstate = r.getResstate();
		if (resstate == 0) {
			map.put("resstate", "审核未通过");
		} else if (resstate == 1) {
			map.put("resstate", "正在审核");
		} else {
			map.put("resstate", "审核通过");
		}
		map.put("resdiscuss", String.valueOf(r.getResdiscuss()));
		JSONObject json = new JSONObject(map);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("updateRes")
	public void updateRes(@RequestParam("id") Integer id, @RequestParam("resname") String resname,
			@RequestParam("resClass") Integer resClass, @RequestParam("resdescription") String resdescription,
			@RequestParam("res_bdypath") String res_bdypath, @RequestParam("res_bdypassword") String res_bdypassword,
			@RequestParam("res_360path") String res_360path, @RequestParam("res_360password") String res_360password,
			@RequestParam("res_locationpath") String res_locationpath, @RequestParam("downloadnum") Integer downloadnum,
			@RequestParam("downloadscore") Integer downloadscore, @RequestParam("resdate") String resdate,
			@RequestParam("resstate") Integer resstate, @RequestParam("resdiscuss") Integer resdiscuss,
			HttpServletResponse response) throws Exception {
		Res r = systemManageService.findResById(id);
		r.setResname(resname);
		r.setResclassId(resClass);
		r.setResdescription(resdescription);
		r.setResBdypath(res_bdypath);
		r.setResBdypassword(res_bdypassword);
		r.setRes360path(res_360path);
		r.setRes360password(res_360password);
		r.setResLocationpath(res_locationpath);
		r.setDownloadnum(downloadnum);
		r.setDownloadscore(downloadscore);
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		r.setResdate(date.parse(resdate));
		r.setResstate(resstate);
		r.setResdiscuss(resdiscuss);
		systemManageService.updateRes(r);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println("修改成功!!!");
	}

	@RequestMapping("deleteRes")
	public void deleteRes(@RequestParam("id") Integer id, HttpServletResponse response) throws Exception {
		systemManageService.deleteRes(id);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println("删除成功!!!");
	}

	@RequestMapping("addRes")
	public void addRes(@RequestParam("userId") Integer userId, @RequestParam("resname") String resname,
			@RequestParam("resClass") Integer resClass, @RequestParam("resdescription") String resdescription,
			@RequestParam("res_bdypath") String res_bdypath, @RequestParam("res_bdypassword") String res_bdypassword,
			@RequestParam("res_360path") String res_360path, @RequestParam("res_360password") String res_360password,
			@RequestParam("res_locationpath") String res_locationpath, @RequestParam("downloadnum") Integer downloadnum,
			@RequestParam("downloadscore") Integer downloadscore, @RequestParam("resdate") String resdate,
			@RequestParam("resstate") Integer resstate, @RequestParam("resdiscuss") Integer resdiscuss,
			HttpServletResponse response) throws Exception {
		Res r = new Res();
		r.setResname(resname);
		r.setResclassId(resClass);
		r.setResdescription(resdescription);
		r.setResBdypath(res_bdypath);
		r.setResBdypassword(res_bdypassword);
		r.setRes360path(res_360path);
		r.setUserId(userId);
		r.setRes360password(res_360password);
		r.setResLocationpath(res_locationpath);
		r.setDownloadnum(downloadnum);
		r.setDownloadscore(downloadscore);
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		r.setResdate(date.parse(resdate));
		r.setResstate(resstate);
		r.setResdiscuss(resdiscuss);
		systemManageService.addRess(r);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println("资源上传成功!!!");
	}

	// 获取resClass的目录
	@RequestMapping("findResclassname")
	public void findResclassname(HttpServletResponse response) throws Exception {
		List<ResClass> res = systemManageService.findResclass();
		JSONArray json = new JSONArray(res);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("findJplusDes")
	public void findJplusDes(HttpServletResponse response, HttpServletRequest request) throws Exception {
		List<JplusDesc> jds = systemManageService.findJplusDes();
		ArrayList<Map> a = new ArrayList<Map>();
		for (JplusDesc jd : jds) {
			Map<String, String> map = new HashMap<String, String>();
			User user = systemManageService.findUserByuserId(String.valueOf(jd.getJdAuthor()));
			map.put("jd_author", user.getUsername());
			map.put("id", String.valueOf(jd.getId()));
			map.put("jd_title", jd.getJdTitle());
			map.put("jd_content", jd.getJdContent());
			map.put("jd_reltime", jd.getJdReltime().toLocaleString());
			a.add(map);
		}
		JSONArray json = new JSONArray(a);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("findJplusDesById")
	public void findJplusDesById(@RequestParam("id") Integer id, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		JplusDesc jd = systemManageService.findJplusDesById(id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", String.valueOf(id));
		map.put("jd_title", jd.getJdTitle());
		map.put("jd_content", jd.getJdContent());
		map.put("jd_reltime", jd.getJdReltime().toLocaleString());
		JSONObject json = new JSONObject(map);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
	}

	@RequestMapping("updateJplusDes")
	public void updateJplusDes(@RequestParam("id") Integer id, @RequestParam("jd_title") String jd_title,
			@RequestParam("jd_content") String jd_content, @RequestParam("jd_reltime") String jd_reltime,
			HttpServletResponse response) throws Exception {
		JplusDesc jd = systemManageService.findJplusDesById(id);
		jd.setJdTitle(jd_title);
		jd.setJdContent(jd_content);
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		jd.setJdReltime(date.parse(jd_reltime));
		systemManageService.updateJplusDes(jd);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println("修改成功!!!");
	}

	@RequestMapping("closeoropenweb")
	public void closeoropenweb(@RequestParam("status") Integer status, HttpServletResponse response) throws Exception {
		Closeweb c = systemManageService.findClodewebById(1);// 这里的id属性为1是固定的，不要随意修改数据的id的值
		c.setStatus(status);
		systemManageService.updateClodeweb(c);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println("修改成功!!!");
	}

	// 合作案例图片上传
	@RequestMapping("uploadPictureAL")
	public void uploadPictureAL(@RequestParam("fileAL") MultipartFile file, @RequestParam("al_name") String al_name,
			@RequestParam("al_title") String al_title, @RequestParam("al_lj") String al_lj,
			HttpServletResponse response, HttpServletRequest request) throws Exception {
		try {
			String filename = new Date().getTime() + "_" + file.getOriginalFilename();
			String savepath = request.getSession().getServletContext().getRealPath("/style/images/images_al");
			File targetFile = new File(savepath, filename);
			file.transferTo(targetFile);
			NavUrl nv = new NavUrl();
			nv.setnName(al_name);
			nv.setnTitle(al_title);
			nv.setnUrl("/style/images/images_al/" + filename + "@" + al_lj);
			systemManageService.addNavUrl(nv);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().println("案例添加成功！！");
		} catch (Exception e) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().println("案例添加失败！！");
		}
	}

	// 合作单位上传
	@RequestMapping("uploadPictureDL")
	public void uploadPictureDL(@RequestParam("fileDL") MultipartFile file, @RequestParam("dl_name") String dl_name,
			@RequestParam("dl_title") String dl_title, @RequestParam("dl_lj") String dl_lj,
			@RequestParam("dl_description") String dl_description,
			HttpServletResponse response, HttpServletRequest request) throws Exception {
		try {
			String filename = new Date().getTime() + "_" + file.getOriginalFilename();
			String savepath = request.getSession().getServletContext().getRealPath("/style/images/images_dl");
			File targetFile = new File(savepath, filename);
			file.transferTo(targetFile);
			BBSRecommend bs=new BBSRecommend();
			bs.setBrName(dl_name);
			bs.setBrTitle(dl_title);
			bs.setBrUrl(dl_lj);
			bs.setBrPurl("/style/images/images_al/" + filename);
			bs.setBrDescriptions(dl_description);
			systemManageService.addBs(bs);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().println("单位添加成功！！");
		} catch (Exception e) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().println("单位添加失败！！");
		}
	}
}
