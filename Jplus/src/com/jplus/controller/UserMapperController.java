package com.jplus.controller;

/*
 * author maskwang
 */
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jplus.model.Identify;
import com.jplus.model.Member;
import com.jplus.model.TaskPage;
import com.jplus.model.User;
import com.jplus.model.UserLevel;
import com.jplus.model.UserMsg;
import com.jplus.service.IdentifyService;
import com.jplus.service.MemberService;
import com.jplus.service.UserLevelService;
import com.jplus.service.UserMsgService;
import com.jplus.service.UserService;

@Controller
public class UserMapperController {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private MemberService memberService;
	@Autowired
	private IdentifyService identifyService;
	@Autowired
	private UserLevelService userLevelService;
	@Autowired
	private UserMsgService userMsgService;
	private UserService userService;

	public UserService getUserService() {
		return userService;
	}

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@SuppressWarnings("finally")
	@RequestMapping("addUser")
	public String add(User user, HttpServletRequest request) {
		HttpSession session = request.getSession();

		String rand = (String) session.getAttribute("RANDOM_IN_SESSION");
		// System.out.println(rand+"++");
		String inputvalue = request.getParameter("yzm");
		// System.out.println(inputvalue+"--");
		if (rand.equalsIgnoreCase(inputvalue)) {
			Calendar c = Calendar.getInstance();
			c.setTimeInMillis(new Date().getTime());
			SimpleDateFormat dateFormat = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			user.setRegtime(c.getTime());
			user.setUserlevelId(1);// 这句话可以不用
			user.setScores(20);
			user.setLimits(0);
			user.setIdentifys(0);
			String str = userService.add(user);
			// request.setAttribute("InfoMessage", str);// 操作消息
			request.setAttribute("message", "恭喜你注册成功，请返回首页登录！！！");
            request.setAttribute("msgurl", "/include/j_login.jsp");
			return "page/message";

		} else {
			String str = "验证码输入错误";
			session.setAttribute("InfoMessage", str);
			return "redirect:/include/j_register.jsp";
		}

	}

	@RequestMapping("getAllUser")
	public String getAll(HttpServletRequest request) {
		try {
			List<User> list = userService.getAll();
			request.setAttribute("userlist", list);
			return "test";// listAll页面
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage",
					"信息载入失败！具体异常信息：" + e.getMessage());
			return "/";
		}
	}

	@SuppressWarnings("finally")
	@RequestMapping("delUser")
	public String del(Integer id, HttpServletRequest request) {
		try {
			String str = userService.delete(id);
			request.setAttribute("InfoMessage", str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage",
					"删除信息失败！具体异常信息：" + e.getMessage());
		} finally {
			return "/";
		}
	}

	@RequestMapping("modifyUser")
	public String modify(Integer id, HttpServletRequest request) {
		try {
			User user = userService.findById(id);
			request.setAttribute("user", user);
			return "/";// modify页面
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage",
					"信息载入失败！具体异常信息：" + e.getMessage());
			return "/";
		}
	}

	@RequestMapping("updateUser")
	public String update(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		String rand = (String) session.getAttribute("RANDOM_IN_SESSION");
		String inputvalue = request.getParameter("yzm");
		User user1 = (User) session.getAttribute("loginuser");
		if (rand.equalsIgnoreCase(inputvalue)) {
			if (request.getParameter("sex") != null) {
				int sex = Integer.parseInt(request.getParameter("sex"));
				user1.setSex(sex);
			}
			user1.setIdentifys(-3);
			String qq = request.getParameter("qq");
			user1.setQq(qq);
			String realname = new String(request.getParameter("realname")
					.getBytes("ISO-8859-1"), "UTF-8");
			user1.setRealname(realname);
			String certsnum = request.getParameter("certsnum");
			user1.setCertsnum(certsnum);
			if (!request.getParameter("year").equals("")
					&& !request.getParameter("month").equals("")
					&& !request.getParameter("day").equals("")) {
				System.out.println(request.getParameter("year")+"*******");
				int year = Integer.parseInt(request.getParameter("year")) + 1909;
				int month = Integer.parseInt(request.getParameter("month"));
				int day = Integer.parseInt(request.getParameter("day"));
				user1.setBirthday(year + "年" + month + "月" + day + "日");
			}
			int age = Integer.parseInt(request.getParameter("age"));
			user1.setAge(age);
			if (!request.getParameter("province").equals("") && !request.getParameter("city").equals("") && !request.getParameter("county").equals("")) {
			String province = new String(request.getParameter("province")
					.getBytes("ISO-8859-1"), "UTF-8");
			String city = new String(request.getParameter("city").getBytes(
					"ISO-8859-1"), "UTF-8");
			String county = new String(request.getParameter("county").getBytes(
					"ISO-8859-1"), "UTF-8");
			
				user1.setAddress(province + "省" + city + "市" + county);
			}
			String telephone = request.getParameter("telephone");
			user1.setTelephone(telephone);
			String other = new String(request.getParameter("other").getBytes(
					"ISO-8859-1"), "UTF-8");
			String[] hobby = request.getParameterValues("1");
			StringBuffer hobbys = new StringBuffer();
			if (hobby != null) {
				for (int i = 0; i < hobby.length; i++) {
					hobbys.append(hobby[i] + ",");
				}
			}
			if (other != null) {
				hobbys.append(other);
			}
			String hobbies = hobbys.toString();
			user1.setLimits(1);
			if (hobbies != null) {
				user1.setHobby(hobbies);
			}
			userService.update(user1);
			userService.addScore(user1.getUsername(), 20);
			request.setAttribute("message", "恭喜你，更新成功");
			return "page/message";
		}
		request.setAttribute("infoMessage", "验证码错误");
		return "include/j_usermsg";
	}

	@RequestMapping("getUserMember")
	public String getUserMember(HttpServletRequest request) {
		try {
			List<Member> list = userService.getUserMember();
			request.setAttribute("userMemberlist", list);
			return "test";// listAll页面
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage",
					"信息载入失败！具体异常信息：" + e.getMessage());
			return "/";
		}
	}

	@RequestMapping("getOneUser")
	public User getOneUser(String username) {
		try {
			User user = userService.getOneUser(username);
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping("logincheck")
	public void logincheck(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		String username = new String(request.getParameter("username").getBytes(
				"ISO-8859-1"), "UTF-8");
		String password = new String(request.getParameter("password").getBytes(
				"ISO-8859-1"), "UTF-8");
		System.out.println();
		User user1 = userService.getOneUser(username);
		UserLevel userLevel = new UserLevel();
		try {
			if (user1 == null) {

				response.getWriter().write("usernotexist");
				response.getWriter().close();

			} else {
				String pass = user1.getPassword();
				// System.out.println(pass);

				if (pass.equals(password)) {

					TaskPage taskpage = userMsgService.countMsg(user1.getId(),
							0, 0);
					List<UserMsg> userMsgNotReadList = userMsgService
							.findMsgNotRead(user1.getId(), 0, taskpage);
					session.setAttribute("userMsgNotReadList",
							userMsgNotReadList);

					session.setAttribute("pageno1", 0);

					TaskPage taskpage1 = userMsgService.countMsg(user1.getId(),
							1, 0);
					// session.setAttribute("pageno2",0);
					List<UserMsg> userMsgReadList = userMsgService
							.findMsgNotRead(user1.getId(), 1, taskpage1);
					session.setAttribute("userMsgReadList", userMsgReadList);
					// System.out.println(userMsgNotReadList.get(0).getMsgcontent()+"************");

					// session.setAttribute("page", taskpage1);

					// System.out.println(userMsgNotReadList.get(0).getMsgcontent());
					session.setAttribute("pageno2", 0);

					int a = userMsgService.countNotRead(user1.getId());
					session.setAttribute("notRead", a);
					String levelmsg = userService.update(user1);
					session.setAttribute("levelmsg", levelmsg);// 设置等级信息
					userLevel = userLevelService.findById(user1
							.getUserlevelId());
					session.setAttribute("userLevel", userLevel);// 返回等级
					session.setAttribute("loginuser", user1);// 返回用户
					response.getWriter().write("ok");
					response.getWriter().close();
				} else {
					response.getWriter().write("passworderror");
					response.getWriter().close();

				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping("getsameUser")
	public void getsameUser(@RequestParam(value = "username") String username,
			HttpServletResponse response) {
		try {
			User user = userService.getOneUser(username);

			if (user != null) {
				response.getWriter().write("exist");
			} else {
				response.getWriter().write("notexist");
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	/*
	 * 销毁用户
	 */
	@RequestMapping("destroyUser")
	public String destroyUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		 session.removeAttribute("loginuser");
		return "index";
	}

	/*
	 * 查询用户等级
	 */
	public void selectUserLevel() {

	}

	/*
	 * 查找登录用户邮箱的信息 根据userid
	 */
	@RequestMapping("selectUserMsg")
	public String selectUserMsg(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginuser");
		int id = user.getId();
		List<UserMsg> userMsgList = userMsgService.getAllById(id);
		session.setAttribute("userMsgList", userMsgList);
		return "/"; // 显示邮箱信息的页面
	}

	/*
	 * 设置消息是是是否读取
	 */
	@RequestMapping("isRead")
	public String isRead(@RequestParam(value = "id") int id,
			@RequestParam(value = ("flag")) int flag,
			@RequestParam(value = ("pageno1")) int pageNo1,
			@RequestParam(value = ("pageno2")) int pageNo2,
			HttpServletRequest request) {
		userMsgService.updateById(id);
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginuser");
		if (flag >= 0) {
			TaskPage taskpage = userMsgService.countMsg(user.getId(), 0,
					pageNo1);
			List<UserMsg> userMsgNotReadList = userMsgService.findMsgNotRead(
					user.getId(), 0, taskpage);
			session.setAttribute("userMsgNotReadList", userMsgNotReadList);
		}
		session.setAttribute("pageno1", pageNo1);
		if (flag <= 0) {
			TaskPage taskpage1 = userMsgService.countMsg(user.getId(), 1,
					pageNo2);
			session.setAttribute("pageno2", pageNo2);
			List<UserMsg> userMsgReadList = userMsgService.findMsgNotRead(
					user.getId(), 1, taskpage1);
			session.setAttribute("userMsgReadList", userMsgReadList);
			// System.out.println(userMsgNotReadList.get(0).getMsgcontent()+"************");

			// session.setAttribute("page", taskpage1);
		}
		// System.out.println(userMsgNotReadList.get(0).getMsgcontent());
		session.setAttribute("pageno2", pageNo2);
		int a = userMsgService.countNotRead(user.getId());
		session.setAttribute("notRead", a);
		return "include/j_usermsg";
	}

	@RequestMapping("foundPass")
	public String foundPass(HttpServletRequest request) throws Exception {
		HttpSession session1 = request.getSession();
		String rand = (String) session1.getAttribute("RANDOM_IN_SESSION");
		String inputvalue = request.getParameter("yzm");
		System.out.println("**" + rand + "**" + inputvalue);
		String pass = null;
		String email = request.getParameter("email");
		User user = userService.getUserByEmail(email);
		if (rand.equalsIgnoreCase(inputvalue)) {
			if (user != null) {
				pass = user.getPassword();
				System.out.println(pass + "*****");
				Properties prop = new Properties();
				prop.setProperty("mail.host", "smtp.qq.com");
				prop.setProperty("mail.transport.protocol", "smtp");
				prop.setProperty("mail.smtp.auth", "true");
				// 使用JavaMail发送邮件的5个步骤
				// 1、创建session
				Session session = Session.getInstance(prop);
				// 开启Session的debug模式，这样就可以查看到程序发送Email的运行状态
				session.setDebug(true);
				// 2、通过session得到transport对象
				Transport ts = session.getTransport();
				// 3、使用邮箱的用户名和密码连上邮件服务器，发送邮件时，发件人需要提交邮箱的用户名和密码给smtp服务器，用户名和密码都通过验证之后才能够正常发送邮件给收件人。
				ts.connect("smtp.qq.com", "826655812@qq.com",
						"9307221993520wzf");
				// 4、创建邮件
				Message message = createSimpleMail(session, email, pass);
				// 5、发送邮件
				ts.sendMessage(message, message.getAllRecipients());
				ts.close();
			} else {
				request.setAttribute("yx", "邮箱不存在");
				return "include/j_fogotpasw";
			}
		} else {
			request.setAttribute("yzmcw", "验证码错误");
			return "include/j_fogotpasw";
		}
		request.setAttribute("message", "密码已发送你的邮箱，请注意查收");
		return "page/message";
	}

	@RequestMapping("modifyUserPass")
	public String modifyUser(HttpServletRequest request,
			@RequestParam(value = "oldpass") String oldpass,
			@RequestParam(value = "newpass") String newpass) {
		User user = (User) request.getSession().getAttribute("loginuser");
		String pass = user.getPassword();
		if (oldpass.equals(pass)) {
			user.setPassword(newpass);
			userService.updateByPrimaryKey(user);
		} else {
			request.getSession().setAttribute("passerror","密码错误");
			return "page/modify";
		}
		request.getSession().setAttribute("message", "密码修改成功");
		return "page/message";
	}

	public static MimeMessage createSimpleMail(Session session, String email,
			String pass) throws Exception {
		System.out.println(pass);
		// 创建邮件对象
		MimeMessage message = new MimeMessage(session);
		// 指明邮件的发件人
		message.setFrom(new InternetAddress("826655812@qq.com"));
		// 指明邮件的收件人，现在发件人和收件人是一样的，那就是自己给自己发
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(
				email));
		// 邮件的标题
		message.setSubject("JplusOnline官方信息");
		// 邮件的文本内容
		message.setContent("你的密码为：" + pass + "<br/>"
				+ "<a href='www.jplus.online'>点这里返回JplusOnline</a>"
				+ "如果点击无效，请把地址复制到浏览器访问", "text/html;charset=UTF-8");
		// 返回创建好的邮件对象
		return message;
	}

	@RequestMapping("uploadfiles")
	public String upload(
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, Member member) throws ServletException,
			IOException {
		User user = (User) request.getSession().getAttribute("loginuser");
		Identify identify = identifyService.findByName(user.getUsername());
		// System.out.println(identify);
		if (identify != null
				&& identify.getCertnum().equals(user.getCertsnum())) {
			member.setIdentifyId(identify.getId());// identifyId和userid一样
			member.setUserId(user.getId());
			Calendar c = Calendar.getInstance();
			c.setTimeInMillis(new Date().getTime());
			SimpleDateFormat dateFormat = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			member.setIndentifytime(c.getTime());
			// System.out.println("开始");
			String path = request.getSession().getServletContext()
					.getRealPath("files");
			// String fileName = file.getOriginalFilename();

			String fileName = new Date().getTime() + ".jpg";
			System.out.println(path);
			String fp = "files/" + fileName;
			member.setPurl(fp);
			File targetFile = new File(path, fileName);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}

			// 保存
			try {
				file.transferTo(targetFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// model.addAttribute("fileUrl",
			// request.getContextPath()+"/upload/"+fileName);
			user.setIdentifys(identify.getSessions());
			user.setLimits(2);
			userService.update(user);
			memberService.add(member);
			request.setAttribute("message", "认证成功");
			return "page/message";
		}
		request.setAttribute("message", "对不起，认证失败，请确认你具有认证资格，并且已经完善当前用户信息。");
		return "page/message";
	}

}
