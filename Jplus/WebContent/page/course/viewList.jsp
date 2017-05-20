<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>实战开发课程</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/css/css_video/viewList.css"/>
 <!-- BEGIN GLOBAL MANDATORY STYLES -->          
   <link href="${pageContext.request.contextPath}/style/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
   <link href="${pageContext.request.contextPath}/style/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
   <!-- END GLOBAL MANDATORY STYLES -->
   
   <!-- BEGIN PAGE LEVEL PLUGIN STYLES --> 
   <link href="${pageContext.request.contextPath}/style/assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet" />              
   <link rel="stylesheet" href="${pageContext.request.contextPath}/style/assets/plugins/revolution_slider/css/rs-style.css" media="screen">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/style/assets/plugins/revolution_slider/rs-plugin/css/settings.css" media="screen"> 
   <link href="${pageContext.request.contextPath}/style/assets/plugins/bxslider/jquery.bxslider.css" rel="stylesheet" />                
   <!-- END PAGE LEVEL PLUGIN STYLES -->

   <!-- BEGIN THEME STYLES --> 
   <link href="${pageContext.request.contextPath}/style/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
   <link href="${pageContext.request.contextPath}/style/assets/css/style.css" rel="stylesheet" type="text/css"/>
   <link href="${pageContext.request.contextPath}/style/assets/css/themes/blue.css" rel="stylesheet" type="text/css" id="style_color"/>
   <link href="${pageContext.request.contextPath}/style/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
   <link href="${pageContext.request.contextPath}/style/assets/css/custom.css" rel="stylesheet" type="text/css"/>
   <!-- END THEME STYLES -->
</head>


<body style="background-color: white;">

	<c:import url="/include/j_top.jsp" />

	<div class="container" style="background-color: white;">
		<div class="course-content">
			<div class="course-nav-box">
				<div class="course-nav-hd">
					<span>全部课程</span>
				</div>
				<div class="course-nav-row clearfix">

					<div class="bd">
						<ul class="">
							<li class="course-nav-item on"><a href="InitList.do">全部</a>
							</li>
							<c:forEach var="sList" varStatus="status"
								items="${sessionScope.secList}">
								<li class="course-nav-item"><a
									href="upCourse.do?videoid=${sList.courseid}" data-ct="fe">${sList.name}</a>
								</li>

							</c:forEach>

						</ul>
					</div>
				</div>
				<div class="course-nav-row clearfix">
					<span class="hd l">分类：</span>
					<div class="bd">
						<ul class="">
							<li class="course-nav-item on"><a href="InitList.do">全部</a>
							</li>
							<c:forEach var="key" items="${sessionScope.keywordList}">
								<li class="course-nav-item "><a
									href="upCourseByKey.do?keyword=${key.keyword}" data-id=44
									data-ct=fe>${key.keyword}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>


				<div class="course-list" style="background-color: white;">
					<div class="js-course-lists">
						<ul>
							<c:forEach var="course" items="${sessionScope.courList}">
								<li class="course-one"><a
									href="showVideos.do?courseid=${course.courseid}">
										<div class="course-list-img">
											<img width="240px" height="135px"
												src="${pageContext.request.contextPath}/res/course/${course.picture}">
										</div>

										<h5>
											<span>${course.title}</span>
										</h5>
										<div class="tips">
											<p class="text-ellipsis"></p>
											<span class="l update-latest">${course.info}</span>
										</div>
										<div class="tips">
											<span>共有${course.clicknum}人学习</span>
										</div>
								</a></li>
							</c:forEach>

						</ul>
					</div>
				</div>
			</div>
		</div>

	</div>


	<div class="tcdPageCode" style="background-color: white;">
		<center>
			<font size="2">共 ${page.totalPageCount}页</font> <font size="2">第
				${page.pageNow}页</font> <a
				href="updataPage.do?paramPage=${paramPage}&&pageNow=1">首页</a>
			<c:choose>
				<c:when test="${page.pageNow - 1 > 0}">
					<a
						href="updataPage.do?paramPage=${paramPage}&&pageNow=${page.pageNow - 1}">上一页</a>
				</c:when>
				<c:when test="${page.pageNow - 1 <= 0}">
					<a href="updataPage.do?paramPage=${paramPage}&&pageNow=1">上一页</a>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${page.pageNow + 1 < page.totalPageCount}">
					<a
						href="updataPage.do?paramPage=${paramPage}&&pageNow=${page.pageNow + 1}">下一页</a>
				</c:when>
				<c:when test="${page.pageNow + 1 >= page.totalPageCount}">
					<a
						href="updataPage.do?paramPage=${paramPage}&&pageNow=${page.totalPageCount}">下一页</a>
				</c:when>
			</c:choose>
			<a
				href="updataPage.do?paramPage=${requestScope.paramPage}&&pageNow=${page.totalPageCount}">尾页</a>

		</center>
	</div>

	<c:import url="/include/j_bottom.jsp" />


    <!-- Load javascripts at bottom, this will reduce page load time -->
    <!-- BEGIN CORE PLUGINS(REQUIRED FOR ALL PAGES) -->
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/style/assets/plugins/respond.min.js"></script>  
    <![endif]-->  
    <script src="${pageContext.request.contextPath}/style/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/style/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/style/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>      
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/assets/plugins/hover-dropdown.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/assets/plugins/back-to-top.js"></script>    
    <!-- END CORE PLUGINS -->

    <!-- BEGIN PAGE LEVEL JAVASCRIPTS(REQUIRED ONLY FOR CURRENT PAGE) -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/assets/plugins/fancybox/source/jquery.fancybox.pack.js"></script>  
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/assets/plugins/revolution_slider/rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/assets/plugins/revolution_slider/rs-plugin/js/jquery.themepunch.revolution.min.js"></script> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/assets/plugins/bxslider/jquery.bxslider.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/assets/scripts/app.js"></script>
    <script src="${pageContext.request.contextPath}/style/assets/scripts/index.js"></script>    
    <script type="text/javascript">
        jQuery(document).ready(function() {
            App.init();    
            App.initBxSlider();
            Index.initRevolutionSlider();                    
        });
    </script>
    <!-- END PAGE LEVEL JAVASCRIPTS -->


</body>
</html>
