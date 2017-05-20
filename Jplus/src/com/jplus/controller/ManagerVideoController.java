package com.jplus.controller;

/**
 * 課程控制器
 * 1.根据查询条件改变课程列表
 * 		upCourse(videoid)
 * 		@Param  sectionname
 * 				voideoid
 * 				keyword
 * 	2.playvideos(courseid)
 * 		进入课程列表
 * 		@param  videosid
 *    播放视频
 * 	  
 *  3.更新播放视频
 */
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jplus.model.Course;
import com.jplus.model.Section;
import com.jplus.model.Videos;
import com.jplus.service.CourseService;
import com.jplus.service.SectionService;
import com.jplus.service.VideosService;
import com.jplus.util.Page;

@Controller

public class ManagerVideoController {
	private SectionService sectionService;
	private CourseService courseService;
	private VideosService videosService;
	private List<Course> courList = new ArrayList();
	private List<Videos> videosList = new ArrayList();
	private List<Section> secList = new ArrayList();

	public SectionService getSectionService() {
		return sectionService;
	}

	public VideosService getVideosService() {
		return videosService;
	}

	@Autowired
	public void setVideosService(VideosService videosService) {
		this.videosService = videosService;
	}

	@Autowired
	public void setSectionService(SectionService sectionService) {
		this.sectionService = sectionService;
	}

	public CourseService getCourseService() {
		return courseService;
	}

	@Autowired
	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}

	/**
	 * 初始化视频列表
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/InitList", method = RequestMethod.GET)
	public String selectAllList(ModelMap model, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		try {
			String pageNow = request.getParameter("pageNow");
			Page page = null;

			int totalCount = (int) courseService.getAllCourseCount();
			if (pageNow != null) {
				page = new Page(totalCount, Integer.parseInt(pageNow));
			} else {
				page = new Page(totalCount, 1);
				courList = courseService.selectCourseByPage(page);
			}
			secList = sectionService.selectAllSection();
			List<String> keywordList = sectionService.selectKeyWordInSec();
			session.setAttribute("page", page);
			session.setAttribute("courList", courList);
			session.setAttribute("secList", secList);
			session.setAttribute("keywordList", keywordList);
			return "/page/course/viewList";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage",
					"信息载入失败！具体异常信息：" + e.getMessage());
			return "page/course/result";
		}
	}

	/**
	 * 根据板块 显示 视频信息 2015-8-1 9:00
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/upCourse", method = RequestMethod.GET)
	public String updateCourseList(ModelMap model, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		try {
			session.removeAttribute("page");
			session.removeAttribute("courList");
			String pageNow = request.getParameter("pageNow");
			String videoid = request.getParameter("videoid");
			String paramPage = videoid;
			Page page = new Page();
			int totalCount = (int) courseService.getCountByCourseId(videoid);
			if (pageNow != null) {
				page = new Page(totalCount, Integer.parseInt(pageNow));
			} else {
				page = new Page(totalCount, 1);
			}
			courList = courseService.selectCourseByCourseid(videoid,
					page.getStartPos(), page.getPageSize());
			request.setAttribute("paramPage", paramPage);
			session.setAttribute("page", page);
			session.setAttribute("courList", courList);
			return "/page/course/viewList";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage",
					"信息载入失败！具体异常信息：" + e.getMessage());
			return "result";
		}
	}
	@RequestMapping(value = "/upCourseByKey", method = RequestMethod.GET)
	public String upCourseByKey(ModelMap model, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		try {
			String pageNow = request.getParameter("pageNow");
			String keyword = request.getParameter("keyword");
			String videoid = (String) session.getAttribute("videoid");
			String paramPage = videoid;
			System.out.println(keyword);
			Page page = new Page();
			int totalCount = (int) courseService.getCountByCourseId(videoid);
			if (pageNow != null) {
				page = new Page(totalCount, Integer.parseInt(pageNow));
			} else {
				page = new Page(totalCount, 1);
			}
			courList = courseService.selectCourseByKey(keyword,
					page.getStartPos(), page.getPageSize());
			request.setAttribute("paramPage", paramPage);
			session.setAttribute("page", page);
			session.setAttribute("courList", courList);
			return "/page/course/viewList";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage",
					"信息载入失败！具体异常信息：" + e.getMessage());
			return "page/course/result";
		}
	}

	/**
	 * 换页 2015-8-1 9:00
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */

	@RequestMapping(value = "/updataPage", method = RequestMethod.GET)
	public String updataPage(ModelMap model, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		String paramPage = request.getParameter("paramPage");
		String pageNow = request.getParameter("pageNow");
		Page page = new Page();
		if (paramPage.equals("") || paramPage == "") {
			int totalCount = (int) courseService.getAllCourseCount();
			if (pageNow != null) {
				page = new Page(totalCount, Integer.parseInt(pageNow));
			} else {
				page = new Page(totalCount, 1);
			}
			courList = courseService.selectCourseByPage(page);
			session.setAttribute("page", page);
			session.setAttribute("courList", courList);
			session.setAttribute("paramPage", paramPage);
			return "page/course/viewList";
		} else {
			int totalCount = (int) courseService.getCountByCourseId(paramPage);
			if (pageNow != null) {
				page = new Page(totalCount, Integer.parseInt(pageNow));
			} else {
				page = new Page(totalCount, 1);
			}
			courList = courseService.selectCourseByCourseid(paramPage,
					page.getStartPos(), page.getPageSize());
			session.setAttribute("page", page);
			session.setAttribute("courList", courList);
			session.setAttribute("paramPage", paramPage);
			return "page/course/viewList";
		}

	}

	/**
	 * 显示 视频列表
	 * 
	 * @author SiZhenTao 2015-8-1 9:00
	 * @param courseid
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/showVideos")
	public String showVideos(ModelMap model, HttpServletRequest request,
			HttpSession session) {
		try {
			Course cou = new Course();
			String courseid = request.getParameter("courseid");
			videosList = videosService.selectAllVideos(courseid);
			cou = courseService.getCourseByCid(courseid);
			courseService.updateClick(courseid);
			Videos vs = videosList.get(0);
			String sourse = cou.getVideoid();
			String fileo = vs.getCourseid();
			String filet = vs.getVideosid();
			session.setAttribute("sourse", sourse);
			session.setAttribute("fileo", fileo);
			session.setAttribute("filet", filet);
			session.setAttribute("courseid", courseid);
			session.setAttribute("videosList", videosList);
			return "/page/course/videosList";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage",
					"信息载入失败！具体异常信息：" + e.getMessage());
			return "page/course/result";
		}
	}

	/**
	 * 更新视频
	 * 
	 * @param model
	 * @param request
	 * @param session
	 * @return SiZhenTao 2015-8-1 11:20
	 */
	@RequestMapping("/updateVideos")
	public String updateVideos(ModelMap model, HttpServletRequest request,
			HttpSession session) {
		try {

			String sourse = request.getParameter("sourse");
			String fileo = request.getParameter("fileo");
			String filet = request.getParameter("filet");
			session.setAttribute("sourse", sourse);
			session.setAttribute("fileo", fileo);
			session.setAttribute("filet", filet);
			return "/page/course/videosList";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage",
					"信息载入失败！具体异常信息：" + e.getMessage());
			return "page/course/result";
		}
	}


	@RequestMapping(value = "addVideo")
	public String upload(ModelMap model, HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		Course course = new Course();
		Videos videos = new Videos();
		Date now = new Date();
		String courseid = request.getParameter("sec_courseid");
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String info = request.getParameter("info");
		String keyword = request.getParameter("keyword");
		String videoid = request.getParameter("cour_videoid");
		course.setPicture(courseid + "/" + videoid + ".jpg");
		course.setTitle(title);
		course.setAuthor(author);
		course.setAtime(now);
		course.setInfo(info);
		course.setVideoid(courseid);
		course.setCourseid(videoid);
		course.setClicknum(0);
		course.setKeyword(keyword);
		courseService.insertSelective(course);
		String description;
		String rootPath = this.getClass().getClassLoader()
				.getResource("../../").getPath();
		rootPath = rootPath.toString() + "/res/course/" + courseid + "/" + videoid;
		System.out.println(rootPath+"324");
		try {
			File file1 = new File(rootPath);
			File[] tempList = file1.listFiles();
			String vtitle = null;
			String pfile = this.getClass().getClassLoader().getResource("/")
					.getPath()
					+ "info.properties";
			for (int i = 0; i < tempList.length; i++) {
				vtitle = tempList[i].getName();
				if(vtitle.contains("mp4")){
				videos.setCourseid(videoid);
				videos.setVideosid(vtitle);
				videos.setTitle(vtitle.replaceAll(".mp4", ""));
				File file = new File(rootPath+"/"+vtitle.replace(".mp4", ".txt"));
				System.out.println(rootPath+"/"+vtitle.replace(".mp4", ".txt"));
				String encoding ="UTF-8";
				if (file.isFile() && file.exists()) { // 判断文件是否存在
							InputStreamReader read = new InputStreamReader(
									new FileInputStream(file), encoding);// 考虑到编码格式
							BufferedReader bufferedReader = new BufferedReader(read);
							description = bufferedReader.readLine();
							System.out.println(description);
							videos.setDescription(description);
				}
				videosService.insert(videos);
				}
			}
			String message = "成功";
			request.setAttribute("message", message);
			return "/page/course/addVideo";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			String message = "出错";
			request.setAttribute("message", message);
			return "page/course/result";
		}
	}

}
