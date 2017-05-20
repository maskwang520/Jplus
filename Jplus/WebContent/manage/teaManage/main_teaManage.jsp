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
	<jsp:forward page="/manage/login/login_mem.jsp"></jsp:forward>
</c:if>
<title>Jplus实验室指导老师</title>
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
<script type="text/javascript" src="<%=path%>/manage/js/main_tea.js"></script>
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
					href="<%=path%>/manage/teaManage/main_teaManage.jsp">jplus实验室指导老师</a>
				<div class="nav-collapse collapse" style="margin-right: 25px;">
					<ul class="nav pull-right">
						<h5>
							<span class="text-info">欢迎</span> <span class="dropdown">
								<button id="dLabel" type="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false">
									${user.username} <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" aria-labelledby="dLabel">
									<li><a href="#myModal11" data-toggle="modal">查看信息</a></li>
									<li><a href="#myModal12" data-toggle="modal">密码修改</a></li>
									<li><a href="<%=path%>/login_out.do?method=mem">注销</a></li>
								</ul> </span>
						</h5>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="myModal11" class="modal hide fade" tabindex="-1" role="dialog"
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
					<td>用户等级：</td>
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
						<td><input type="password" name="password11" id="pass1" />
						</td>
					</tr>
					<tr>
						<td>新密码：</td>
						<td><input type="password" name="password12" id="pass2" />
						</td>
					</tr>
					<tr>
						<td>确认密码：</td>
						<td><input type="password" name="password13" id="pass3" />
						</td>
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
							<a class="accordion-toggle" onclick="findUser()"> <span
								class="icon-home"></span>&nbsp;&nbsp;个人资料</a>
						</div>
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" onclick="addWorknwe()"><span
								class="icon-home"></span>&nbsp;&nbsp;发布招聘消息</a>
						</div>
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" onclick="findAllCommication()"><span
								class="icon-home"></span>&nbsp;&nbsp;jplus通讯录查看</a>
						</div>
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" onclick="findSystemmanage()"><span
								class="icon-home"></span>&nbsp;&nbsp;联系系统管理员</a>
						</div>
					</div>
				</div>
			</div>
			<div class="span10" style="height: 100%">
				<div id="showdata">
					<h3 align="center" style="margin-top: 250px;">
						<font face="楷体" size="15px">JplusOnline实验室指导老师管理</font>
					</h3>
				</div>
			</div>
		</div>
	</div>

	<div id="myModalianxi" class="modal hide fade" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">联系系统管理员</h3>
		</div>
		<div class="modal-body">
			<label>管理员1：</label><p class="text-info">姓名：曹辉，电话：15572934593，QQ：1747128171；邮箱：chitry@126.com；</p>
			<label>管理员2：</label><p class="text-info">姓名：胡开才，电话：13117011726，QQ：940388651；邮箱：940388651@qq.com；</p>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		</div>
	</div>

	<div id="myModal2" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">基本资料修改(如实填写)</h3>
		</div>
		<div class="modal-body">
			<form id="form2" method="post">
				<input type="hidden" name="id" id="id2" />
				<table class="table table-bordered">
					<tr>
						<td>真实姓名:</td>
						<td><input type="text" id="re2" name="realname"></td>
					</tr>
					<tr>
						<td>年龄:</td>
						<td><input type="text" id="ag2" name="age"
							onkeyup="checkRate(this.id)"></td>
					</tr>
					<tr>
						<td>性别:</td>
						<td><select name="sex" id="se2">
								<option value="0">男</option>
								<option value="1">女</option>
								<option value="2">未知</option>
						</select></td>
					</tr>
					<tr>
						<td>证件号（仅限身份证号）:</td>
						<td><input type="text" id="cen2" name="birthday"></td>
					</tr>
					<tr>
						<td>出生日期:</td>
						<td><input type="text" id="bi2" onclick="WdatePicker()"
							name="birthday" readonly="readonly"></td>
					</tr>
					<tr>
						<td>电话号码:</td>
						<td><input type="text" id="te2" name="telephone"></td>
					</tr>
					<tr>
						<td>邮箱（常用邮箱）:</td>
						<td><input type="text" id="em2" name="email"></td>
					</tr>
					<tr>
						<td>qq号:</td>
						<td><input type="text" id="qq2" name="qq"></td>
					</tr>
					<tr>
						<td>住址:</td>
						<td><input type="text" id="ad2" name="address"></td>
					</tr>
					<tr>
						<td>爱好:</td>
						<td><input type="text" id="ho2" name="hobby" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary" onclick="form2submit()">保存</button>
		</div>
	</div>

	<div class="navbar navbar-default navbar-fixed-bottom"
		style="height: 28px;">
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
