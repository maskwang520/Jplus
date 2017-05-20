package com.jplus.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jplus.model.Res;
import com.jplus.model.ResClass;
import com.jplus.service.ResService;

@Controller
@RequestMapping("ziyuan")
public class Res1MapperController {
	private ResService resservice;

	public ResService getResservice() {
		return resservice;
	}

	@Autowired
	public void setResservice(ResService resservice) {
		this.resservice = resservice;
	}

	// System.out.println(pageInfo.getLastPage());
	// System.out.println(pageInfo.getNextPage());//获取下一页
	// System.out.println(pageInfo.getTotal());所有的条数
	// System.out.println(pageInfo.getPageNum());//获取当前的页
	// System.out.println(pageInfo.getPages());//总页数

	@RequestMapping("findres")
	public String findres(HttpServletRequest request,
			@RequestParam(value = "page", required = false) String pageString,
			@RequestParam(value = "souinfo", required = false) String souinfo,
			@RequestParam(value = "rid", required = false) String resClassId)
			throws Exception {
		int page;
		if (pageString == null) {
			page = 1;
		} else {
			page = Integer.valueOf(pageString);
		}
		if (souinfo == null || "".equals(souinfo.trim())) {
			System.out.println(resClassId);
			// 按视频分类查询
			if (resClassId != null&&!("".equals(resClassId.trim()))) {
					PageHelper.startPage(page, 8);
					List<Res> rss = resservice.selectAllByrid(Integer
							.valueOf(resClassId));
					PageInfo pageInfo = new PageInfo(rss);
					request.setAttribute("rss", rss);
					request.setAttribute("pageInfo", pageInfo);
					request.setAttribute("rid", resClassId);
			} else {
				// 查询所有
				PageHelper.startPage(page, 8);
				List<Res> rss = resservice.selectAll();
				PageInfo pageInfo = new PageInfo(rss);
				request.setAttribute("rss", rss);
				request.setAttribute("pageInfo", pageInfo);
			}
		} else {
			// 搜索查询
			souinfo = new String(souinfo.getBytes("ISO-8859-1"), "utf-8");
			PageHelper.startPage(page, 8);
			List<Res> rss = resservice.findResBysouinfo('%' + souinfo + '%');
			request.setAttribute("rss", rss);
			PageInfo pageInfo = new PageInfo(rss);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("souinfo", souinfo);
		}
		// 快捷资源导航
		List<ResClass> rcs = resservice.selectAllResClass();
		request.setAttribute("rcs", rcs);
		return "page/res/res";
	}
}
