<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户登录</title>
<meta content="width=device-width,initial-scale=1.0" name="viewport">
<script type="text/javascript"
	src="<%=path%>/style/bootstrap/jquery-1.11.3.min.js"></script>
<link href="<%=path%>/style/bootstrap/bootstrap.min.css" rel="stylesheet" />
<link href="<%=path%>/style/bootstrap/bootstrap-responsive.min.css"
	rel="stylesheet" />
<script type="text/javascript" src="<%=path%>/style/bootstrap/bootstrap.min.js"></script>
<style type="text/css">
body {
	background-image: url(<%=path %>/style/images/images-manage/login.jpg);
}

fieldset {
	border: 1px solid #61B5CF;
	width: 500px;
}

legend {
	color: black;
}
</style>
</head>
<body>
	<div class="container">
	<div style="margin-top: 200px;margin-left: 300px;">
		<fieldset>
			<legend>JplusOnline系统管理</legend>
			<form class="form-horizontal" action="<%=path %>/login_manage.do" method="post">
				<div class="control-group">
					<label class="control-label" for="username"><span class="text-info">用户名</span> </label>
					<div class="controls">
						<input type="text" id="username" name="username" placeholder="用户名">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="inputPassword"><span class="text-info">密码</span> </label>
					<div class="controls">
						<input type="password" id="inputPassword" name="password" placeholder="密码">
					</div>
				</div>
				<div>
					<p class="text-error" style="margin-left: 180px">${requestScope.message }</p>
				</div>
				<div class="control-group">
					<div class="controls">
						<label class="radio inline"> <input type="radio" name="limit" value="5" checked="checked"> 系统管理员</label> 
						<label class="radio inline"> <input type="radio" name="limit" value="3"> 网站管理员</label>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<button type="reset" class="btn btn-primary">重置</button>
						<button type="submit" class="btn btn-primary" style="margin-left:65px;">登录</button>
					</div>
				</div>
			</form>
		</fieldset>
	</div>
	</div>
</body>
</html>