<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/css/css_video/videos.css" />
	
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
<body>

	<c:import url="/include/j_top.jsp" />
	<div id="wrapper">
		<div id="header" class="w-1000">
			<h3>${courseid}</h3>
		</div>
		<div id="loading">
			<div class="loading-length" style="width: 1349px;"></div>
		</div>


		<div id="palyer-box" class="cf">


			<div
				style=" position:relative;top:0px;width:100%;height:540px; kground-color: gray;">

				<div class="videobox ">

					<div id="play_" class="" style="width: 100%; height: 100%;">
						<video controls="controls" autoplay="autoplay" width="100%"
							height="100%">
							<source
								src="${pageContext.request.contextPath}/res/course/${sourse}/${fileo}/${filet}"
								type="video/mp4" type="video/mp4">
						</video>
						<div></div>

					</div>
				</div>


			</div>
			<div class="lesson-table cf">
	

				<div class="lesson-teacher">
					<div class="bc-box">
						<h2>
							<a href="${pageContext.request.contextPath}/index.jsp">Jplus实验室简介</a>
						</h2>
						<div class="infor-content">

							<b>宗旨</b> <br>
							紧跟现代科技发展,适应时代技术潮流,满足我国软件行业的市场需求,培养具有丰富理论知识和超强实践能力的复合型技术人才.
							<br> <br> <b>核心：</b> 
							<br> 1.Web开发的定义<br>
							2.Web开发该如何学习<br> 
							3.Web开发的生命周期，Web开发的原则 <br> 
							<br> <b>Web开发环境：
							</b>Windows & Linux <br> <br>
							<b>是否提供资料：</b>是 <br> <br> <b>课程等级：</b>初级
							<br> <br> <b>适合人群：</b> <br> 欲从事Web开发的人，Web开发在职人员


						</div>
						<div class="btn-box">


							<a href="${pageContext.request.contextPath}/InitList.do"
								class="greenbtn sc_btn diaLoginBtn"
								>查看更多</a>

							<a class="orinagebtn diaLoginBtn" title="下载课程对应的源代码、素材等资料"
								href="javascript:void('0');"
								jktag="&amp;posArea=0003&amp;posOper=8015&amp;posColumn=1.2">资料下载</a>


						</div>
					</div>

				</div>



				<div class="video-list">
					<div class="lessonlist-nav cf">
						<ul class="cf time-hot">
							<li class="nav_on">课时列表</li>
						</ul>
					</div>
					<div class="lesson-box" style="display: block;">

						<ul>
							<c:forEach items="${videosList}" var="videos">
								<li class="on"><i class="lessonmbers"><em></em></i>
									<div class="text-box">
										<h2>
											<a
												href="updateVideos.do?sourse=${sourse}&&fileo=${fileo}&&filet=${videos.videosid}">${videos.title}</a>
										</h2>
										<p>${videos.description}</p>
									</div> </i>
							</c:forEach>
						</ul>

					</div>


				</div>
			</div>

			<style>
ul.pages li {
	width: 30px !important;
	height: 30px !important;
	padding: 0px !important;
	clear: inherit !important;
	float: left;
	border: 1px solid #e4e4e4 !important;
}

ul.pages li.pgNext {
	width: 40px !important;
}

ul.pages li.pagenow {
	width: 100px !important;
}

ul.pages li.pgEmpty {
	border: 1px solid #f0f0f0;
	color: #d9d6c3;
	background-color: #f0f0f0;
	width: 50px !important;
}

ul.pages li.thpoint {
	margin-top: 0px !important;
	border: none !important;
}

ul.pages li.go {
	margin-top: 0px !important;
	line-height: 30px !important;
}

ul.pages li.pagetotal {
	width: 70px !important;
}
</style>
			<!--lesson-box end-->
			<!--lesson-box-->

			<!--lesson-box end-->
		</div>


	</div>
	<!--弹出2end-->
	</div>


	<!--全站通用底部-->
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