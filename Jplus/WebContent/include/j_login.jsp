<%
/**
 * Jplus在线 全站登陆框
 *
 * @author Chitry
 * @time 2015.08.09
 */
%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <title>Jplus在线 | 登陆页</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/jquery/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/scripts/scripts_login/logincheck.js"></script>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />

   <!-- BEGIN GLOBAL MANDATORY STYLES -->          
   <link href="${pageContext.request.contextPath}/style/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
   <link href="${pageContext.request.contextPath}/style/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
   <!-- END GLOBAL MANDATORY STYLES -->
   
   <!-- BEGIN PAGE LEVEL PLUGIN STYLES --> 
   <link href="${pageContext.request.contextPath}/style/assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet" /> 
   <link href="${pageContext.request.contextPath}/style/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/> 
      <link rel="stylesheet" href="${pageContext.request.contextPath}/style/assets/plugins/revolution_slider/css/rs-style.css" media="screen">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/style/assets/plugins/revolution_slider/rs-plugin/css/settings.css" media="screen"> 
   <link href="${pageContext.request.contextPath}/style/assets/plugins/bxslider/jquery.bxslider.css" rel="stylesheet" />    
   <!-- END PAGE LEVEL PLUGIN STYLES -->

   <!-- BEGIN THEME STYLES --> 
   <link href="${pageContext.request.contextPath}/style/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
   <link href="${pageContext.request.contextPath}/style/assets/css/style.css" rel="stylesheet" type="text/css"/>
   <link href="${pageContext.request.contextPath}/style/assets/css/pages/page404.css" rel="stylesheet" type="text/css"/>
   <link href="${pageContext.request.contextPath}/style/assets/css/themes/blue.css" rel="stylesheet" type="text/css" id="style_color"/>
   <link href="${pageContext.request.contextPath}/style/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
   <link href="${pageContext.request.contextPath}/style/assets/css/custom.css" rel="stylesheet" type="text/css"/>
   <!-- END THEME STYLES -->

   <link rel="shortcut icon" href="favicon.ico" />
</head>
<!-- END HEAD -->

<!-- BEGIN BODY -->
<body>
   
   
   <!--这里插入头部代码-->
	<c:import url="/include/j_top.jsp" />


    <!-- BEGIN PAGE CONTAINER -->  
    <div class="page-container">
  
        <!-- BEGIN BREADCRUMBS -->   
        <div class="row breadcrumbs margin-bottom-40">
            <div class="container">
                <div class="col-md-4 col-sm-4">
                    <h1>登陆</h1>
                </div>
                <div class="col-md-8 col-sm-8">
                    <ul class="pull-right breadcrumb">
                        <li><a href="index.html">Jplus在线</a></li>
                        <li><a href="">Web页</a></li>
                        <li class="active">登陆</li>
                    </ul>
                </div>
            </div>
        </div>


		
        <div class="container margin-bottom-40">
          <div class="row">
            <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 login-signup-page">
                <form action="../index.jsp" method="post">           
                
                    
                    <h2>登陆你的账号</h2>

                    <div class="input-group margin-bottom-20">
                        <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                        <input type="text" class="form-control" placeholder="Username" id="name" name="username"><br/>
                        <font face="楷书" color="red" size="1px"><span id="resultofname"></span></font>
                    </div>                    
                    <div class="input-group margin-bottom-20">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <input type="password" class="form-control" placeholder="Password" id="pasw" name="password"><br/>
                        <font face="楷书" color="red"  size="1px"><span id="resultofpasw"></span></font>
                         
                        <a href="${pageContext.request.contextPath}/include/j_fogotpasw.jsp" class="login-signup-forgot-link">忘记密码?</a>
                    </div>                    

                    <div class="row">
                        <div class="col-md-6 col-sm-6">
                            <div class="checkbox-list"><label class="checkbox"><input type="checkbox"> 记住我</label></div>                        
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <button type="submit" class="btn theme-btn pull-right" id="submitform">立即登陆</button>                        
                            
                        </div>
                    </div>

                    <hr>

                    <div class="login-socio">
                        <p class="text-muted">使用第三方账号登陆:</p>
                        <ul class="social-icons">
                            <li><a class="facebook" data-original-title="facebook" href="#"></a></li>
                            <li><a class="twitter" data-original-title="Twitter" href="#"></a></li>
                            <li><a class="googleplus" data-original-title="Goole Plus" href="#"></a></li>
                            <li><a class="linkedin" data-original-title="Linkedin" href="#"></a></li>
                        </ul>
                    </div>
                </form>
            </div>
          </div>
        </div>
        <!-- END CONTAINER -->

  </div>


    <!--这里插入底部代码-->
	<c:import url="/include/j_bottom.jsp" />
	
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/style/assets/plugins/respond.min.js"></script>  
    <![endif]-->  
    <script src="${pageContext.request.contextPath}/style/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/style/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/style/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>      
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/assets/plugins/hover-dropdown.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/assets/plugins/back-to-top.js"></script>    
	<script src="${pageContext.request.contextPath}/style/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
    <!-- END CORE PLUGINS -->

    <!-- BEGIN PAGE LEVEL JAVASCRIPTS(REQUIRED ONLY FOR CURRENT PAGE) -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/assets/plugins/fancybox/source/jquery.fancybox.pack.js"></script>

    <script src="${pageContext.request.contextPath}/style/assets/scripts/app.js"></script>  
    <script type="text/javascript">
        jQuery(document).ready(function() {    
           App.init();
		   App.initUniform();  
        });
    </script>
    <!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>