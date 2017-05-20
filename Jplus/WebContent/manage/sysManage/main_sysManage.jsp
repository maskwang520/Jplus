<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<c:if test="${sessionScope.user==null}">
	<jsp:forward page="/manage/login/login_sys.jsp"></jsp:forward>
</c:if>
<title>系统员管理页面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta content="width=device-width,initial-scale=1.0" name="viewport">
<script type="text/javascript"
	src="<%=path%>/style/bootstrap/jquery-1.11.3.min.js"></script>
<link href="<%=path%>/style/bootstrap/bootstrap.min.css"
	rel="stylesheet" />
<link href="<%=path%>/style/bootstrap/bootstrap-responsive.min.css"
	rel="stylesheet" />
<link href="<%=path%>/manage/jquerytable/jquery.dataTables.css" rel="stylesheet" />
<script type="text/javascript"
	src="<%=path%>/style/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/manage/jquerytable/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/style/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=path%>/manage/js/main_sys.js"></script>
<style type="text/css">
.modal input {
	height: 28px;
}
</style>
</head>
<body>
	<input type="hidden" name="id" value="${user.id}" id="userId" />
	<div class="navbar navbar-inverse">
		<div class="navbar-inner">
			<div class="container">
				<a class="brand"
					href="<%=path%>/manage/sysManage/main_sysManage.jsp">jplus系统员管理</a>
				<div class="nav-collapse collapse" style="margin-right: 25px;">
					<ul class="nav pull-right">
						<h5>
							<span class="text-info">欢迎</span> <span class="dropdown">
								<button id="dLabel" type="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false">
									${user.username} <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" aria-labelledby="dLabel">
									<li><a href="#myModal1" data-toggle="modal">查看信息</a></li>
									<li><a href="#myModal12" data-toggle="modal">修改密码</a></li>
									<li><a href="<%=path%>/login_out.do?method=sys">注销</a></li>
								</ul> </span>
						</h5>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="myModal1" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">用户基本信息查看</h3>
		</div>
		<div class="modal-body">
			<table class="table table-bordered">
				<tr>
					<td>用户名 ：</td>
					<td>${user.username}</td>
				</tr>
				<tr>
					<td>真实姓名：</td>
					<td>${user.realname}</td>
				</tr>
				<tr>
					<td>注册时间：</td>
					<td><fmt:formatDate value="${user.regtime}" /></td>
				</tr>
				<tr>
					<td>权限：</td>
					<td><c:if test="${user.limits==0}">普通用户</c:if> <c:if
							test="${user.limits==1}">VIP用户</c:if> <c:if
							test="${user.limits==2}">实验室成员</c:if> <c:if
							test="${user.limits==3}">网站管理员</c:if> <c:if
							test="${user.limits==4}">指导老师</c:if> <c:if
							test="${user.limits==5}">系统管理员</c:if></td>
				</tr>
				<tr>
					<td>用户级别：</td>
					<td>${user.userlevelId}</td>
				</tr>
			</table>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
		</div>
	</div>
	<div id="myModal12" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">密码修改</h3>
		</div>
		<div class="modal-body">
			<form id="form12" method="post">
				<table class="table table-bordered">
					<tr>
						<td>旧密码：</td>
						<td><input type="password" name="password11" id="pass1" /></td>
					</tr>
					<tr>
						<td>新密码：</td>
						<td><input type="password" name="password12" id="pass2" /></td>
					</tr>
					<tr>
						<td>确认密码：</td>
						<td><input type="password" name="password13" id="pass3" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
			<button type="button" class="btn btn-primary"
				onclick="form12submit()">修改</button>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span2">
				<div class="accordion" id="accordion2">
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" onclick="findAllUsers()"> <span
								class="icon-home"></span>&nbsp;&nbsp;用户管理 </a>
						</div>
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" onclick="findAllUsermsg()"><span
								class="icon-home"></span>&nbsp;&nbsp;用户信箱管理</a>
						</div>
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" onclick="findAllLevel()"><span
								class="icon-home"></span>&nbsp;&nbsp;积分等级管理</a>
						</div>
					</div>
					<!--  
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion2" href="#collapseOne"> <span
								class="icon-align-justify"></span>&nbsp;&nbsp;用户管理<span
								class="pull-right icon-chevron-down"></span> </a>
						</div>
						<div id="collapseOne" class="accordion-body collapse">
							<div class="accordion-inner">
								<ul class="nav nav-tabs">
									<li><a href="test1.html"><span class="icon-file"></span>&nbsp;&nbsp;会员用户管理</a>
									</li>
									<li><a href="test1.html"><span class="icon-file"></span>&nbsp;&nbsp;普通用户管理</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion2" href="#collapseTwo"> <span
								class="icon-align-justify"></span>&nbsp;&nbsp;资源路径管理<span
								class="pull-right icon-chevron-down"></span> </a>
						</div>
						<div id="collapseTwo" class="accordion-body collapse">
							<div class="accordion-inner">
								<ul class="nav nav-tabs">
									<li><a href="test1.html"><span class="icon-file"></span>&nbsp;&nbsp;视频路径管理</a>
									</li>
									<li><a href="test1.html"><span class="icon-file"></span>&nbsp;&nbsp;工具路径管理</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" href="main1.jsp"><span
								class="icon-home"></span>&nbsp;&nbsp;视频上传</a>
						</div>
					</div>
					-->
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" onclick="findALlMember()"><span
								class="icon-home"></span>&nbsp;&nbsp;成员管理</a>
						</div>
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" onclick="findAllIndentify()"><span
								class="icon-home"></span>&nbsp;&nbsp;认证管理</a>
						</div>
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" onclick="competitiomManage()"><span
								class="icon-home"></span>&nbsp;&nbsp;众筹赛场管理</a>
						</div>
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" onclick="closeWebnet()"><span
								class="icon-home"></span>&nbsp;&nbsp;封锁封锁网站</a>
						</div>
					</div>
				</div>
			</div>
			<div class="span10" style="height: 100%">
				<div id="showdata">
					<h3 align="center" style="margin-top: 250px;">
						<font face="楷体" size="15px">JplusOnline系统管理</font>
					</h3>
				</div>
			</div>
		</div>
	</div>
	<div id="myModal2" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">用户基本信息查看</h3>
		</div>
		<div class="modal-body">
			<table class="table table-bordered">
				<tr>
					<td>用户名 ：</td>
					<td id="usernameID"></td>
				</tr>
				<tr>
					<td>真实姓名 ：</td>
					<td id="realnameID"></td>
				</tr>
				<tr>
					<td>年龄：</td>
					<td id="ageID"></td>
				</tr>
				<tr>
					<td>性别：</td>
					<td id="sexID"></td>
				</tr>
				<tr>
					<td>出生日期：</td>
					<td id="birthdayID"></td>
				</tr>
				<tr>
					<td>证件号：</td>
					<td id="certsnumID"></td>
				</tr>
				<tr>
					<td>电话号码：</td>
					<td id="telephoneID"></td>
				</tr>
				<tr>
					<td>邮箱：</td>
					<td id="emailID"></td>
				</tr>
				<tr>
					<td>qq号：</td>
					<td id="qqID"></td>
				</tr>
				<tr>
					<td>住址：</td>
					<td id="addressID"></td>
				</tr>
				<tr>
					<td>爱好：</td>
					<td id="hobbyID"></td>
				</tr>
				<tr>
					<td>注册时间：</td>
					<td id="regtimeID"></td>
				</tr>
				<tr>
					<td>用户权限：</td>
					<td id="limitsID"></td>
				</tr>
				<tr>
					<td>认证类型：</td>
					<td id="identifysID"></td>
				</tr>
				<tr>
					<td>用户等级：</td>
					<td id="userlevelIdID"></td>
				</tr>
				<tr>
					<td>积分</td>
					<td id="scoresID"></td>
				</tr>
			</table>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
		</div>
	</div>
	<div id="myModal5" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">用户基本信息修改</h3>
		</div>
		<div class="modal-body">
			<form id="form5" method="post">
				<input type="hidden" name="id" id="id5" />
				<table class="table table-bordered">
					<tr>
						<td>用户名:</td>
						<td><input type="text" id="us5" name="username"></td>
					</tr>
					<tr>
						<td>真实姓名:</td>
						<td><input type="text" id="re5" name="realname"></td>
					</tr>
					<tr>
						<td>年龄:</td>
						<td><input type="text" id="ag5" name="age"
							onkeyup="checkRate(this.id)"></td>
					</tr>
					<tr>
						<td>性别:</td>
						<td><select name="sex" id="se5">
								<option value="0">男</option>
								<option value="1">女</option>
								<option value="2">未知</option>
						</select></td>
					</tr>
					<tr>
						<td>出生日期:</td>
						<td><input type="text" id="bi5" onclick="WdatePicker()"
							name="birthday" readonly="readonly"></td>
					</tr>
					<tr>
						<td>证件号(仅限身份证):</td>
						<td><input type="text" id="ce5" name="certsnum"></td>
					</tr>
					<tr>
						<td>电话号码:</td>
						<td><input type="text" id="te5" name="telephone"></td>
					</tr>
					<tr>
						<td>邮箱:</td>
						<td><input type="text" id="em5" name="email"></td>
					</tr>
					<tr>
						<td>qq号:</td>
						<td><input type="text" id="qq5" name="qq"></td>
					</tr>
					<tr>
						<td>住址:</td>
						<td><input type="text" id="ad5" name="address"></td>
					</tr>
					<tr>
						<td>爱好:</td>
						<td><input type="text" id="ho5" name="hobby" /></td>
					</tr>
					<tr>
						<td>注册时间:</td>
						<td><input type="text" id="reg5" name="regtime"
							onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
							readonly="readonly" /></td>
					</tr>
					<tr>
						<td>用户权限:</td>
						<td><select name="limits" id="li5">
								<option value="0">用户（信息不完整）</option>
								<option value="1">用户（信息完整）</option>
								<option value="2">实验室成员</option>
								<option value="3">网站管理员</option>
								<option value="4">指导老师</option>
								<option value="5">系统管理员</option>
						</select></td>
					</tr>
					<tr>
						<td>认证类型:</td>
						<td><select name="identifys" id="ide5" onchange="getMem()">
								<option value="0">非认证用户</option>
								<option value="1">实验室成员</option>
								<option value="-1">指导老师</option>
								<option value="-2">企业用户</option>
						</select>
						<span style="display: none;" id="span5">第<input type="text" id="mem5" width="25px" onkeyup="checkRate(this.id)">届实验室成员</span>
						</td>
					</tr>
					<tr>
						<td>用户等级:</td>
						<td><input type="text" name="userlevelId" id="usle5"
							onkeyup="checkRate(this.id)" />(1-10级)</td>
					</tr>
					<tr>
						<td>积分:</td>
						<td><input type="text" name="scores" id="sc5"
							onkeyup="checkRate(this.id)" />(0-100)</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary" onclick="form5submit()">保存</button>
		</div>
	</div>
	<div id="myModal3" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">用户信箱管理</h3>
		</div>
		<div class="modal-body">
			<input type="hidden" name="id" id="id3" />
			<form id="form3" method="post">
				<table class="table table-bordered">
					<tr>
						<td>信箱内容:</td>
						<td><input type="text" name="msgcontent" id="msg3" /></td>
					</tr>
					<tr>
						<td>已读标记:</td>
						<td><select name="readsign" id="res3">
								<option value="0">0：未读</option>
								<option value="1">1：已读</option>
						</select>
						</td>
					</tr>
					<tr>
						<td>发送方:</td>
						<td><input type="text" name="sendauthor" id="sea3" /></td>
					</tr>
					<tr>
						<td>发送日期:</td>
						<td><input type="text" name="gettime" id="get3"
							onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
							readonly="readonly" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary" onclick="form3submit()">保存</button>
		</div>
	</div>
	<div id="myModal4" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">用户积分等级管理</h3>
		</div>
		<div class="modal-body">
			<form id="form4" method="post">
				<input type="hidden" name="id" id="id4" />
				<table class="table table-bordered">
					<tr>

						<td>用户等级:</td>
						<td><select name="levels" id="lev4">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
						</select></td>
					</tr>
					<tr>
						<td>最低积分:</td>
						<td><input type="text" name="minscores" id="min4"
							onkeyup="checkRate(this.id)" /></td>
					</tr>
					<tr>
						<td>最高积分:</td>
						<td><input type="text" name="maxscores" id="max4"
							onkeyup="checkRate(this.id)" /></td>
					</tr>
					<tr>
						<td>等级描述:</td>
						<td><input type="text" name="descriptions" id="des4" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary" onclick="form4submit()">保存</button>
		</div>
	</div>

	<div id="myModal6" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">成员基本信息查看</h3>
		</div>
		<div class="modal-body">
			<table class="table table-bordered">
				<tr>
					<td>认证类型 ：</td>
					<td id="ide6"></td>
				</tr>
				<tr>
					<td>成员描述：</td>
					<td id="des6"></td>
				</tr>
				<tr>
					<td>简介类容：</td>
					<td id="con6"></td>
				</tr>
				<tr>
					<td>照片地址：</td>
					<td id="purl6"></td>
				</tr>
				<tr>
					<td>现今所在地：</td>
					<td id="nad6"></td>
				</tr>
				<tr>
					<td>现今工作：</td>
					<td id="nwo6"></td>
				</tr>
				<tr>
					<td>熟悉的领域：</td>
					<td id="kws6"></td>
				</tr>
				<tr>
					<td>专业技能：</td>
					<td id="ski6"></td>
				</tr>
				<tr>
					<td>教育背景：</td>
					<td id="edu6"></td>
				</tr>
				<tr>
					<td>职业经历：</td>
					<td id="wbk6"></td>
				</tr>
				<tr>
					<td>未来规划：</td>
					<td id="myp6"></td>
				</tr>
				<tr>
					<td>对师弟师妹的建议：</td>
					<td id="sug6"></td>
				</tr>
				<tr>
					<td>QQ：</td>
					<td id="qq6"></td>
				</tr>
				<tr>
					<td>电话：</td>
					<td id="tel6"></td>
				</tr>
				<tr>
					<td>常用邮箱号：</td>
					<td id="ema6"></td>
				</tr>
				<tr>
					<td>微信号：</td>
					<td id="wxh6"></td>
				</tr>
				<tr>
					<td>博客地址</td>
					<td id="blo6"></td>
				</tr>
				<tr>
					<td>敏感信息可见权限</td>
					<td id="vit6"></td>
				</tr>
				<tr>
					<td>个人网站地址</td>
					<td id="pesw6"></td>
				</tr>
				<tr>
					<td>认证时间</td>
					<td id="idt6"></td>
				</tr>
			</table>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
		</div>
	</div>
	<div id="myModal8" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">认证修改</h3>
		</div>
		<div class="modal-body">
			<form id="form8" method="post">
				<input type="hidden" name="id" id="id8" />
				<table class="table table-bordered">
					<tr>
						<td>成员姓名：</td>
						<td><input type="text" name="iname" id="iname8" /></td>
					</tr>
					<tr>
						<td>证件号：</td>
						<td><input type="text" name="certnum" id="certnum8" /></td>
					</tr>
					<tr>
						<td>实验室成员届数：</td>
						<td>第<input type="text" name="sessions" id="sessions8"
							width="15px;" onkeyup="checkRate(this.id)" />届成员</td>
					</tr>
					<tr>
						<td>职位：</td>
						<td><input type="text" name="positions" id="positions8" /></td>
					</tr>
					<tr>
						<td>描述：</td>
						<td><input type="text" name="descriptions" id="descriptions8" />
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary" onclick="form8submit()">保存</button>
		</div>
	</div>
	<div id="myModal7" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">才成员基本信息修好</h3>
		</div>
		<div class="modal-body">
			<form id="form7" method="post">
				<input type="hidden" name="id" id="id7" />
				<table class="table table-bordered">
					<tr>
						<td>成员描述：</td>
						<td><input type="text" name="descriptions" id="des7" /></td>
					</tr>
					<tr>
						<td>简介类容：</td>
						<td><input type="text" name="cotents" id="con7" /></td>
					</tr>
					<tr>
						<td>照片地址：</td>
						<td><input type="text" name="purl" id="purl7" /></td>
					</tr>
					<tr>
						<td>现今所在地：</td>
						<td><input type="text" name="nowaddress" id="nad7" /></td>
					</tr>
					<tr>
						<td>现今工作：</td>
						<td><input type="text" name="nowwork" id="nwo7" /></td>
					</tr>
					<tr>
						<td>熟悉的领域：</td>
						<td><input type="text" name="knowsphere" id="kws7" /></td>
					</tr>
					<tr>
						<td>专业技能：</td>
						<td><input type="text" name="skills" id="ski7" /></td>
					</tr>
					<tr>
						<td>教育背景：</td>
						<td><input type="text" name="educations" id="edu7" /></td>
					</tr>
					<tr>
						<td>职业经历：</td>
						<td><input type="text" name="workbk" id="wbk7" /></td>
					</tr>
					<tr>
						<td>未来规划：</td>
						<td><input type="text" name="myplan" id="myp7" /></td>
					</tr>
					<tr>
						<td>对师弟师妹的建议：</td>
						<td><input type="text" name="suggestions" id="sug7" /></td>
					</tr>
					<tr>
						<td>QQ：</td>
						<td><input type="text" name="qq" id="qq7" /></td>
					</tr>
					<tr>
						<td>电话：</td>
						<td><input type="text" name="telephone" id="tel7" /></td>
					</tr>
					<tr>
						<td>常用邮箱号：</td>
						<td><input type="text" name="email" id="ema7" /></td>
					</tr>
					<tr>
						<td>微信号：</td>
						<td><input type="text" name="weixinnum" id="wxh7" /></td>
					</tr>
					<tr>
						<td>博客地址</td>
						<td><input type="text" name="blogs" id="blo7" /></td>
					</tr>
					<tr>
						<td>敏感信息可见权限</td>
						<td><select name="viewtype" id="vit7">
								<option value="0">0：所有用户可见</option>
								<option value="1">1：Jplus实验室成员可见</option>
								<option value="2">2：管理员及指导老师可见</option>
								<option value="3">3：仅系统管理员可见</option>
								<option value="4">4：仅自己可见</option>
						</select>
						</td>
					</tr>
					<tr>
						<td>个人网站地址</td>
						<td><input type="text" name="pwurl" id="pesw7" /></td>
					</tr>
					<tr>
						<td>认证时间</td>
						<td><input type="text" name="indentifytime" id="idt7"
							onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
							readonly="readonly" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary" onclick="form7submit()">保存</button>
		</div>
	</div>

	<div id="myModal9" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">用户基本信息修好</h3>
		</div>
		<div class="modal-body">
			<form id="form9" method="post">
				<table class="table table-bordered">
					<tr>
						<td>成员姓名：</td>
						<td><input type="text" name="iname" id="iname9" /></td>
					</tr>
					<tr>
						<td>证件号：</td>
						<td><input type="text" name="certnum" id="certnum9" /></td>
					</tr>
					<tr>
						<td>实验室成员届数：</td>
						<td>第<input type="text" name="sessions" id="sessions9"
							width="15px;" onkeyup="checkRate(this.id)" />届成员</td>
					</tr>
					<tr>
						<td>职位：</td>
						<td><input type="text" name="positions" id="positions9" /></td>
					</tr>
					<tr>
						<td>描述：</td>
						<td><input type="text" name="descriptions" id="descriptions9" />
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary" onclick="form9submit()">保存</button>
		</div>
	</div>


	<div class="navbar" style="margin-bottom: 0px;">
		<div class="navbar-inner">
			<div class="container">
				<h4 align="center">
					<font face="楷体" size="2px">Jplus实验室提供技术支持</font>
					<h4>
			</div>
		</div>
	</div>
</body>
</html>
