<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<style>
            .state1{
                color:#aaa;
            }
            .state2{
                color:#000;
            }
            .state3{
                color:blue;
            }
            .state4{
                color:green;
            }
        </style>
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
<script type="text/javascript"
	src="<%=request.getContextPath()%>/style/jquery/jquery-1.8.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/style/scripts/scripts_jws/data.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/style/scripts/scripts_jws/jsAddress.js"></script>
<script type="text/javascript">
    function changeyzm() {
        var contextPath = document.getElementById("contextPath").value;
        document.getElementById("verify_img").src = contextPath+"/RandomCodeServlet?"+Math.random();
    }
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/style/scripts/scripts_modify/modify.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/style/scripts/scripts_jusermsg/juermsg.js"></script>

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
<body class="page-header-fixed">

<c:import url="/include/j_top.jsp" />


<div class="page-container"><!-- BEGIN BREADCRUMBS -->
<div class="row breadcrumbs margin-bottom-40">
<div class="container">
<div class="col-md-4 col-sm-4">
<h1>用户信息</h1>
</div>
<div class="col-md-8 col-sm-8">
<ul class="pull-right breadcrumb">
	<li><a href="index.html">Jplus在线</a></li>
	<li><a href="">Web页</a></li>
	<li class="active">用户信息</li>
</ul>
</div>
</div>
</div>
<!-- END BREADCRUMBS --> <!-- BEGIN CONTAINER -->
<div class="container min-hight margin-bottom-40">
<div class="row">
<div class="col-md-3">
<ul class="ver-inline-menu tabbable margin-bottom-10">
	<li class="active"><a data-toggle="tab" href="#tab_1"> <!-- tab_1的标题 -->
	基本信息 </a> <span class="after"></span></li>
	<li><a data-toggle="tab" href="#tab_2">我的信箱(未读)</a></li>
	<li><a data-toggle="tab" href="#tab_6">我的信箱(已读)</a></li>
	<!--<c:if test="${loginuser.identifys==0}">-->
	<li><a data-toggle="tab" href="#tab_3">详细信息</a></li>
	<!--</c:if>	-->
	<li><a data-toggle="tab" href="#tab_4">修改密码</a></li>
	<li><a data-toggle="tab" href="#tab_5">认证信息</a></li>

</ul>
</div>

<div class="col-md-9"><!-- BEGIN TAB CONTENT -->
<div class="tab-content"><!-- tab_1的信息 -->

<div id="tab_1" class="tab-pane active">
<div id="accordion1" class="panel-group">
<div class="panel panel-primary">
<div class="panel-heading">
<h3 class="panel-title">我的基本信息</h3>
</div>
<div class="panel-body">
<form role="form">
<div class="form-body">
<div class="form-group"><label>认证信息：</label> <input
	style="color: blue;" type="text" readonly="readonly"
	class="form-control input-lg"
	value="<c:choose><c:when test="${loginuser.identifys==-3}">认证用户</c:when><c:when test="${loginuser.identifys==0}">非认证用户</c:when><c:when test="${loginuser.identifys==-1}">实验室指导老师</c:when><c:when test="${loginuser.identifys==-2}">企业用户</c:when><c:otherwise>第${loginuser.identifys}届实验室成员</c:otherwise></c:choose>">
<br />
<c:if test="${loginuser.identifys==0}">
	<a data-toggle="tab" href="#renzheng" class="btn green">马上认证</a>
</c:if> <c:if test="${loginuser.identifys!=0}">
	<a data-toggle="tab"
		onclick="javascript:alert('即将登陆Jplus后台系统进行认证信息修改');"
		href="${pageContext.request.contextPath }/manage/login/login_mem.jsp"
		target="_blank" class="btn green">修改认证信息</a>
</c:if></div>
<div class="form-group"><label>权限等级：</label> <input type="text"
	readonly="readonly" class="form-control input-lg"
	value="<c:choose><c:when test="${loginuser.limits==0}">已注册用户</c:when><c:when test="${loginuser.limits==1}">普通用户</c:when><c:when test="${loginuser.limits==2}">实验室成员</c:when><c:when test="${loginuser.limits==3}">网站管理员</c:when><c:when test="${loginuser.limits==4}">指导老师</c:when><c:when test="${loginuser.limits==5}">系统管理员</c:when></c:choose>">
</div>
<div class="form-group"><label>账户等级：</label> <input
	style="color: red;" type="text" readonly="readonly"
	class="form-control input-lg"
	value="${userLevel.levels}级(${userLevel.descriptions})             ->  ${levelmsg}">
</div>
<div class="form-group"><label>注册时间：</label> <input type="text"
	readonly="readonly" class="form-control input-lg"
	value="<fmt:formatDate value='${loginuser.regtime}' type="both"/>">
</div>
</div>
</form>
</div>
</div>
<!-- BLOCK END --></div>
</div>

<div id="tab_2" class="tab-pane">
<div id="accordion2" class="panel-group"><a name="#tab_2"></a> <c:if
	test="${ empty userMsgNotReadList}">
	<div class="row">
	<div class="col-md-7 col-md-offset-2 col-sm-6 col-sm-offset-5 ">
	<form action="../index.jsp" method="post">
	<h2>温馨提示</h2>
	<hr>
	<div class="input-group margin-bottom-20" style="text-align: center;">
	<span class="input-group-addon"><i class="fa fa-lock"></i></span> <font
		face="楷书" color="red" size="3px"><span id="resultofpasw">未读信箱中暂时没有任何邮件！</span></font>
	</div>
	<br />
	<br />
	<hr>
	<div class="row">
	<div style="text-align: center; color: blue; width: 100%;"><a
		data-toggle="tab" href="#tab_6"> 点击查看已读信箱 </a></div>
	</div>
	</form>
	</div>
	</div>
</c:if> <c:forEach items="${userMsgNotReadList}" var="msg">
	<div class="panel panel-warning">
	<div class="panel-heading">
	<h4 class="panel-title"><a class="accordion-toggle"
		data-toggle="collapse" data-parent="#accordion2"
		href="#accordion2_${msg.id}"> ${msg.sendauthor}</a></h4>
	</div>
	<div id="accordion2_${msg.id}" class="panel-collapse">
	<div class="panel-body">
	<p>${msg.msgcontent}&nbsp;&nbsp;<a
		href="${pageContext.request.contextPath}/isRead.do?pageno1=${pageno1}&pageno2=${pageno2}&id=${msg.id}&flag=0">&nbsp;&nbsp;设为已读</a></p>
	</div>
	</div>
	</div>
</c:forEach></div>
</div>



<div id="tab_6" class="tab-pane">
<div id="accordion2" class="panel-group"><a name="#tab_6"></a><c:if
	test="${ empty userMsgReadList}">
	<div class="row">
	<div class="col-md-7 col-md-offset-2 col-sm-6 col-sm-offset-5 ">
	<form action="../index.jsp" method="post">
	<h2>温馨提示</h2>
	<hr>
	<div class="input-group margin-bottom-20" style="text-align: center;">
	<span class="input-group-addon"><i class="fa fa-lock"></i></span> <font
		face="楷书" color="red" size="3px"><span id="resultofpasw">已读信箱中暂时没有任何邮件！</span></font>
	</div>
	<br />
	<br />
	<hr>
	<div class="row">
	<div style="text-align: center; color: blue; width: 100%;"><a
		data-toggle="tab" href="#tab_2"> 点击查看未读信箱 </a></div>
	</div>
	</form>
	</div>
	</div>
</c:if> <c:forEach items="${userMsgReadList}" var="msg">
	<div class="panel panel-warning">
	<div class="panel-heading">
	<h4 class="panel-title"><a class="accordion-toggle"
		data-toggle="collapse" data-parent="#accordion2"
		href="#accordion2_${msg.id}"> ${msg.sendauthor}</a></h4>
	</div>
	<div id="accordion2_${msg.id}" class="panel-collapse collapse">
	<div class="panel-body">
	<p>${msg.msgcontent}</p>
	</div>
	</div>
	</div>
</c:forEach></div>
</div>


<!-- tab_3的信息 -->


<div id="tab_3" class="tab-pane">
<div id="accordion3" class="panel-group">
<div class="panel panel-info">
<div class="panel-heading">
<h3 class="panel-title">我的详细信息(完善信息可以获得积分)</h3>
</div>
<div class="panel-body">
<form class="form-horizontal" role="form"
	action="${pageContext.request.contextPath}/updateUser.do" method="get"
	id="tab_3form">
<div class="form-body">
<div class="form-group"><input type="hidden" id="contextPath"
	value="<%=request.getContextPath() %>"> <label
	class="col-md-3 control-label">用户名</label>
<div class="col-md-9"><input type="text" class="form-control"
	id="wukuan" readonly="ture" name="username"
	value="${loginuser.username}"></div>
</div>
<div class="form-group"><label class="col-md-3 control-label">邮箱</label>
<div class="col-md-9">
<div class="input-group"><span class="input-group-addon"><i
	class="fa fa-envelope-o"></i></span> <input type="email" class="form-control"
	id="wukuan" readonly="ture" name="email" value="${loginuser.email}">
</div>
</div>
</div>
<div class="form-group"><label class="col-md-3 control-label">真实姓名</label>
<div class="col-md-9">
<div class="input-group"><input type="text" class="form-control"
	id="realname" name="realname" onblur="checkrealnamenull()"> <span
	style="color: red;" class="realname">*请填写你的真实姓名</span> <span
	class="input-group-addon"><i class="fa fa-user"></i></span></div>
</div>
</div>

<div class="form-group"><label class="col-md-3 control-label">证件号码</label>
<div class="col-md-9">
<div class="input-icon"><i class="fa fa-bell"></i> <input
	type="text" class="form-control" id="certificate" name="certsnum"></br>
<span style="color: red;" class="certify">*目前仅限身份证号</span></div>
</div>
</div>

<div class="form-group"><label class="col-md-3 control-label">年龄</label>
<div class="col-md-9">
<div class="input-icon right"><i class="fa fa-microphone"></i> <input
	type="text" class="form-control" name="age" id="age"> <span
	style="color: red;" class="age">请填入合适的数字</span></div>
</div>
</div>

<div class="form-group"><label class="col-md-3 control-label">QQ</label>
<div class="col-md-9">
<div class="input-icon right"><i class="fa fa-microphone"></i> <input
	type="text" class="form-control" name="qq" onblur="checkqqnull()"
	id="qq"> <span style="color: red;" class="qq">不能为空</span></div>
</div>
</div>

<div class="form-group"><label class="col-md-3 control-label">电话</label>
<div class="col-md-9">
<div class="input-icon right"><i class="fa fa-microphone"></i> <input
	type="text" class="form-control" name="telephone" id="telephone"
	onblur="checktelephone()"> <span style="color: red;"
	class="telephone1">请输入正确的电话号码</span></div>
</div>
</div>

<div class="form-group"><label class="col-md-3 control-label">权限</label>
<div class="col-md-9">
<div class="input-icon right"><i class="fa fa-microphone"></i> <input
	type="text" class="form-control" readonly="ture"
	value="<c:choose><c:when test="${loginuser.limits==0}">已注册用户</c:when><c:when test="${loginuser.limits==1}">普通用户</c:when><c:when test="${loginuser.limits==2}">实验室成员</c:when><c:when test="${loginuser.limits==3}">网站管理员</c:when><c:when test="${loginuser.limits==4}">指导老师</c:when><c:when test="${loginuser.limits==5}">系统管理员</c:when></c:choose>">
</div>
</div>
</div>

<div class="form-group"><label class="col-md-3 control-label">认证类型</label>
<div class="col-md-9">
<div class="input-icon right"><i class="fa fa-microphone"></i> <input
	type="text" class="form-control" readonly="ture" name="qxlx"
	value="<c:choose><c:when test="${loginuser.limits==0}">非认证用户</c:when><c:when test="${loginuser.limits==-1}">实验室指导老师</c:when><c:when test="${loginuser.limits==-2}">企业用户</c:when><c:otherwise>第${loginuser.limits}届实验室成员</c:otherwise></c:choose>">
</div>
</div>
</div>

<div class="form-group"><label class="col-md-3 control-label">用户级别</label>
<div class="col-md-9">
<div class="input-icon right"><i class="fa fa-microphone"></i> <input
	type="text" class="form-control" readonly="ture" name="userlevel"
	value="${userLevel.levels}"></div>
</div>
</div>
<div class="form-group"><label class="col-md-3 control-label">出生年月</label>
<div class="col-md-2"><select class="form-control" name="year"
	id="birth_year" onchange="setDays(this,birth_month,birth_day);">
	<option value="">年</option>
</select></div>

<div class="col-md-2"><select class="form-control" name="month"
	id="birth_month" onchange="setDays(birth_year,this,birth_day);">
	<option value="">月</option>
</select></div>

<div class="col-md-2"><select class="form-control" name="day"
	id="birth_day">
	<option value="">日</option>
</select></div>
</div>

<div class="form-group"><label class="col-md-3 control-label">地址</label>
<div class="col-md-2"><select class="form-control" name="province"
	id="province">
</select></div>

<div class="col-md-2"><select class="form-control" name="city"
	id="city">
</select></div>
<div class="col-md-2"><select class="form-control" name="county"
	id="county">

</select></div>
</div>
<div class="form-group"><label class="col-md-3 control-label">爱好
</label>
<div class="col-md-9">
<div class="checkbox-list">
<table>
	<tr>
		<td><input type="checkbox" name="1" value="Java">Java</td>
		<td><input type="checkbox" value="C" name="1">C</td>
		<td><input type="checkbox" value="C++" name="1">C++</td>
	</tr>
	<tr>
		<td><input type="checkbox" name="1" value="C#">C#</td>
		<td><input type="checkbox" value="Html" name="1">Html</td>
		<td><input type="checkbox" value="Python" name="1">Python</td>
	</tr>
	<tr>
		<td><input type="checkbox" name="1" value="ASP.Net">ASP.Net</td>
		<td><input type="checkbox" value="PHP" name="1">PHP</td>
		<td><input type="checkbox" value="JSP" name="1">JSP</td>
	</tr>
	<tr>
		<td><input type="checkbox" value="Ruby" name="1">Ruby</td>
		<td><input type="checkbox" value="Objective-C" name="1">Objective-C</td>
		<td><input type="checkbox" value="Visual Basic" name="1">Visual
		Basic</td>
	</tr>
	<tr>
		<td><input type="checkbox" value="JavaScript" name="1">JavaScript</td>
		<td><input type="checkbox" value="Perl" name="1">Perl</td>
		<td><input type="checkbox" value="PL/SQL" name="1">PL/SQL</td>
	</tr>
	<tr>
		<td><input type="checkbox" name="1" value="Pascal">Pascal</td>
		<td><input type="checkbox" value="Ada" name="1">Ada</td>
		<td><input type="checkbox" value="Transact-SQL" name="1">Transact-SQL</td>
	</tr>
	<tr>
		<td><input type="checkbox" name="1" value="Logo">Logo</td>
		<td><input type="checkbox" value="ActionScript" name="1">ActionScript</td>
		<td><input type="checkbox" value="Lua" name="1">Lua</td>
	</tr>
	<tr>
		<td><input type="checkbox" name="1" value="SAS">SAS</td>
		<td><input type="checkbox" value="MATLAB" name="1">MATLAB</td>
		<td><input type="checkbox" value="Go" name="1">Go</td>
	</tr>
	<tr>
		<td><input type="checkbox" value="Groovy" name="1">Groovy</td>
		<td><input type="checkbox" value="Prolog" name="1">prolog</td>
		<td><input type="checkbox" value="Scheme" name="1">Scheme</td>
	</tr>
	<tr>
		<td><input type="checkbox" value="R" name="1">R</td>
		<td><input type="checkbox" value="F#" name="1">F#</td>
		<td><input type="checkbox" value="批处理" name="1">批处理</td>
	</tr>
	<tr>
		<td colspan="3">Other:<input type="text" id="b" name="other"><span
			class="warning"> *上面没有，我要自己添加</span></td>
	</tr>
</table>
</div>
</div>
</div>

<div class="form-group"><label class="col-md-3 control-label">性别</label>
<div class="col-md-9">
<div class="radio-list"><label> <input type="radio"
	value="0" name="sex" checked> 男 &nbsp;&nbsp;&nbsp;&nbsp; <input
	type="radio" name="sex" value="1" value="option2">女 </label></div>
</div>
</div>

<div class="form-group"><label class="col-md-3 control-label">验证码
</label>
<div class="col-md-9"><input type="password"
	class="form-control spinner" id="ws1" name="yzm"><span>${infoMessage}</span><br />
<img src="${pageContext.request.contextPath }/RandomCodeServlet"
	alt='验证码' id='verify_img'> <a class="warning-word"
	onclick="changeyzm()" href="javascript:void(0)">看不清楚？换一张</a></div>
</div>
</div>

<div class="form-actions fluid">
<div class="col-md-offset-3 col-md-9">
<button type="submit" class="btn green" id="qrwsxx">确认完善信息</button>
<button type="reset" class="btn default">取消操作</button>
</div>
</div>
</form>
</div>
</div>
<!-- BLOCK END --></div>
</div>




<!-- tab_4的信息 -->


<div id="tab_4" class="tab-pane">
<div id="accordion1" class="panel-group">
<div class="panel panel-success">
<div class="panel-heading">
<h3 class="panel-title">修改密码</h3>
</div>
<div class="panel-body">
<form action="${pageContext.request.contextPath}/modifyUserPass.do"
	method="get" id="xgform">
<div class="form-body">
<div class="form-group has-success"><label class="control-label"
	for="inputSuccess"> 旧密码</label> <input type="password" class="form-control"
	id="old" name="oldpass"/><span id="oldspan">${passerror}</span></div>
<div class="form-group has-success"><label class="control-label"
	for="inputSuccess"> 新密码</label> <input type="password" class="form-control"
	id="new" name="newpass"><span id="newspan">密码应该为6-20位之间</span></div>
<div class="form-group has-success"><label class="control-label"
	for="inputSuccess"> 确认密码</label> <input type="password"
	class="form-control" id="renew" name="renewpass"><span id="renewspan">请再次确认新密码</span></div>
</div>
<div class="form-actions">
<button type="reset" class="btn default">取消</button>
<button type="submit" class="btn red" id="qrxg">确认修改</button>
</div>
</form>
</div>
</div>
<!-- BLOCK END --></div>
</div>




<!-- tab_5的信息 -->
<div id="tab_5" class="tab-pane">
<div id="accordion2" class="panel-group"><a name="#tab_5"></a><c:if
	test="${ empty userMsgReadList}">
	<div class="row">
	<div class="col-md-7 col-md-offset-2 col-sm-6 col-sm-offset-5 ">
	<form action="../index.jsp" method="post">
	<h2>温馨提示</h2>
	<hr>
	<div class="input-group margin-bottom-20" style="text-align: center;">
	<span class="input-group-addon"><i class="fa fa-lock"></i></span> <font
		face="楷书" color="red" size="3px"><span id="resultofpasw">
	<c:if test="${loginuser.identifys==0}">
		<a data-toggle="tab" href="#renzheng" class="btn green">对不起，您还没有进行认证，马上认证？</a>
	</c:if> <c:if test="${loginuser.identifys!=0}">
		<a data-toggle="tab"
			onclick="javascript:alert('即将登陆Jplus后台系统进行认证信息修改');"
			href="${pageContext.request.contextPath }/manage/login/login_mem.jsp"
			target="_blank" class="btn green">您已经通过认证，修改认证信息？</a>
	</c:if> </span></font></div>
	<br />
	<br />
	<hr>
	<div class="row"></div>
	</form>
	</div>
	</div>
</c:if></div>
</div>





<!--认证信息页面-->

<div id="renzheng" class="tab-pane">
<div id="accordion1" class="panel-group">
<div class="panel panel-info">
<div class="panel-heading"><a name="#renzheng"></a>
<h3 class="panel-title">Jplus在线认证界面</h3>
</div>
<div class="panel-body">
<form class="form-horizontal"
	action="${pageContext.request.contextPath}/uploadfiles.do"
	method="post" enctype="multipart/form-data" id="formrz">

<div class="form-group"><label class="control-label col-md-3">个人简介
</label>
<div class="col-md-9"><textarea name="cotents"
	data-provide="markdown" rows="10" data-width="400" class="form-control"></textarea>
<span class="help-block"> 请认证填写信息 </span></div>
</div>

<!--<div class="form-group has-warning"><label
	class="col-md-4 control-label" for="inputWarning">个人简介 </label>
<div class="col-md-8">
<div class="input-icon right"><i class="fa fa-warning tooltips"
	data-original-title="please provide an email" data-container="body"></i>
<input type="text" class="form-control" name="cotents"></div>
</div>
</div>



-->
<div class="form-group"><label class="col-md-3 control-label"
	for="inputSuccess">现今居住地 </label>
<div class="col-md-9">
<div class="input-icon right"><input type="text"
	class="form-control" name="nowaddress"></div>
</div>
</div>


<div class="form-group"><label class="col-md-3 control-label"
	for="inputSuccess">现今工作 </label>
<div class="col-md-9">
<div class="input-icon right"><input type="text"
	class="form-control" name="nowwork"></div>
</div>
</div>


<div class="form-group"><label class="control-label col-md-3">未来规划
</label>
<div class="col-md-9"><textarea name="myplan"
	data-provide="markdown" rows="10" data-width="400" class="form-control"></textarea>
<span class="help-block"> 请认证填写信息 </span></div>
</div>
<!--<div class="form-group has-warning"><label
	class="col-md-4 control-label" for="inputWarning">未来规划 </label>
<div class="col-md-8">
<div class="input-icon right"><i class="fa fa-warning tooltips"
	data-original-title="please provide an email" data-container="body"></i>
<input type="text" class="form-control" name="myplan"></div>
</div>
</div>

-->
<div class="form-group"><label class="col-md-3 control-label"
	for="inputSuccess">熟悉的领域 </label>
<div class="col-md-9">
<div class="input-icon right"><input type="text"
	class="form-control" name="knowsphere"></div>
</div>
</div>


<div class="form-group"><label class="col-md-3 control-label"
	for="inputSuccess">专业技能 </label>
<div class="col-md-9">
<div class="input-icon right"><input type="text"
	class="form-control" name="skills"></div>
</div>
</div>


<div class="form-group"><label class="col-md-3 control-label"
	for="inputSuccess">教育背景 </label>
<div class="col-md-9">
<div class="input-icon right"><input type="text"
	class="form-control" name="educations"></div>
</div>
</div>


<div class="form-group"><label class="control-label col-md-3">职业经历
</label>
<div class="col-md-9"><textarea name="workbk"
	data-provide="markdown" rows="10" data-width="400" class="form-control"></textarea>
<span class="help-block"> 请认证填写信息 </span></div>
</div>

<!--<div class="form-group"><label class="col-md-4 control-label"
	for="inputSuccess">职业经历 </label>
<div class="col-md-8">
<div class="input-icon right"><input type="text"
	class="form-control" name="workbk"></div>
</div>
</div>


-->

<div class="form-group"><label class="control-label col-md-3">对师弟师妹的建议
</label>
<div class="col-md-9"><textarea name="suggestions"
	data-provide="markdown" rows="10" data-width="400" class="form-control"></textarea>
<span class="help-block"> 请认证填写信息 </span></div>
</div>
<!--<div class="form-group"><label class="col-md-4 control-label"
	for="inputSuccess">对师弟师妹的建议 </label>
<div class="col-md-8">
<div class="input-icon right"><input type="text"
	class="form-control" name="suggestions"></div>
</div>
</div>
-->
<br/><br/>
<br/><fieldset style="text-align:center;border:5px soild #000;">
<legend>重要通讯信息</legend>
<div class="form-group"><label class="col-md-3 control-label"
	for="inputSuccess">qq </label>
<div class="col-md-9">
<div class="input-icon right"><input type="text"
	class="form-control" name="qq"></div>
</div>
</div>


<div class="form-group"><label class="col-md-3 control-label"
	for="inputSuccess">电话 </label>
<div class="col-md-9">
<div class="input-icon right"><input type="text"
	class="form-control" name="telephone"></div>
</div>
</div>



<div class="form-group"><label class="col-md-3 control-label"
	for="inputSuccess">常用邮箱号 </label>
<div class="col-md-9">
<div class="input-icon right"><input type="text"
	class="form-control" name="email"></div>
</div>
</div>


<div class="form-group"><label class="col-md-3 control-label"
	for="inputSuccess">微信号 </label>
<div class="col-md-9">
<div class="input-icon right"><input type="text"
	class="form-control" name="weixinnum"></div>
</div>
</div>
<span class="help-block"> 以上4条敏感通讯数据不会公开，仅将写入Jplus通讯录，请放心填写。 </span>
</fieldset>
<br/><br/>
<div class="form-group"><label class="col-md-3 control-label"
	for="inputSuccess">微博地址 </label>
<div class="col-md-9">
<div class="input-icon right"><input type="text"
	class="form-control" name="weixinnum"></div>
</div>
</div>

<div class="form-group"><label class="col-md-3 control-label"
	for="inputSuccess">博客地址 </label>
<div class="col-md-9">
<div class="input-icon right"><input type="text"
	class="form-control" name="blogs"></div>
</div>
</div>

<div class="form-group"><label class="col-md-3 control-label"
	for="inputSuccess">个人网站地址 </label>
<div class="col-md-9">
<div class="input-icon right"><input type="text"
	class="form-control" name="pwurl"></div>
</div>
</div>


<div class="form-group"><label class="col-md-3 control-label">上传照片</label>
<div class="col-md-9"><input type="file" name="file" id="photo1" />
<span style="color:red;" id="uploadphoto"></span></div>
</div>
<div class="form-actions fluid">
<div class="col-md-offset-4 col-md-8">
<button type="reset" class="btn default">重置数据</button>
<button type="submit" class="btn blue" id="submitrz" onclick="javascript:alert('感谢您的认证提交，管理员将在3-5小时内对你的认证请求进行审核');">提交审核</button>
</div>
</div>
</form>
</div>
</div>
<!-- BLOCK END --></div>
</div>
</div>
<!-- END TAB CONTENT --></div>
</div>
</div>
<!-- END CONTAINER --> <script language="javascript">
        setup(); 
        </script></div>

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
        });
    </script>
<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>