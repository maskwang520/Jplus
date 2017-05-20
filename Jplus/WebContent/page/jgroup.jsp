<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>Jplus在线 | 团队简介 - 开发团队信息</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />

<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link
	href="${pageContext.request.contextPath}/style/assets/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/style/assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->

<!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
<link
	href="${pageContext.request.contextPath}/style/assets/plugins/fancybox/source/jquery.fancybox.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/style/assets/plugins/revolution_slider/css/rs-style.css"
	media="screen">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/style/assets/plugins/revolution_slider/rs-plugin/css/settings.css"
	media="screen">
<link
	href="${pageContext.request.contextPath}/style/assets/plugins/bxslider/jquery.bxslider.css"
	rel="stylesheet" />
<!-- END PAGE LEVEL PLUGIN STYLES -->

<!-- BEGIN THEME STYLES -->
<link
	href="${pageContext.request.contextPath}/style/assets/css/style-metronic.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/style/assets/css/style.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/style/assets/css/themes/blue.css"
	rel="stylesheet" type="text/css" id="style_color" />
<link
	href="${pageContext.request.contextPath}/style/assets/css/style-responsive.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/style/assets/css/custom.css"
	rel="stylesheet" type="text/css" />
<!-- END THEME STYLES -->


<link rel="shortcut icon" href="favicon.ico" />
</head>
<!-- END HEAD -->

<!-- BEGIN BODY -->
<body class="page-header-fixed">

	<!--在这里引入头部文件-->
	<c:import url="/include/j_top.jsp" />

	<div class="page-container">
		<div class="row breadcrumbs margin-bottom-40">
			<div class="container">
				<div class="col-md-4 col-sm-4">
					<h1>团队简介 - 开发团队</h1>
				</div>
				<div class="col-md-8 col-sm-8">
					<ul class="pull-right breadcrumb">
						<li><a href="index.html">Jplus在线</a></li>
						<li><a href="">Web页</a></li>
						<li class="active">团队简介 - 开发团队</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="container min-hight">
			<div class="row">
				<div class="col-md-9 blog-item margin-bottom-40">
					<div class="blog-item-img">
						<div class="front-carousel">
							<div id="myCarousel" class="carousel slide">
								<c:import url="/page/map.jsp" /> 
							</div>
						</div>

					</div>


					<h2>
						<a href="">实验室简介</a>
					</h2>
					<!--  <p>大致简介.</p>-->
					<blockquote>
						<p>
							<strong><font face="楷体">${jplusDesclist[0].jdTitle}</font></strong>
						</p>
						<textarea id="textarea" onpropertychange="MaxMe(this)"
							oninput="MaxMe(this)"
							style="overflow: hidden; width: 100%; height: 500px; border: 0; cursor: pointer; font-family: 华文行楷; font-size: 20px; font-weight: blod;"
							readonly="readonly">${jplusDesclist[0].jdContent}</textarea>
						<script type="text/javascript">
							function MaxMe(o) {
								if (window.navigator.userAgent
										.indexOf("Firefox") > -1) {
									o.style.height = o.scrollTop
											+ o.scrollHeight + "px";
								} else {
									if (o.scrollTop > 0)
										o.style.height = o.scrollTop
												+ o.scrollHeight + "px";
								}
							}

							function Init() {
								var textarea = document
										.getElementById("textarea");
								if (textarea.addEventListener) { // 非Internet Explorer和Internet Explorer9之后的版本
									textarea.addEventListener("input",
											OnTextInput, false);
									// Google Chrome 和 Safari
									textarea.addEventListener("textinput",
											OnTextInput, false);
								}

								if (textarea.attachEvent) { // Internet Explorer 和 Opera
									textarea.attachEvent("onpropertychange",
											OnTextInput);
								}
							}

							function OnTextInput(evt) {
								o = window.event ? window.event.srcElement
										: evt.target;
								if (window.navigator.userAgent
										.indexOf("Firefox") > -1) {
									o.style.height = o.scrollTop
											+ o.scrollHeight + "px";
								} else {
									if (o.scrollTop > 0)
										o.style.height = o.scrollTop
												+ o.scrollHeight + "px";
								}
							}
							window.onload = Init;
						</script>
					</blockquote>
					<!--  <p>简介.</p>
					<p>作品.</p>
					<ul class="blog-info">
						<li><i class="fa fa-user"></i> 作者</li>
						<li><i class="fa fa-calendar"></i> 更新时间</li>
						<li><i class="fa fa-comments"></i> 本页浏览量</li>
					</ul>-->
					<div class="media"></div>

					<!-- 多说评论框 start -->
					<div class="ds-thread" data-thread-key="index_jplus"
						data-title="index" data-url="http://www.jplus.online/index.jsp"></div>
					<!-- 多说评论框 end -->
					<!-- 多说公共JS代码 start (一个网页只需插入一次) -->
					<script type="text/javascript">
						var duoshuoQuery = {
							short_name : "jplus"
						};
						(function() {
							var ds = document.createElement('script');
							ds.type = 'text/javascript';
							ds.async = true;
							ds.src = (document.location.protocol == 'https:' ? 'https:'
									: 'http:')
									+ '//static.duoshuo.com/embed.js';
							ds.charset = 'UTF-8';
							(document.getElementsByTagName('head')[0] || document
									.getElementsByTagName('body')[0])
									.appendChild(ds);
						})();
					</script>
					<!-- 多说公共JS代码 end -->
				</div>

				<!-- END LEFT SIDEBAR -->

				<!-- BEGIN RIGHT SIDEBAR -->
				<div class="col-md-3 blog-sidebar">
					<!-- CATEGORIES START -->
					<h2 class="btn btn-success"> <a href="${pageContext.request.contextPath }/getMemberAll.do?sessionid=4">Jplus实验室</a></h2>
					<ul class="nav sidebar-categories margin-bottom-40">
						<li><a href="${pageContext.request.contextPath}/getMemberAllMessage.do?sessionid=1">第一届开发团队</a></li>
						<li><a href="${pageContext.request.contextPath}/getMemberAllMessage.do?sessionid=2">第二届开发团队</a></li>
						<li><a href="${pageContext.request.contextPath}/getMemberAllMessage.do?sessionid=3">第三届开发团队</a></li>
						<li><a
							href="${pageContext.request.contextPath}/getMemberAllMessage.do?sessionid=4">第四届开发团队</a></li>
						<li><a href="${pageContext.request.contextPath}/getMemberAllMessage.do?sessionid=5">第五届开发团队</a></li>
					</ul>
					<!-- CATEGORIES END -->

					<!-- BEGIN RECENT NEWS -->
					<h2>本届开发者</h2>
					<div class="recent-news margin-bottom-10">

						<!--开发者信息-->
						<c:forEach items="${identifyUserMemberlist}" var="member">
							<div class="row margin-bottom-10">
								<div class="col-md-3">
									<img src="${pageContext.request.contextPath}/${member.purl}"
										alt="" class="img-responsive">
									<!--头像-->
								</div>
								<div class="col-md-9 recent-news-inner">
									<h4>
										<a
											href="${pageContext.request.contextPath }/getMemberAllMessage.do?sessionid=${member.identify.sessions}">${member.user.username}</a>
									</h4>
									<p>${member.identify.positions}</p>
								</div>
							</div>
						</c:forEach>

					</div>

					<div class="blog-photo-stream margin-bottom-20">
						<h2>历届大牛人物</h2>
						<ul class="list-unstyled">
							<!--下面放图片-->
							<!-- 直接找到membercontroller里面的getMemberAll方法调用service层里面的findById,传入id即可，然后通过member.purl可以拿到url -->
							<li><div class="mix-inner">
										<div class="mix-details">
											<a class="mix-preview fancybox-button" href="${pageContext.request.contextPath}/style/images/images_good/chitry.jpg"
												title="Chitry" data-rel="fancybox-button"><img
									src="${pageContext.request.contextPath}/style/images/images_good/chitry.jpg"
									alt=""></a>
										</div>
									</div>
							</li>
							<li><div class="mix-inner">
										<div class="mix-details">
											<a class="mix-preview fancybox-button" href="${pageContext.request.contextPath}/style/images/images_good/hktry.jpg"
												title="Hktry" data-rel="fancybox-button"><img
									src="${pageContext.request.contextPath}/style/images/images_good/hktry.jpg"
									alt=""></a>
										</div>
									</div></li>
							<li><div class="mix-inner">
										<div class="mix-details">
											<a class="mix-preview fancybox-button" href="${pageContext.request.contextPath}/style/images/images_good/sythen.jpg"
												title="Sythen" data-rel="fancybox-button"><img
									src="${pageContext.request.contextPath}/style/images/images_good/sythen.jpg"
									alt=""></a>
										</div>
									</div>
									</li>
							<li><div class="mix-inner">
										<div class="mix-details">
											<a class="mix-preview fancybox-button" href="${pageContext.request.contextPath}/style/images/images_good/maskwang.jpg"
												title="Maskwang" data-rel="fancybox-button"><img
									src="${pageContext.request.contextPath}/style/images/images_good/maskwang.jpg"
									alt=""></a>
										</div>
									</div>
									</li>
							<li><div class="mix-inner">
										<div class="mix-details">
											<a class="mix-preview fancybox-button" href="${pageContext.request.contextPath}/style/images/images_good/zhouying.jpg"
												title="Zhouying" data-rel="fancybox-button"><img
									src="${pageContext.request.contextPath}/style/images/images_good/zhouying.jpg"
									alt=""></a>
										</div>
									</div></li>
							<li><div class="mix-inner">
										<div class="mix-details">
											<a class="mix-preview fancybox-button" href="${pageContext.request.contextPath}/style/images/images_good/0.gif"
												title="ZhangLei" data-rel="fancybox-button"><img
									src="${pageContext.request.contextPath}/style/images/images_good/0.gif"
									alt=""></a>
										</div>
									</div></li>
							<li><div class="mix-inner">
										<div class="mix-details">
											<a class="mix-preview fancybox-button" href="${pageContext.request.contextPath}/style/images/images_good/1.gif"
												title="Startfct" data-rel="fancybox-button"><img
									src="${pageContext.request.contextPath}/style/images/images_good/1.gif"
									alt=""></a>
										</div>
									</div></li>
							<li><div class="mix-inner">
										<div class="mix-details">
											<a class="mix-preview fancybox-button" href="${pageContext.request.contextPath}/style/images/images_good/2.gif"
												title="LiDong" data-rel="fancybox-button"><img
									src="${pageContext.request.contextPath}/style/images/images_good/2.gif"
									alt=""></a>
										</div>
									</div></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!--这里插入底部代码-->
	<c:import url="/include/j_bottom.jsp" />


	<!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/style/assets/plugins/respond.min.js"></script>  
    <![endif]-->
	<script
		src="${pageContext.request.contextPath}/style/assets/plugins/jquery-1.10.2.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/style/assets/plugins/jquery-migrate-1.2.1.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/style/assets/plugins/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/style/assets/plugins/hover-dropdown.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/style/assets/plugins/back-to-top.js"></script>
	<!-- END CORE PLUGINS -->

	<!-- BEGIN PAGE LEVEL JAVASCRIPTS(REQUIRED ONLY FOR CURRENT PAGE) -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/style/assets/plugins/fancybox/source/jquery.fancybox.pack.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/assets/scripts/app.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function() {
			App.init();
		});
	</script>
	<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>