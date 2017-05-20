<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addVideo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="/style/js/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="/style/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/style/js/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="/style/js/easyui/easyloader.js"></script>
	<link rel="stylesheet" type="text/css" href="/style/js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="/style/js/easyui/themes/icon.css">
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
  
  <body>
	<!--全站通用顶部-->
	<c:import url="/include/j_top.jsp" />
  ${message}
  	<div id="">
  		<form method="post" action="addVideo.do">
		  	<table border="1">
				  <tr>
				    <td>视频分类</td>
				    <td>
						<input type="text" class=""  name="sec_courseid">
				    </td>
				  </tr>
				 	
				  <tr>
				    <td>视频标题</td>
				    <td><input type="text" class ="" name="title"></td>
				  </tr>
				  <tr>	
				  	<td>视频名称</td>
				  	<td><input type="text" class ="" name="cour_videoid"></td>
				  </tr>
				  <tr>
				    <td>作者</td>
				    <td><input type="text" class ="" name="author"></td>
				  </tr>
				  <tr>
				    <td>简介</td>
				    <td><input type="text" class ="" name="info"></td>
				  </tr>
				   <tr>
				    <td>关键字</td>
				    <td><input type="text" class ="" name="keyword"></td>
				  </tr>
				  <tr>
						<td colspan="2" align="center">
				  			<input type="submit" value="提交">
				  			<input type="reset" value="取消">
				  		</td>
				  </tr>
				</table>
  		</form>
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