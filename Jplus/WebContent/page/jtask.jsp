<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>Jplus在线 | 常务大厅</title>
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

<link class="jqueryui library" rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/css/css_jtask/jquery-ui-1.9.1.custom.min.css">
<script class="jqueryui library"
	src="${pageContext.request.contextPath}/style/css/css_jtask/jquery-1.8.2.min.js"
	type="text/javascript"></script>
<script class="jqueryui library"
	src="${pageContext.request.contextPath}/style/css/css_jtask/jquery-ui-1.9.1.custom.min.js"
	type="text/javascript"></script>
<script class="resources library"
	src="${pageContext.request.contextPath}/style/css/css_jtask/wish.js"
	type="text/javascript"></script>
</head>
<!-- END HEAD -->

<!-- BEGIN BODY -->
<body class="page-header-fixed">
	<c:import url="/include/j_top.jsp" />

	<!-- BEGIN PAGE CONTAINER -->
	<div class="page-container">
		<!-- BEGIN REVOLUTION SLIDER -->
		<div class="fullwidthbanner-container slider-main">
			<div class="fullwidthabnner">
				<ul id="revolutionul" style="display: none;">
				<c:forEach var="list" items="${userJnoticelist}">
					<li data-transition="fade" data-slotamount="8"
						data-masterspeed="1200" data-delay="9400"
						data-thumb="${pageContext.request.contextPath}/style/assets/img/sliders/revolution/thumbs/thumb2.jpg">
						<img
						src="${pageContext.request.contextPath}/style/css/css_jtask/1.jpg"
						alt="">
						<div class="caption lfr slide_subtitle" data-x="470" data-y="35"
							data-speed="400" data-start="1500" data-easing="easeOutExpo">
							${list.noticeTitle}.</div>
						<div style="width:60%;" class="caption lfr slide_desc" data-x="270" data-y="80"
							data-speed="400" data-start="2000" data-easing="easeOutExpo">
							<textarea readonly="readonly" style="cursor:pointer;border:0;width:100%;height:300px;opacity:0.57;filter:alpha(opacity=57);">
							${list.noticeContent}</textarea></div>
						 <div class="caption lfr btn yellow slide_btn"
						data-x="970" data-y="390" data-speed="400" data-start="2800"
						data-easing="easeOutExpo">${list.noticeReltime}</div>
					</li>
					</c:forEach>
				</ul>
				<div class="tp-bannertimer tp-bottom"></div>
			</div>
		</div>
		<!-- END REVOLUTION SLIDER -->
		<!-- BEGIN CONTAINER -->
		<div class="container" style="width:90%;">
			<!-- BEGIN SERVICE BOX -->

			<div id="wish"
				style="background:url('${pageContext.request.contextPath}/style/css/css_jtask/jjtask.jpg');">
				<c:forEach var="list" items="${sessionScope.userJtasklist}">
					<div>
						<p>
							<i class="fa fa-link"></i>${list.taskTitle}</p>
						<p>${list.taskContent}</p>
						<p align="right">
							<fmt:formatDate value='${list.taskReltime}' type="both" />
						</p>

					</div>
				</c:forEach>
			</div>
			<div class="margin-top-20" style="text-align: center;">
				<ul class="pagination">
					<li><a href="getUserJtask.do?pageNo=${page.pageNo-1}">上一页</a></li>
					<li><a href="getUserJtask.do?pageNo=${page.pageNo+1}">下一页</a></li>
				</ul>
			</div>

<style>
#wish {
	width: 100%;
	height: 800px;
	margin: 15px;
	position: relative;
}

.wish {
	width: 185px;
	height: 166px;
	background:
		url(${pageContext.request.contextPath}/style/css/css_jtask/s1.png)
		no-repeat 0 0;
	color: black;
	padding: 10px 20px 30px 20px;
}

.wish p {
	white-space: normal;
}

.wish .close {
	display: block;
	position: absolute;
	top: -5px;
	left: 0px;
	background:
		url(${pageContext.request.contextPath}/style/css/css_jtask/close.png)
		no-repeat 0 0;
	width: 17px;
	height: 17px;
	display: none;
	cursor: pointer
}
</style>
			<script type="text/javascript">
				$('#wish').wish();
				$('.wish').draggable({
					containment : "#wish",
					scroll : false
				});
			</script>
			<!-- END PAGE CONTAINER -->


		</div>
	</div>


	<c:import url="/include/j_bottom.jsp" />


	<!-- Load javascripts at bottom, this will reduce page load time -->
	<!-- BEGIN CORE PLUGINS(REQUIRED FOR ALL PAGES) -->
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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/style/assets/plugins/revolution_slider/rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/style/assets/plugins/revolution_slider/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/style/assets/plugins/bxslider/jquery.bxslider.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/assets/scripts/app.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/assets/scripts/index.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function() {
			App.init();
			App.initBxSlider();
			Index.initRevolutionSlider();
		});
	</script>
	<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
