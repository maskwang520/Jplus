<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <title>Jplus在线 | 团队简介 - 开发者信息</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/jquery/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/scripts/scripts_jmember/show.js"></script>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />

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
                    <h1>团队简介 - 开发者</h1>
                </div>
                <div class="col-md-8 col-sm-8">
                    <ul class="pull-right breadcrumb">
                        <li><a href="index.html">Jplus在线</a></li>
                        <li><a href="">Web页</a></li>
                        <li class="active">团队简介 - 开发者</li>
                    </ul>
                </div>
            </div>
        </div> 
		
		<div class="container min-hight">
			<!-- BEGIN ABOUT INFO -->   
			<div class="row margin-bottom-30">
				<!-- BEGIN INFO BLOCK -->               
				<div class="col-md-7 space-mobile">
					<h2><span id="membername">${identifyUserMemberlist[0].user.username}</span></h2>
					<!--下面写简介-->
					<p>个人简介：<span id="memberdescriptions">${identifyUserMemberlist[0].cotents}</span></p> 
					<p>兴趣：<span id="memberhobby">${identifyUserMemberlist[0].user.hobby}</span></p> 
					<p>现在的工作：<span id="membernowwork">${identifyUserMemberlist[0].nowwork}</span></p> 
					<p>博客地址：<span id="memberblogs">${identifyUserMemberlist[0].blogs}</span></p> 
					<p>寄语：<span id="membersuggestions">${identifyUserMemberlist[0].suggestions}</span></p> 
					
					<!-- BEGIN LISTS -->
					<!--  
					<div class="row front-lists-v1">
						<div class="col-md-6">
							<ul class="list-unstyled margin-bottom-20">
								<li><i class="fa fa-check"></i> Officia deserunt molliti</li>
								<li><i class="fa fa-check"></i> Consectetur adipiscing </li>
								<li><i class="fa fa-check"></i> Deserunt fpicia</li>
							</ul>
						</div>
						<div class="col-md-6">
							<ul class="list-unstyled">
								<li><i class="fa fa-check"></i> Officia deserunt molliti</li>
								<li><i class="fa fa-check"></i> Consectetur adipiscing </li>
								<li><i class="fa fa-check"></i> Deserunt fpicia</li>
							</ul>
						</div>
					</div>
					<!-- END LISTS -->
				</div>
                
				<!--开发者照片-->
				<div class="col-md-5 front-carousel">
					<div id="myCarousel" class="carousel slide">
						<!-- Carousel items -->
						<div class="carousel-inner">
							<div class="active item">
								<img src="${pageContext.request.contextPath}/${identifyUserMemberlist[0].purl}" alt="">
								<div class="carousel-caption">
								    <input type="hidden" class="memberid" value="${identifyUserMemberlist[0].id}">
									${identifyUserMemberlist[0].user.username}
								</div>
							</div>
							<c:forEach  items="${identifyUserMemberlist}" var="list" begin="1">
							<div class="item">
								<img src="${pageContext.request.contextPath}/${list.purl}" alt="">
								<div class="carousel-caption">
								      <input type="hidden" class="memberid" value="${list.id}">
									${list.user.username}
								</div>
							</div>
							</c:forEach>
							 
							<!--  
							<div class="item">
								<img src="${pageContext.request.contextPath}/style/assets/img/pics/img2-medium.jpg" alt="">
								<div class="carousel-caption">
									<p>Ut non libero consectetur adipiscing elit magna</p>
								</div>
							</div>
							-->
						</div>
						<!-- Carousel nav -->
						<a class="carousel-control left" href="#myCarousel" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a class="carousel-control right" href="#myCarousel" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>                
				</div>
				<!-- END CAROUSEL -->             
			</div>
			<!-- END ABOUT INFO -->   

			<!-- BEGIN TESTIMONIALS AND PROGRESS BAR -->
			<div class="row margin-bottom-40">
				<!--下面插入的是评论代码-->
				<!-- 多说评论框 start -->
				<div class="col-md-7">
				<c:choose>
				<c:when test="${sessionNumber == 1 }">
					<div class="ds-thread" data-thread-key="no1_jplus"
						data-title="no1" data-url="http://www.jplus.online/getMemberAllMessage.do?sessionid=1"></div>
				</c:when>
				<c:when test="${sessionNumber == 2 }">
					<div class="ds-thread" data-thread-key="no2_jplus"
						data-title="no2" data-url="http://www.jplus.online/getMemberAllMessage.do?sessionid=2"></div>
				</c:when>
				<c:when test="${sessionNumber == 3 }">
					<div class="ds-thread" data-thread-key="no3_jplus"
						data-title="no3" data-url="http://www.jplus.online/getMemberAllMessage.do?sessionid=3"></div>
				</c:when>
				<c:when test="${sessionNumber == 4 }">
					<div class="ds-thread" data-thread-key="no4_jplus"
						data-title="no4" data-url="http://www.jplus.online/getMemberAllMessage.do?sessionid=4"></div>
				</c:when>
				<c:when test="${sessionNumber == 5 }">
					<div class="ds-thread" data-thread-key="no5_jplus"
						data-title="no5" data-url="http://www.jplus.online/getMemberAllMessage.do?sessionid=5"></div>
				</c:when>
				<c:otherwise>
					<div class="ds-thread" data-thread-key="otherwise_jplus"
						data-title="otherwise" data-url="http://www.jplus.online/getMemberAllMessage.do?sessionid=otherwise"></div>
				</c:otherwise>
				</c:choose>
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
				
				
				
				

				<!-- BEGIN PROGRESS BAR -->
				<div class="col-md-5 front-skills space-mobile">
					<h2 class="block">所属团队技能</h2>
					<span>UI Design 90%</span>
					<div class="progress">
						<div style="width: 90%;" class="progress-bar" role="progressbar"></div>
					</div>
					<span>HTML/CSS & JavaScirp 75%</span>
					<div class="progress">
						<div style="width: 75%;" class="progress-bar" role="progressbar"></div>
					</div>
					<span>Html5 60%</span>
					<div class="progress">
						<div style="width: 60%;" class="progress-bar" role="progressbar"></div>
					</div>
					<span>JavaWeb 80%</span>
					<div class="progress">
						<div style="width: 80%;" class="progress-bar" role="progressbar"></div>
					</div>
					<c:choose>
					<c:when test="${sessionNumber == 4 }">
					<span>PHP 89%</span>
					<div class="progress">
						<div style="width: 89%;" class="progress-bar" role="progressbar"></div>
					</div>
					</c:when>
					<c:otherwise>
						<span>PHP 49%</span>
						<div class="progress">
							<div style="width: 49%;" class="progress-bar" role="progressbar"></div>
						</div>
					</c:otherwise>
					</c:choose>
					<span>ASP.Net 50%</span>
					<div class="progress">
						<div style="width: 50%;" class="progress-bar" role="progressbar"></div>
					</div>
				</div>                       
				<!-- END PROGRESS BAR -->
			</div>

			
			
			
			
			
			<!--该团队内的其他成员-->
			<div class="row front-team">
				<ul class="list-unstyled">
				<c:forEach items="${identifyUserMemberlist}" var="list">
					<li class="col-md-3 space-mobile">
						<div class="thumbnail">
							<img src="${pageContext.request.contextPath}/${list.purl}" alt="">
							<h3>
							    <input type="hidden" class="memberid" value="${list.id}">
								<a href="javascript:void(0)" class="show4">${list.user.username}</a> 
								<!--  <small>Chief Executive Officer / CEO</small>-->
							</h3>
							<p>${list.skills}</p>
							<ul class="social-icons social-icons-color">
								<li><a href="#" data-original-title="Facebook" class="facebook"></a></li>
								<li><a href="#" data-original-title="Twitter" class="twitter"></a></li>
								<li><a href="#" data-original-title="Goole Plus" class="googleplus"></a></li>
								<li><a href="#" data-original-title="Linkedin" class="linkedin"></a></li>
							</ul>
						</div>
					</li>
					</c:forEach>
					<!--  
					<li class="col-md-3 space-mobile">
						<div class="thumbnail">
							<img src="${pageContext.request.contextPath}/style/assets/img/people/img4-large.jpg" alt="">
							<h3>
								<a>Carles Puyol</a> 
								 <small>Chief Executive Officer / CEO</small>
							</h3>
							<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, justo sit amet risus etiam porta sem...</p>
							<ul class="social-icons social-icons-color">
								<li><a href="#" data-original-title="Facebook" class="facebook"></a></li>
								<li><a href="#" data-original-title="Twitter" class="twitter"></a></li>
								<li><a href="#" data-original-title="Goole Plus" class="googleplus"></a></li>
								<li><a href="#" data-original-title="Linkedin" class="linkedin"></a></li>
							</ul>
						</div>
					</li>
					<li class="col-md-3 space-mobile">
						<div class="thumbnail">
							<img src="${pageContext.request.contextPath}/style/assets/img/people/img2-large.jpg" alt="">
							<h3>
								<a>Andres Iniesta</a> 
								<small>Chief Executive Officer / CEO</small>
							</h3>
							<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, justo sit amet risus etiam porta sem...</p>
							<ul class="social-icons social-icons-color">
								<li><a href="#" data-original-title="Facebook" class="facebook"></a></li>
								<li><a href="#" data-original-title="Twitter" class="twitter"></a></li>
								<li><a href="#" data-original-title="Goole Plus" class="googleplus"></a></li>
								<li><a href="#" data-original-title="Linkedin" class="linkedin"></a></li>
							</ul>
						</div>
					</li>
					<li class="col-md-3">
						<div class="thumbnail">
							<img src="${pageContext.request.contextPath}/style/assets/img/people/img5-large.jpg" alt="">
							<h3>
								<a>Jessica Alba</a> 
								<small>Chief Executive Officer / CEO</small>
							</h3>
							<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, justo sit amet risus etiam porta sem...</p>
							<ul class="social-icons social-icons-color">
								<li><a href="#" data-original-title="Facebook" class="facebook"></a></li>
								<li><a href="#" data-original-title="Twitter" class="twitter"></a></li>
								<li><a href="#" data-original-title="Goole Plus" class="googleplus"></a></li>
								<li><a href="#" data-original-title="Linkedin" class="linkedin"></a></li>
							</ul>
						</div>
					</li>
					-->
				</ul>            
			</div>
			<!-- END OUR TEAM -->
		</div>
		<!-- END CONTAINER -->

	</div>
    <!-- END PAGE CONTAINER -->  

	
	
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
    <!-- END CORE PLUGINS -->

    <!-- BEGIN PAGE LEVEL JAVASCRIPTS(REQUIRED ONLY FOR CURRENT PAGE) -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/assets/plugins/fancybox/source/jquery.fancybox.pack.js"></script>  
    <script src="${pageContext.request.contextPath}/style/assets/scripts/app.js"></script>  
    <script type="text/javascript">
        jQuery(document).ready(function() {
            App.init();                      
        });
    </script>
    <!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>