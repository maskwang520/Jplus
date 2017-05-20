<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8" />
        <title>Jplus在线 | 用户信息</title>
        <!-- 下面是一个照片上传验证 
             <script> 
                                function PreviewImage(imgFile) 
                                { 
                                        var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;      
                                        if(!pattern.test(imgFile.value)) 
                                        { 
                                                alert("系统仅支持jpg/jpeg/png/gif/bmp格式的照片！");  
                                                imgFile.focus(); 
                                        } 
                                        else 
                                        { 
                                                var path; 
                                                if(document.all)//IE 
                                                { 
                                                        imgFile.select(); 
                                                        path = document.selection.createRange().text; 
                                                        document.getElementById("imgPreview").innerHTML=""; 
                                                        document.getElementById("imgPreview").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\"" + path + "\")";//使用滤镜效果 
                                                } 
                                                else//FF 
                                                { 
                                                        path = URL.createObjectURL(imgFile.files[0]);
                                                        document.getElementById("imgPreview").innerHTML = "<img src='"+path+"'/>"; 
                                                } 
                                        } 
                                } 
                        </script> -->
        <script type="text/javascript" src="<%=request.getContextPath()%>/style/jquery/jquery-1.8.2.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/style/scripts/scripts_jws/data.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/style/scripts/scripts_jws/jsAddress.js"></script> 
        <script type="text/javascript">
            function changeyzm() {
                var contextPath = document.getElementById("contextPath").value;
                document.getElementById("verify_img").src = contextPath + "/RandomCodeServlet?" + Math.random();
            }
        </script>
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
    <body>

        <c:import url="/include/j_top.jsp" />


        <div class="page-container">


            <!-- tab_4的信息 -->
<!-- BEGIN PAGE CONTAINER -->  
    <div class="page-container">
  
        <!-- BEGIN BREADCRUMBS -->   
        <div class="row breadcrumbs margin-bottom-40">
            <div class="container">
                <div class="col-md-4 col-sm-4">
                    <h1>信息提示</h1>
                </div>
                <div class="col-md-8 col-sm-8">
                    <ul class="pull-right breadcrumb">
                        <li><a href="index.html">Jplus在线</a></li>
                        <li><a href="">Tip页</a></li>
                        <li class="active">信息提示</li>
                    </ul>
                </div>
            </div>
        </div>


		
        <div class="container margin-bottom-40">
          <div class="row">
            <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 login-signup-page">
                <form action="../index.jsp" method="post">           
                
                    
                    <h2>温馨提示</h2>
                       <hr>
                                  
                    <div class="input-group margin-bottom-20">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        
                        <font face="楷书" color="red"  size="3px"><span id="resultofpasw">${message}</span></font>
                    </div>                    

                    <br/><br/>

                    <hr>
                    <div class="row">
                        <div style="color:blue;width:100%;">
                            <a href="${pageContext.request.contextPath}${msgurl}">
                                如果您的浏览器长时间未跳转，请点击本连接进行跳转。
                            </a>
                        </div>
                    </div>
                   
                </form>
            </div>
          </div>
        </div>
        <!-- END CONTAINER -->





            <!-- END TAB CONTENT -->
        </div>

        <!-- END CONTAINER -->



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
        //alert('开始跳转');
        setTimeout("doJump()",5000);
    });
    function doJump(){
        location.href="${pageContext.request.contextPath}${msgurl}";
    }
        </script>
        <!-- END PAGE LEVEL JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>