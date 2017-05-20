<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8" />
<title>Jplus在线 | 资源共享</title>
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
<link
	href="${pageContext.request.contextPath}/style/assets/plugins/uniform/css/uniform.default.css"
	rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL PLUGIN STYLES -->

<!-- BEGIN THEME STYLES -->
<link
	href="${pageContext.request.contextPath}/style/assets/css/style-metronic.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/style/assets/css/style.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/style/assets/css/pages/search-page-results.css"
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

<body>
	<input type="hidden" id=""uid name="userid" value="${loginuser.id}"/>
	<c:import url="/include/j_top.jsp" />


	<!-- BEGIN PAGE CONTAINER -->
	<div class="page-container">
		<!-- BEGIN BREADCRUMBS -->
		<div class="row breadcrumbs margin-bottom-40">
			<div class="container">
				<div class="col-md-4 col-sm-4">
					<h1>
						<a href="${pageContext.request.contextPath}/ziyuan/findres.do">资源共享</a>
					</h1>
				</div>
			</div>
		</div>
		<!-- END BREADCRUMBS -->

		<!-- BEGIN CONTAINER -->
		<div class="row">
			<div class="col-md-2">
				<div>
					<h3 class="page-header text-info">快速导航</h3>
					<ul class="list-group">
						<c:forEach items="${rcs }" var="list">
							<li class="list-group-item"><a
								href="${pageContext.request.contextPath}/ziyuan/findres.do?rid=${list.id}">${list.resname}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="col-md-8">
				<div class="container min-hight">
					<div class="row margin-bottom-40">
						<div class="col-md-12 col-sm-12">
							<!-- BEGIN SEARCH FORM ON PAGE RESULTS -->
							<div class="row search-form-default">
								<form class="form-inline" action="findres.do">
									<div class="input-group">
										<div class="input-cont">
											<input placeholder="请输入关键字" name="souinfo"
												class="form-control" type="text" value="">
										</div>
										<span class="input-group-btn">
											<button class="btn btn-default theme-btn" type="submit">
												快速搜索<i class="m-icon-swapright m-icon-white"></i>
											</button>
										</span>
									</div>
								</form>
							</div>
							<!-- END SEARCH FORM ON PAGE RESULTS -->

							<!-- BEGIN SEARCH RESULTS -->
							<c:forEach items="${rss}" var="list">
								<div class="search-result-item" style="background: #EEEEEE;">
									<div class="row">
										<div class="col-md-6">
											<h4>
												<span class="text-danger">${list.resname}</span>
											</h4>
											<p>
												资源描述：<span class="text-info">${list.resdescription}</span>
											</p>
										</div>
										<div class="col-md-2">
											<p>
												上传作者：<span class="text-primary">${list.userzz}</span>
											</p>
											<p>
												上传日期：<span class="text-primary"><fmt:formatDate
														value="${list.resdate}" /></span>
											</p>
											<p>
												资源类别：<span class="text-primary">${list.resclassds}</span>
											</p>
										</div>
										<div class="col-md-2">
											<p>
												下载次数：<span class="text-primary">${list.downloadnum}</span>
											</p>
											<p>
												下载积分：<span class="text-primary">${list.downloadscore}</span>
											</p>
										</div>
										<div class="col-md-2">
											<c:if test="${not empty list.resLocationpath}">
												<button type="button" class="btn btn-info"
													onclick="downres('${list.resLocationpath}')">本地下载</button>
											</c:if>

											<c:if test="${not empty list.res360path}">
												<button type="button" class="btn btn-success"
													onclick="downres('${list.res360path}')">360网盘下载</button>
											</c:if>
											<c:if test="${not empty list.resBdypath}">
												<button type="button" class="btn btn-primary"
													onclick="downres('${list.resBdypath}')">百度云网盘下载</button>
											</c:if>
										</div>
									</div>
								</div>
							</c:forEach>
							<!-- END SEARCH RESULTS -->
							<script type="text/javascript">
								function downres(url){
									if($("#uid").val()!=undefined){
										window.open(url);
									}else{
										alert("请先登录！！！");
										return false;
									}
								}
							</script>

							<!-- BEGIN PAGINATION -->
							<div class="margin-top-20">
								<ul class="pagination">
									<li><a
										href="${pageContext.request.contextPath}/ziyuan/findres.do?souinfo=${souinfo}&rid=${rid}&page=1">首页</a></li>
									<li><a
										href="${pageContext.request.contextPath}/ziyuan/findres.do?souinfo=${souinfo}&rid=${rid}&page=${pageInfo.pageNum-1==0?1:pageInfo.pageNum-1}">上一页</a></li>
									<li><a
										href="${pageContext.request.contextPath}/ziyuan/findres.do?souinfo=${souinfo}&rid=${rid}&page=${pageInfo.pageNum+1==pageInfo.pages+1?pageInfo.pages:pageInfo.pageNum+1}">下一页</a></li>
									<li><a
										href="${pageContext.request.contextPath}/ziyuan/findres.do?souinfo=${souinfo}&rid=${rid}&page=${pageInfo.pages}">尾页</a></li>
									<li><span class="text-info'">第${pageInfo.pageNum}页/共${pageInfo.pages}页</span></li>
								</ul>
							</div>
							<!-- END PAGINATION -->
						</div>
					</div>
					<!-- END CONTAINER -->
				</div>
			</div>
		</div>


	</div>
	<!-- END PAGE CONTAINER -->

	<c:import url="/include/j_bottom.jsp" />

	<!-- Load javascripts at bottom, this will reduce page load time -->
	<!-- BEGIN CORE PLUGINS(REQUIRED FOR ALL PAGES) -->
	<!--[if lt IE 9]>
    <script src="assets/plugins/respond.min.js"></script>  
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
	<script src="assets/scripts/app.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function() {
			App.init();
		});
	</script>
</body>
</html>
