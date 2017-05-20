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
<title>Jplus在线 | 主页</title>
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

<c:import url="/include/j_top.jsp" />


<!-- BEGIN PAGE CONTAINER -->
<div class="page-container"><!-- BEGIN REVOLUTION SLIDER -->
<div class="fullwidthbanner-container slider-main">
<div class="fullwidthabnner">
<ul id="revolutionul" style="display: none;">
	<!-- THE FIRST SLIDE -->
	<li data-transition="fade" data-slotamount="8" data-masterspeed="700"
		data-delay="9400"
		data-thumb="${pageContext.request.contextPath}/style/assets/img/sliders/revolution/thumbs/thumb2.jpg">
	<!-- THE MAIN IMAGE IN THE FIRST SLIDE --> <img
		src="${pageContext.request.contextPath}/style/assets/img/sliders/revolution/bg1.jpg"
		alt="">

	<div class="caption lft slide_title slide_item_left" data-x="0"
		data-y="105" data-speed="400" data-start="1500"
		data-easing="easeOutExpo">线上的时光，你我共勉。</div>
	<div class="caption lft slide_subtitle slide_item_left" data-x="0"
		data-y="180" data-speed="400" data-start="2000"
		data-easing="easeOutExpo">Jplus实验室历届成员召集令</div>
	<div class="caption lft slide_desc slide_item_left" data-x="0"
		data-y="220" data-speed="400" data-start="2500"
		data-easing="easeOutExpo">赶紧点击下面的按钮提交你的认证信息吧<br>
	认证之后可以进入网站成员后台哦~.</div>
	<a class="caption lft btn green slide_btn slide_item_left"  href="javascript:indef(this);"
		data-x="0" data-y="290" data-speed="400" data-start="3000"
		data-easing="easeOutExpo"> Identify Now! </a>
		<script type="text/javascript">
		function indef(){
			if("${loginuser == null}" || "${loginuser}" == ""){
				alert('对不起，您还未登录！请登录之后重试！');
			}else if("${loginuser.identifys!=0}"){
				alert('对不起，您已经进行过认证操作，暂时不支持重复认证！');
			}else{
				location.href="${pageContext.request.contextPath}/include/j_usermsg.jsp#renzheng";
			}
		}
		</script>
	<div class="caption lfb" data-x="640" data-y="90" data-speed="700"
		data-start="1000" data-easing="easeOutExpo"><img
		src="${pageContext.request.contextPath}/style/assets/img/sliders/revolution/man-winner.png"
		alt="Image 1"></div>
	</li>

	<!-- THE SECOND SLIDE -->
	<li data-transition="fade" data-slotamount="7" data-masterspeed="300"
		data-delay="9400"
		data-thumb="${pageContext.request.contextPath}/style/assets/img/sliders/revolution/thumbs/thumb2.jpg">
	<img
		src="${pageContext.request.contextPath}/style/assets/img/sliders/revolution/bg2.jpg"
		alt="">
	<div class="caption lfl slide_title slide_item_left" data-x="0"
		data-y="125" data-speed="400" data-start="3500"
		data-easing="easeOutExpo">JSP|PHP|ASP.Net外包承接</div>
	<div class="caption lfl slide_subtitle slide_item_left" data-x="0"
		data-y="200" data-speed="400" data-start="4000"
		data-easing="easeOutExpo">因为选择,所以成就</div>
	<div class="caption lfl slide_desc slide_item_left" data-x="0"
		data-y="245" data-speed="400" data-start="4500"
		data-easing="easeOutExpo">欢迎选择提交外包请求，选择我们，成就你我.</div>
	<div class="caption lfr slide_item_right" data-x="635" data-y="105"
		data-speed="1200" data-start="1500" data-easing="easeOutBack"><img
		src="${pageContext.request.contextPath}/style/assets/img/sliders/revolution/mac.png"
		alt="Image 1"></div>
	<div class="caption lfr slide_item_right" data-x="580" data-y="245"
		data-speed="1200" data-start="2000" data-easing="easeOutBack"><img
		src="${pageContext.request.contextPath}/style/assets/img/sliders/revolution/ipad.png"
		alt="Image 1"></div>
	<div class="caption lfr slide_item_right" data-x="735" data-y="290"
		data-speed="1200" data-start="2500" data-easing="easeOutBack"><img
		src="${pageContext.request.contextPath}/style/assets/img/sliders/revolution/iphone.png"
		alt="Image 1"></div>
	<div class="caption lfr slide_item_right" data-x="835" data-y="230"
		data-speed="1200" data-start="3000" data-easing="easeOutBack"><img
		src="${pageContext.request.contextPath}/style/assets/img/sliders/revolution/macbook.png"
		alt="Image 1"></div>
	<div class="caption lft slide_item_right" data-x="865" data-y="45"
		data-speed="500" data-start="5000" data-easing="easeOutBack"><img
		src="${pageContext.request.contextPath}/style/assets/img/sliders/revolution/hint1-blue.png"
		id="rev-hint1" alt="Image 1"></div>
	<div class="caption lfb slide_item_right" data-x="355" data-y="355"
		data-speed="500" data-start="5500" data-easing="easeOutBack"><img
		src="${pageContext.request.contextPath}/style/assets/img/sliders/revolution/hint2-blue.png"
		id="rev-hint2" alt="Image 1"></div>

	</li>

	<!-- THE THIRD SLIDE -->
	<li data-transition="fade" data-slotamount="8" data-masterspeed="700"
		data-delay="9400"
		data-thumb="${pageContext.request.contextPath}/style/assets/img/sliders/revolution/thumbs/thumb2.jpg">
	<img
		src="${pageContext.request.contextPath}/style/assets/img/sliders/revolution/bg3.jpg"
		alt="">
	<div class="caption lfl slide_item_left" data-x="20" data-y="95"
		data-speed="400" data-start="1500" data-easing="easeOutBack"><%-- <iframe src="${pageContext.request.contextPath }/style/scripts/scripts_index_banner/vedios/jplus.mp4" width="420" height="240" style="border:0" allowFullScreen></iframe>  --%>
	<video id="myvedio"
		src="${pageContext.request.contextPath }/res/index/jplus.mp4"
		width="420" height="240" style="border: 0" allowFullScree
		controls="controls">
		您的浏览器不支持 video 标签。
	</video></div>
	<div class="caption lfr slide_title" data-x="470" data-y="100"
		data-speed="400" data-start="2000" data-easing="easeOutExpo">
	Jplus线上学院</div>
	<div class="caption lfr slide_subtitle" data-x="470" data-y="170"
		data-speed="400" data-start="2500" data-easing="easeOutExpo">
	Jplus实验室官方夏令营培训资料.</div>
	<div class="caption lfr slide_desc" data-x="470" data-y="220"
		data-speed="400" data-start="3000" data-easing="easeOutExpo">
	最综合的JavaWeb培训<br>
	一个月时间让你从菜鸟变成高手.</div>
	<a class="caption lfr btn yellow slide_btn"
		href="${pageContext.request.contextPath }//InitList.do" data-x="470"
		data-y="280" data-speed="400" data-start="3500"
		data-easing="easeOutExpo"> 马上进入Jplus学院 </a></li>

	<!-- THE FORTH SLIDE -->
	<li data-transition="fade" data-slotamount="8" data-masterspeed="700"
		data-delay="9400"
		data-thumb="${pageContext.request.contextPath}/style/assets/img/sliders/revolution/thumbs/thumb2.jpg">
	<!-- THE MAIN IMAGE IN THE FIRST SLIDE --> <img
		src="${pageContext.request.contextPath}/style/assets/img/sliders/revolution/bg4.jpg"
		alt="">
	<div class="caption lft slide_title" data-x="0" data-y="105"
		data-speed="400" data-start="1500" data-easing="easeOutExpo">
	学习困难求助 ?</div>
	<div class="caption lft slide_subtitle" data-x="0" data-y="180"
		data-speed="400" data-start="2000" data-easing="easeOutExpo">
	JavaWeb开发者社区</div>
	<div class="caption lft slide_desc" data-x="0" data-y="225"
		data-speed="400" data-start="2500" data-easing="easeOutExpo">
	大神云集之地<br>
	赶紧上JW论坛提交错误信息吧.</div>
	<a class="caption lft slide_btn btn red slide_item_left"
		href="http://bbs.jplus.online" target="_blank" data-x="0" data-y="300"
		data-speed="400" data-start="3000" data-easing="easeOutExpo">
	进入社区! </a>
	<div class="caption lft start" data-x="670" data-y="55"
		data-speed="400" data-start="2000" data-easing="easeOutBack"><img
		src="${pageContext.request.contextPath}/style/assets/img/sliders/revolution/iphone_left.png"
		alt="Image 2"></div>

	<div class="caption lft start" data-x="850" data-y="55"
		data-speed="400" data-start="2400" data-easing="easeOutBack"><img
		src="${pageContext.request.contextPath}/style/assets/img/sliders/revolution/iphone_right.png"
		alt="Image 3"></div>
	</li>
</ul>
<div class="tp-bannertimer tp-bottom"></div>
</div>
</div>
<!-- END REVOLUTION SLIDER --> <!-- BEGIN CONTAINER -->
<div class="container"><!-- BEGIN SERVICE BOX -->
<div class="row service-box">
<div class="col-md-4 col-sm-4">
<div class="service-box-heading"><em><i
	class="fa fa-location-arrow blue"></i></em> <span>页面模版设计</span></div>
<p>Html+Css+JavaScript,JQuery,Bootstrap,Photoshop,Flash,Html5,
网页游戏开发...无一不通.</p>
</div>
<div class="col-md-4 col-sm-4">
<div class="service-box-heading"><em><i
	class="fa fa-check red"></i></em> <span>项目系统策划</span></div>
<p>纯Servlet,SSH,SpringMVC,MyBatis,Lucene,Oracle,MySQL,
MongoDB....无一不精</p>
</div>
<div class="col-md-4 col-sm-4">
<div class="service-box-heading"><em><i
	class="fa fa-resize-small green"></i></em> <span>JavaWeb培训</span></div>
<p>JavaWeb年度夏令营，从菜鸟到JavaWeb开发者,再到传说中的高手...成就你我.</p>
</div>
</div>
<!-- END SERVICE BOX --> <!-- BEGIN BLOCKQUOTE BLOCK -->
<div class="row quote-v1">
<div class="col-md-9 quote-v1-inner"><span>认真设计，科学合作，因为热爱，所以执着，点击提交外包请求</span>
</div>
<div class="col-md-3 quote-v1-inner text-right"><a
	class="btn-transparent"
	href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=D2xnZnt9diE2O09_fiFsYGI"
	target="_blank"><i class="fa fa-rocket margin-right-10"></i>Request</a>
<!--<a class="btn-transparent" href="http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469"><i class="icon-gift margin-right-10"></i>Purchase 2 in 1</a>-->
</div>
</div>
<!-- END BLOCKQUOTE BLOCK -->

<div class="clearfix"></div>

<!-- BEGIN RECENT WORKS -->
<div class="row recent-work margin-bottom-40">
<div class="col-md-3">
<h2><a href="javascript:void(0)">合作案例</a></h2>
<p>因为热爱，所以执着.</p>
</div>
<div class="col-md-9">
<ul class="bxslider">
	<c:forEach var="ex" items="${examplelist}">
		<li><em> <img
			src="${pageContext.request.contextPath}${ex.npic}" alt="" /> <a
			href="${ex.nUrl}"><i class="fa fa-link icon-hover icon-hover-1"></i></a>
		<a href="${pageContext.request.contextPath}${ex.npic}"
			class="fancybox-button" title="Project Name #1"
			data-rel="fancybox-button"><i
			class="fa fa-search icon-hover icon-hover-2"></i></a> </em> <a
			class="bxslider-block" href="javascript:void(0)"> <strong>${ex.nTitle
		}</strong> <b>${ex.nName}</b> </a></li>
	</c:forEach>
</ul>
</div>
</div>
<!-- END RECENT WORKS -->

<div class="clearfix"></div>

<!-- BEGIN STEPS -->
<div class="row no-space-steps margin-bottom-40">
<div class="col-md-4 col-sm-4">
<div class="front-steps front-step-one">
<h2>需求设计与分析</h2>
<p>通过与客户接触，设计完全满足客户需求的项目需求设计报告和分析说明.</p>
</div>
</div>
<div class="col-md-4 col-sm-4">
<div class="front-steps front-step-two">
<h2>项目构建</h2>
<p>在项目负责人接到需求设计分析之后，进行团队设计分工和项目工程构建.</p>
</div>
</div>
<div class="col-md-4 col-sm-4">
<div class="front-steps front-step-three">
<h2>测试运营</h2>
<p>与客户进行多次交涉并按要求修改项目源码后，对系统进行测试，通过后投入上线运营.</p>
</div>
</div>
</div>
<!-- END STEPS --> <!-- BEGIN CLIENTS -->
<div class="row margin-bottom-40 our-clients">
<div class="col-md-3">
<h2><a href="#">合作单位</a></h2>
<p>Jplus实验室合作单位：我们期待您与我们合作，共同进步！</p>
</div>
<div class="col-md-9">
<ul class="bxslider1 clients-list">
	<li><a href="${bbslist[0].brUrl }"> <img
		src="${pageContext.request.contextPath}${bbslist[0].brPurl}"
		alt="${bbslist[0].brDescriptions}" /> <img
		src="${pageContext.request.contextPath}${bbslist[0].brPurl}"
		class="color-img" alt="${bbslist[0].brDescriptions}" /> </a></li>
	<c:forEach var="list" begin="2" items="${bbslist}">
		<li><a href="${list.brUrl }"> <img
			src="${pageContext.request.contextPath}${list.brPurl}"
			alt="${list.brDescriptions}" /> <img
			src="${pageContext.request.contextPath}${list.brPurl2}"
			class="color-img" alt="${list.brDescriptions}" /> </a></li>
	</c:forEach>

</ul>
</div>
</div>
<!-- END CLIENTS --></div>
<!-- END CONTAINER --></div>
<!-- END PAGE CONTAINER -->


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