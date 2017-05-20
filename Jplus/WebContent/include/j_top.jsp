<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        
    <!-- BEGIN HEADER -->
    <div class="header navbar navbar-default navbar-static-top">
		<div class="container">
			<div class="navbar-header">
				<!-- BEGIN RESPONSIVE MENU TOGGLER -->
				<button class="navbar-toggle btn navbar-btn" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<!-- END RESPONSIVE MENU TOGGLER -->
				<!-- BEGIN LOGO (you can use logo image instead of text)-->
				<a class="navbar-brand logo-v1" href="${pageContext.request.contextPath}/index.jsp" style="font-family:楷体; font-size: 30px;color:#fff;">
					Jplus在线<br/><div style="text-align:right;"><font size="2px;">www.jplus.online</font></div>
				</a>
				<!-- END LOGO -->
			</div>
		
            <!-- BEGIN TOP NAVIGATION MENU -->
            <div class="navbar-collapse collapse" style="color:#fff;">
                <ul class="nav navbar-nav" style="color:#fff;">   
                    <li><a href="${pageContext.request.contextPath}/index.jsp" >首页</a></li>
					<li><a href="${pageContext.request.contextPath}/getMemberAll.do?sessionid=4" >团队简介</a></li>
					<li><a href="${pageContext.request.contextPath}/InitList.do" >Jplus学院</a></li>
					<li><a href="${pageContext.request.contextPath}/ziyuan/findres.do" >资源共享</a></li>
					<li><a href="http://bbs.jplus.online" target="_blank">开发者论坛</a></li>
					<li><a href="javascript:alert('相关功能正在进行开发，敬请期待！');" >众筹赛场</a></li>
					<li><a href="${pageContext.request.contextPath}/getUserJtask.do?pageNo=0" >Jplus常务大厅</a></li>
                    <li class="menu-search">
                        <span class="sep"></span>
                        <i class="fa fa-search search-btn"></i>

                        <div class="search-box">
                            <form action="#">
                                <div class="input-group input-large">
                                    <input class="form-control" type="text" placeholder="Search">
                                    <span class="input-group-btn">
                                        <button type="submit" class="btn theme-btn">Go</button>
                                    </span>
                                </div>
                            </form>
                        </div> 
                        <span></span>
                        <c:if test="${empty loginuser.username}">
                     <li ><a href="${pageContext.request.contextPath}/include/j_login.jsp">登陆</a></li>
                    <!--  <li class="sep"><span>|</span></li> -->
                     <li><a href="${pageContext.request.contextPath}/include/j_register.jsp">注册</a></li>
                     
                       </c:if>
                        <c:if test="${!empty loginuser.username}">
                         <li><a href="${pageContext.request.contextPath}/include/j_usermsg.jsp">${loginuser.username}</a><li>
                         <li><a href="${pageContext.request.contextPath}/destroyUser.do">注销</a></li>
                         
                        </c:if>
                       
                </ul>                           
            </div>
            <!-- BEGIN TOP NAVIGATION MENU -->
		</div>
    </div>
    <!-- END HEADER -->