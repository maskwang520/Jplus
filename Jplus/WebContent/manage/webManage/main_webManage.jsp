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
<title>Jplus网站管理员</title>
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
<link href="<%=path%>/manage/jquerytable/jquery.dataTables.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="<%=path%>/style/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/manage/jquerytable/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/style/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="<%=path%>/manage/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=path%>/manage/js/main_web.js"></script>
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
					href="<%=path%>/manage/webManage/main_webManage.jsp">jplus网站管理员</a>
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
									<li><a href="<%=path%>/login_out.do?method=sys">注销</a></li>
								</ul>
							</span>
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
				onclick="form12submit()">保存</button>
		</div>
	</div>
	<div id="myModal13" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">照片上传(个人头像)</h3>
		</div>
		<div class="modal-body">
			<form id="form13" method="post" enctype="multipart/form-data">
				<input type="hidden" name="id13" id="id13" value="${user.id}" /> <input
					type="file" id="file" name="file" onchange="checkImgType(this)">
				<br /> <input type="hidden" id="flag" name="flag" value="ajax文件上传" />
			</form>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
			<button type="button" class="btn btn-primary"
				onclick="form13submit()">上传图片</button>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span2">
				<div class="accordion" id="accordion2">
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" onclick="findUser()"> <span
								class="icon-home"></span>&nbsp;&nbsp;个人资料
							</a>
						</div>
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" onclick="findMemberIdentify()"><span
								class="icon-home"></span>&nbsp;&nbsp;认证资料</a>
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
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion2" href="#collapseOne"> <i
								class="icon-list"></i>&nbsp;&nbsp;网站内容管理<span
								class="pull-right icon-chevron-down"></span>
							</a>
						</div>
						<div id="collapseOne" class="accordion-body collapse">
							<div class="accordion-inner">
								<ul class="nav nav-tabs">
									<li><a href="#" onclick="findUserAccess()"><span
											class="icon-file"></span>&nbsp;&nbsp;用户访问量</a></li>
									<li><a href="#" onclick="findFriendlink()"><span
											class="icon-file"></span>&nbsp;&nbsp;友情链接</a></li>
									<!-- <li><a href="#" onclick="findNetPurl()"><span
											class="icon-file"></span>&nbsp;&nbsp;网站静态图片地址</a>
									</li> -->
									<li><a href="#" onclick="findNavUrl()"><span
											class="icon-file"></span>&nbsp;&nbsp;合作案例管理</a></li>
									<li><a href="#" onclick="findBbsRecommend()"><span
											class="icon-file"></span>&nbsp;&nbsp;合作单位管理</a></li>
									<!-- <li><a href="#" onclick="findVedioRecommend()"><span
											class="icon-file"></span>&nbsp;&nbsp;专辑推荐</a>
									</li>
									<li><a href="#" onclick="findToolRecommend()"><span
											class="icon-file"></span>&nbsp;&nbsp;实用工具官方推荐</a>
									</li> -->
								</ul>
							</div>
						</div>
					</div>

					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" onclick="addWorknwe()"><span
								class="icon-home"></span>&nbsp;&nbsp;招聘信息管理</a>
						</div>
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion2" href="#collapseTwo"> <i
								class="icon-list"></i>&nbsp;&nbsp;jplus常务管理<span
								class="pull-right icon-chevron-down"></span>
							</a>
						</div>
						<div id="collapseTwo" class="accordion-body collapse">
							<div class="accordion-inner">
								<ul class="nav nav-tabs">
									<li><a href="#" onclick="findNotices()"><span
											class="icon-file"></span>&nbsp;&nbsp;公告管理</a></li>
									<li><a href="#" onclick="findTaks()"><span
											class="icon-file"></span>&nbsp;&nbsp;任务管理</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion2" href="#collapseThree"> <i
								class="icon-list"></i>&nbsp;&nbsp;资源管理<span
								class="pull-right icon-chevron-down"></span>
							</a>
						</div>
						<div id="collapseThree" class="accordion-body collapse">
							<div class="accordion-inner">
								<ul class="nav nav-tabs">
									<li><a href="#" onclick="findResclass()"><span
											class="icon-file"></span>&nbsp;&nbsp;资源类目管理</a></li>
									<li><a href="#" onclick="findRes()"><span
											class="icon-file"></span>&nbsp;&nbsp;资源管理</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" onclick="findJplusDes()"><span
								class="icon-home"></span>&nbsp;&nbsp;Jplus简介管理</a>
						</div>
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" onclick="findAllUsers()"><span
								class="icon-home"></span>&nbsp;&nbsp;用户管理</a>
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
						<font face="楷体" size="15px">JplusOnline网站管理</font>
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
			<label>管理员1：</label>
			<p class="text-info">姓名：曹辉，电话：15572934593，QQ：1747128171；邮箱：chitry@126.com；</p>
			<label>管理员2：</label>
			<p class="text-info">姓名：胡开才，电话：13117011726，QQ：940388651；邮箱：940388651@qq.com；</p>
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

	<div id="myModal3" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">认证资料修改(如实填写)</h3>
		</div>
		<div class="modal-body">
			<form id="form3" method="post">
				<input type="hidden" name="id" id="id3" style='overflow: scroll;' />
				<table class="table table-bordered">
					<tr>
						<td>成员姓名：</td>
						<td id="inm3"></td>
					</tr>
					<tr>
						<td>认证身份：</td>
						<td>第<input type="text" name="sessions" id="ses3"
							onkeyup="checkRate(this.id)" />届实验室成员
						</td>
					</tr>
					<tr>
						<td>成员简述：</td>
						<td><input type="text" name="descriptions" id="des3" /></td>
					</tr>
					<tr>
						<td>简介资料：</td>
						<td><input type="text" name="cotents" id="cte3" /></td>
					</tr>
					<tr>
						<td>现今所在地：</td>
						<td><input type="text" name="nowaddress" id="nad3" /></td>
					</tr>
					<tr>
						<td>现今工作：</td>
						<td><input type="text" name="nowwork" id="nwk3" /></td>
					</tr>
					<tr>
						<td>未来规划：</td>
						<td><input type="text" name="myplan" id="myp3" /></td>
					</tr>
					<tr>
						<td>熟悉领域：</td>
						<td><input type="text" name="knowsphere" id="knw3" /></td>
					</tr>
					<tr>
						<td>专业技能：</td>
						<td><input type="text" name="skills" id="ski3" /></td>
					</tr>
					<tr>
						<td>职业经历：</td>
						<td><input type="text" name="workbk" id="wbk3" /></td>
					</tr>
					<tr>
						<td>对师弟妹的建议：</td>
						<td><input type="text" name="suggestions" id="sug3" /></td>
					</tr>
					<tr>
						<td>QQ：</td>
						<td><input type="text" name="qq" id="qq3" /></td>
					</tr>
					<tr>
						<td>微信号：</td>
						<td><input type="text" name="weixinnum" id="wxn3" /></td>
					</tr>
					<tr>
						<td>常用邮箱：</td>
						<td><input type="text" name="email" id="ema3" /></td>
					</tr>
					<tr>
						<td>教育背景：</td>
						<td><input type="text" name="educations" id="edu3" /></td>
					</tr>
					<tr>
						<td>博客：</td>
						<td><input type="text" name="blogs" id="blo3" /></td>
					</tr>
					<tr>
						<td>个人网站：</td>
						<td><input type="text" name="pwurl" id="pwu3" /></td>
					</tr>
					<tr>
						<td>敏感信息可见设置：</td>
						<td><select name="viewtype" id="viw3">
								<option value="0">所有用户可见</option>
								<option value="1">所有Jplus实验室成员可见</option>
								<option value="2">管理员及指导老师可见</option>
								<option value="3">仅系统管理员可见</option>
								<option value="4">仅自己可见</option>
						</select></td>
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
			<h3 id="myModalLabel">用户访问量修改</h3>
		</div>
		<div class="modal-body">
			<form id="form4" method="post">
				<input type="hidden" name="id" id="id4" />
				<table class="table table-bordered">
					<tr>
						<td>名称：</td>
						<td id="ana4"></td>
					</tr>
					<tr>
						<td>访问量：</td>
						<td><input type="text" name="as_sum" id="asum4"
							onkeyup="checkRate(this.id)" /></td>
					</tr>
					<tr>
						<td>最大访问量：</td>
						<td><input type="text" name="as_max" id="amax4"
							onkeyup="checkRate(this.id)" /></td>
					</tr>
					<tr>
						<td>最大访问量日期(必填)：</td>
						<td><input type="text" name="as_maxdate" id="amd4"
							onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
							readonly="readonly" /></td>
					</tr>
					<tr>
						<td>描述：</td>
						<td><input type="text" name="as_description" id="ade4" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary" onclick="form4submit()">保存</button>
		</div>
	</div>
	<div id="myModal5" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">友好链接修改</h3>
		</div>
		<div class="modal-body">
			<form id="form5" method="post">
				<input type="hidden" name="id" id="id5" />
				<table class="table table-bordered">
					<tr>
						<td>链接名称：</td>
						<td><input type="text" name="fl_name" id="fname5" /></td>
					</tr>
					<tr>
						<td>链接url：</td>
						<td><input type="text" name="fl_url" id="furl5" /></td>
					</tr>
					<tr>
						<td>链接描述：</td>
						<td><input type="text" name="fl_descriptions" id="fdes5" />
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary" onclick="form5submit()">保存</button>
		</div>
	</div>

	<div id="myModalfriendlink" class="modal hide fade" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">添加友链</h3>
		</div>
		<div class="modal-body">
			<form id="formfl" method="post">
				<table class="table table-bordered">
					<tr>
						<td>名称：</td>
						<td><input type="text" name="fl_name" id="flname1d" /></td>
					</tr>
					<tr>
						<td>url地址：</td>
						<td><input type="text" name="fl_url" id="flurl" /></td>
					</tr>
					<tr>
						<td>描述：</td>
						<td><textarea rows="5" cols="1"
								style="overflow: scroll;width: 380px;" name="fl_des"
								id="fldes1d"></textarea></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary"
				onclick="formflsubmit()">添加</button>
		</div>
	</div>

	<div id="myModal6" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">网站静态图片修改</h3>
		</div>
		<div class="modal-body">
			<form id="form6" method="post">
				<input type="hidden" name="id" id="id6" />
				<table class="table table-bordered">
					<tr>
						<td>图片标题：</td>
						<td><input type="text" name="npl_title" id="ntitle6" /></td>
					</tr>
					<tr>
						<td>图片地址：</td>
						<td><input type="text" name="np_url" id="nurl6" /></td>
					</tr>
					<tr>
						<td>图片描述：</td>
						<td><input type="text" name="np_descriptions" id="ndes6" />
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary" onclick="form6submit()">保存</button>
		</div>
	</div>
	<div id="myModal7" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">网站导航栏目修改</h3>
		</div>
		<div class="modal-body">
			<form id="form7" method="post">
				<input type="hidden" name="id" id="id7" />
				<table class="table table-bordered">
					<tr>
						<td>导航名称：</td>
						<td><input type="text" name="n_name" id="nname7" /></td>
					</tr>
					<tr>
						<td>导航标题：</td>
						<td><input type="text" name="n_title" id="ntitle7" /></td>
					</tr>
					<tr>
						<td>导航URL：</td>
						<td><input type="text" name="n_url" id="nurl7" /></td>
					</tr>
					<tr>
						<td>导航描述：</td>
						<td><input type="text" name="n_descriptions" id="ndes7" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary" onclick="form7submit()">保存</button>
		</div>
	</div>
	<div id="myModal8" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">论坛模块推荐修改</h3>
		</div>
		<div class="modal-body">
			<form id="form8" method="post">
				<input type="hidden" name="id" id="id8" />
				<table class="table table-bordered">
					<tr>
						<td>板块名称：</td>
						<td><input type="text" name="vr_name" id="vname8" /></td>
					</tr>
					<tr>
						<td>板块标题：</td>
						<td><input type="text" name="vr_title" id="vtitle8" /></td>
					</tr>
					<tr>
						<td>板块URL：</td>
						<td><input type="text" name="vr_url" id="vurl8" /></td>
					</tr>
					<tr>
						<td>小图标地址：</td>
						<td><input type="text" name="vr_purl" id="vpurl8" /></td>
					</tr>
					<tr>
						<td>板块描述：</td>
						<td><input type="text" name="vr_descriptions" id="vdes8" />
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
	<div id="myModal9" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">专辑修改</h3>
		</div>
		<div class="modal-body">
			<form id="form9" method="post">
				<input type="hidden" name="id" id="id9" />
				<table class="table table-bordered">
					<tr>
						<td>专辑名称：</td>
						<td><input type="text" name="vr_name" id="vname9" /></td>
					</tr>
					<tr>
						<td>专辑标题：</td>
						<td><input type="text" name="vr_title" id="vtitle9" /></td>
					</tr>
					<tr>
						<td>专辑URL：</td>
						<td><input type="text" name="vr_url" id="vurl9" /></td>
					</tr>
					<tr>
						<td>小图标地址：</td>
						<td><input type="text" name="vr_purl" id="vpurl9" /></td>
					</tr>
					<tr>
						<td>专辑描述：</td>
						<td><input type="text" name="vr_descriptions" id="vdes9" />
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
	<div id="myModal10" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">使用工具官方推荐修改</h3>
		</div>
		<div class="modal-body">
			<form id="form10" method="post">
				<input type="hidden" name="id" id="id10" />
				<table class="table table-bordered">
					<tr>
						<td>工具名称：</td>
						<td><input type="text" name="tr_name" id="tname10" /></td>
					</tr>
					<tr>
						<td>工具标题：</td>
						<td><input type="text" name="tr_title" id="ttitle10" /></td>
					</tr>
					<tr>
						<td>工具URL：</td>
						<td><input type="text" name="tr_url" id="turl10" /></td>
					</tr>
					<tr>
						<td>小图标地址：</td>
						<td><input type="text" name="tr_purl" id="tpurl10" /></td>
					</tr>
					<tr>
						<td>工具描述：</td>
						<td><input type="text" name="tr_descriptions" id="tdes10" />
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary"
				onclick="form10submit()">保存</button>
		</div>
	</div>
	<div id="myModal1a" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">公告修改</h3>
		</div>
		<div class="modal-body">
			<form id="form1a" method="post">
				<input type="hidden" name="id" id="id1a" />
				<table class="table table-bordered">
					<tr>
						<td>公告主题：</td>
						<td><input type="text" name="jt_name" id="jname1a" /></td>
					</tr>
					<tr>
						<td>公告内容：</td>
						<td><textarea rows="10" cols="1"
								style="overflow: scroll;width: 380px;" name="jt_content"
								id="jcontent1a"></textarea></td>
					</tr>
					<tr>
						<td>发布时间：</td>
						<td><input type="text" name="jt_realtime" id="jtime1a"
							onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
							readonly="readonly" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary"
				onclick="form1asubmit()">保存</button>
		</div>
	</div>
	<div id="myModal1b" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">公告发布</h3>
		</div>
		<div class="modal-body">
			<form id="form1b" method="post">
				<table class="table table-bordered">
					<tr>
						<td>公告主题：</td>
						<td><input type="text" name="jt_name" id="jname1b" /></td>
					</tr>
					<tr>
						<td>公告内容：</td>
						<td><textarea rows="10" cols="1"
								style="overflow: scroll;width: 380px;" name="jt_content"
								id="jcontent1b"></textarea></td>
					</tr>
					<tr>
						<td>发布时间：</td>
						<td><input type="text" name="jt_realtime" id="jtime1b"
							onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
							readonly="readonly" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary"
				onclick="form1bsubmit()">发布</button>
		</div>
	</div>
	<div id="myModal1c" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">任务修改</h3>
		</div>
		<div class="modal-body">
			<form id="form1c" method="post">
				<input type="hidden" name="id" id="id1c" />
				<table class="table table-bordered">
					<tr>
						<td>任务主题：</td>
						<td><input type="text" name="jt_name" id="jname1c" /></td>
					</tr>
					<tr>
						<td>任务内容：</td>
						<td><textarea rows="10" cols="1"
								style="overflow: scroll;width: 380px;" name="jt_content"
								id="jcontent1c"></textarea></td>
					</tr>
					<tr>
						<td>任务描述：</td>
						<td><textarea rows="5" cols="1"
								style="overflow: scroll;width: 380px;" name="jt_des" id="jdes1c"></textarea>
						</td>
					</tr>
					<tr>
						<td>发布时间：</td>
						<td><input type="text" name="jt_realtime" id="jtime1c"
							onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
							readonly="readonly" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary"
				onclick="form1csubmit()">保存</button>
		</div>
	</div>
	<div id="myModal1d" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">任务发布</h3>
		</div>
		<div class="modal-body">
			<form id="form1d" method="post">
				<table class="table table-bordered">
					<tr>
						<td>任务主题：</td>
						<td><input type="text" name="jt_name" id="jname1d" /></td>
					</tr>
					<tr>
						<td>任务内容：</td>
						<td><textarea rows="10" cols="1"
								style="overflow: scroll;width: 380px;" name="jt_content"
								id="jcontent1d"></textarea></td>
					</tr>
					<tr>
						<td>任务描述：</td>
						<td><textarea rows="5" cols="1"
								style="overflow: scroll;width: 380px;" name="jt_des" id="jdes1d"></textarea>
						</td>
					</tr>
					<tr>
						<td>发布时间：</td>
						<td><input type="text" name="jt_realtime" id="jtime1d"
							onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
							readonly="readonly" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary"
				onclick="form1dsubmit()">发布</button>
		</div>
	</div>

	<div id="myModalAL" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">案例添加</h3>
		</div>
		<div class="modal-body">
			<form id="formAL" method="post" enctype="multipart/form-data">
				<table class="table table-bordered">
					<tr>
						<td>名称：</td>
						<td><input type="text" name="al_name" id="alname" /></td>
					</tr>
					<tr>
						<td>标题：</td>
						<td><input type="text" name="al_title" id="altitle" /></td>
					</tr>
					<tr>
						<td>图片上传：</td>
						<td><input type="file" id="fileAL" name="fileAL"
							onchange="checkImgType(this)"> <br /> <input
							type="hidden" id="flag" name="flag" value="ajax文件上传" /></td>
					<tr>
						<td>链接：</td>
						<td><input type="text" name="al_lj" id="allj" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary"
				onclick="formALsubmit()">添加</button>
		</div>
	</div>

	<div id="myModalDL" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">合作单位添加</h3>
		</div>
		<div class="modal-body">
			<form id="formDL" method="post" enctype="multipart/form-data">
				<table class="table table-bordered">
					<tr>
						<td>名称：</td>
						<td><input type="text" name="dl_name" id="dlname" /></td>
					</tr>
					<tr>
						<td>标题：</td>
						<td><input type="text" name="dl_title" id="dltitle" /></td>
					</tr>
					<tr>
						<td>图片上传：</td>
						<td><input type="file" id="fileDL" name="fileDL"
							onchange="checkImgType(this)"> <br /> <input
							type="hidden" id="flag" name="flag" value="ajax文件上传" /></td>
					</tr>
					<tr>
						<td>链接：</td>
						<td><input type="text" name="dl_lj" id="dllj" /></td>
					</tr>
					<tr>
						<td>描述：</td>
						<td><textarea rows="5" cols="1"
								style="overflow: scroll;width: 380px;" name="dl_description"
								id="dldescriptionst"></textarea></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary"
				onclick="formDLsubmit()">添加</button>
		</div>
	</div>

	<div id="myModalt1" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">资源类目修改</h3>
		</div>
		<div class="modal-body">
			<form id="formt1" method="post">
				<input type="hidden" name="id" id="idt1" />
				<table class="table table-bordered">
					<tr>
						<td>资源名称：</td>
						<td><input type="text" name="resname" id="rnamet1" /></td>
					</tr>
					<tr>
						<td>资源描述：</td>
						<td><textarea rows="5" cols="1"
								style="overflow: scroll;width: 380px;" name="resdescription"
								id="rdest1"></textarea></td>
					</tr>
					<tr>
						<td>是否允许百度云下载：</td>
						<td><select name="isbdydown" id="isbdyt1">
								<option value="1">允许</option>
								<option value="0">不允许</option>
						</select></td>
					</tr>
					<tr>
						<td>是否360下载：</td>
						<td><select name="is360down" id="is360t1">
								<option value="1">允许</option>
								<option value="0">不允许</option>
						</select></td>
					</tr>
					<tr>
						<td>是否允许本地下载：</td>
						<td><select name="islocationdown" id="isloct1">
								<option value="1">允许</option>
								<option value="0">不允许</option>
						</select></td>
					</tr>
					<tr>
						<td>资源图片url：</td>
						<td><input type="text" name="respurl" id="rpurlt1" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary"
				onclick="formt1submit()">修改</button>
		</div>
	</div>
	<div id="myModalt2" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">资源类目添加</h3>
		</div>
		<div class="modal-body">
			<form id="formt2" method="post">
				<table class="table table-bordered">
					<tr>
						<td>资源名称：</td>
						<td><input type="text" name="resname" id="rnamet2" /></td>
					</tr>
					<tr>
						<td>资源描述：</td>
						<td><textarea rows="5" cols="1"
								style="overflow: scroll;width: 380px;" name="resdescription"
								id="rdest2"></textarea></td>
					</tr>
					<tr>
						<td>是否允许百度云下载：</td>
						<td><select name="isbdydown" id="isbdyt2">
								<option value="1">允许</option>
								<option value="0">不允许</option>
						</select></td>
					</tr>
					<tr>
						<td>是否360下载：</td>
						<td><select name="is360down" id="is360t2">
								<option value="1">允许</option>
								<option value="0">不允许</option>
						</select></td>
					</tr>
					<tr>
						<td>是否允许本地下载：</td>
						<td><select name="islocationdown" id="isloct2">
								<option value="1">允许</option>
								<option value="0">不允许</option>
						</select></td>
					</tr>
					<tr>
						<td>资源图片url：</td>
						<td><input type="text" name="respurl" id="rpurlt2" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary"
				onclick="formt2submit()">添加</button>
		</div>
	</div>
	<div id="myModalt3" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">资源修改</h3>
		</div>
		<div class="modal-body">
			<form id="formt3" method="post">
				<input type="hidden" name="id" id="idt3" />
				<table class="table table-bordered">
					<tr>
						<td>资源名称：</td>
						<td><input type="text" name="resname" id="rnt3" /></td>
					</tr>
					<tr>
						<td>资源类别：</td>
						<td><select name="resClass" id="rct3"></select></td>
					</tr>
					<tr>
						<td>资源描述：</td>
						<td><textarea rows="5" cols="1"
								style="overflow: scroll;width: 380px;" name="resdescription"
								id="rdt3"></textarea></td>
					</tr>
					<tr>
						<td>百度运网盘地址：</td>
						<td><input type="text" name="res_bdypath" id="rbut3" /></td>
					</tr>
					<tr>
						<td>百度云提取码：</td>
						<td><input type="text" name="res_bdypassword" id="rbpt3" />
						</td>
					</tr>
					<tr>
						<td>360云盘地址：</td>
						<td><input type="text" name="res_360path" id="r3ut3" /></td>
					</tr>
					<tr>
						<td>360云盘提取码：</td>
						<td><input type="text" name="res_360password" id="r3pt3" />
						</td>
					</tr>
					<tr>
						<td>本地下载地址：</td>
						<td><input type="text" name="res_locationpath" id="rlt3" />
						</td>
					</tr>
					<tr>
						<td>下载次数：</td>
						<td><input type="text" name="downloadnum" id="rlnt3"
							onkeyup="checkRate(this.id)" /></td>
					</tr>
					<tr>
						<td>下载所需积分：</td>
						<td><input type="text" name="downloadscore" id="rsot3"
							onkeyup="checkRate(this.id)" /></td>
					</tr>
					<tr>
						<td>资源上传时间：</td>
						<td><input type="text" name="resdate" id="rdat3"
							onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
							readonly="readonly" /></td>
					</tr>
					<tr>
						<td>审核状态：</td>
						<td><select name="resstate" id="rstt3">
								<option value="0">审核未通过</option>
								<option value="1">正在审核</option>
								<option value="2">审核通过</option>
						</select></td>
					</tr>
					<tr>
						<td>赞数量：</td>
						<td><input type="text" name="resdiscuss" id="rdit3"
							onkeyup="checkRate(this.id)" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary"
				onclick="formt3submit()">修改</button>
		</div>
	</div>
	<div id="myModalt4" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">上传资源</h3>
		</div>
		<div class="modal-body">
			<form id="formt4" method="post">
				<table class="table table-bordered">
					<tr>
						<td>资源名称：</td>
						<td><input type="text" name="resname" id="rnt4" /></td>
					</tr>
					<tr>
						<td>资源类别：</td>
						<td><select name="resClass" id="rct4"></select></td>
					</tr>
					<tr>
						<td>资源描述：</td>
						<td><textarea rows="5" cols="1"
								style="overflow: scroll;width: 380px;" name="resdescription"
								id="rdt4"></textarea></td>
					</tr>
					<tr>
						<td>百度运网盘地址：</td>
						<td><input type="text" name="res_bdypath" id="rbut4" /></td>
					</tr>
					<tr>
						<td>百度云提取码：</td>
						<td><input type="text" name="res_bdypassword" id="rbpt4" />
						</td>
					</tr>
					<tr>
						<td>360云盘地址：</td>
						<td><input type="text" name="res_360path" id="r3ut4" /></td>
					</tr>
					<tr>
						<td>360云盘提取码：</td>
						<td><input type="text" name="res_360password" id="r3pt4" />
						</td>
					</tr>
					<tr>
						<td>本地下载地址：</td>
						<td><input type="text" name="res_locationpath" id="rlt4" />
						</td>
					</tr>
					<tr>
						<td>下载次数：</td>
						<td><input type="text" name="downloadnum" id="rlnt4"
							onkeyup="checkRate(this.id)" /></td>
					</tr>
					<tr>
						<td>下载所需积分：</td>
						<td><input type="text" name="downloadscore" id="rsot4"
							onkeyup="checkRate(this.id)" /></td>
					</tr>
					<tr>
						<td>资源上传时间：</td>
						<td><input type="text" name="resdate" id="rdat4"
							onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
							readonly="readonly" /></td>
					</tr>
					<tr>
						<td>审核状态：</td>
						<td><select name="resstate" id="rstt4">
								<option value="0">审核未通过</option>
								<option value="1">正在审核</option>
								<option value="2">审核通过</option>
						</select></td>
					</tr>
					<tr>
						<td>赞数量：</td>
						<td><input type="text" name="resdiscuss" id="rdit4"
							onkeyup="checkRate(this.id)" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary"
				onclick="formt4submit()">修改</button>
		</div>
	</div>
	<div id="myModalt5" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">jplus简介修改</h3>
		</div>
		<div class="modal-body">
			<form id="formt5" method="post">
				<input type="hidden" name="id" id="idt5" />
				<table class="table table-bordered">
					<tr>
						<td>标题：</td>
						<td><input type="text" name="jd_title" id="jdt5" /></td>
					</tr>
					<tr>
						<td>内容：</td>
						<td><textarea rows="5" cols="1"
								style="overflow: scroll;width: 380px;" name="jd_content"
								id="jdc5"></textarea></td>
					</tr>
					<tr>
						<td>发布时间：</td>
						<td><input type="text" name="jd_reltime" id="jdr5"
							onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
							readonly="readonly" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary"
				onclick="formt5submit()">保存</button>
		</div>
	</div>
	<div id="myModal22" class="modal hide fade" tabindex="-1" role="dialog"
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
					<td id="usernameID2"></td>
				</tr>
				<tr>
					<td>真实姓名 ：</td>
					<td id="realnameID2"></td>
				</tr>
				<tr>
					<td>年龄：</td>
					<td id="ageID2"></td>
				</tr>
				<tr>
					<td>性别：</td>
					<td id="sexID2"></td>
				</tr>
				<tr>
					<td>出生日期：</td>
					<td id="birthdayID2"></td>
				</tr>
				<tr>
					<td>证件号：</td>
					<td id="certsnumID2"></td>
				</tr>
				<tr>
					<td>电话号码：</td>
					<td id="telephoneID2"></td>
				</tr>
				<tr>
					<td>邮箱：</td>
					<td id="emailID2"></td>
				</tr>
				<tr>
					<td>qq号：</td>
					<td id="qqID2"></td>
				</tr>
				<tr>
					<td>住址：</td>
					<td id="addressID2"></td>
				</tr>
				<tr>
					<td>爱好：</td>
					<td id="hobbyID2"></td>
				</tr>
				<tr>
					<td>注册时间：</td>
					<td id="regtimeID2"></td>
				</tr>
				<tr>
					<td>用户权限：</td>
					<td id="limitsID2"></td>
				</tr>
				<tr>
					<td>认证类型：</td>
					<td id="identifysID2"></td>
				</tr>
				<tr>
					<td>用户等级：</td>
					<td id="userlevelIdID2"></td>
				</tr>
				<tr>
					<td>积分</td>
					<td id="scoresID2"></td>
				</tr>
			</table>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
		</div>
	</div>
	<div id="myModal52" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">用户基本信息修改</h3>
		</div>
		<div class="modal-body">
			<form id="form52" method="post">
				<input type="hidden" name="id" id="id52" />
				<table class="table table-bordered">
					<tr>
						<td>用户名:</td>
						<td><input type="text" id="us52" name="username"></td>
					</tr>
					<tr>
						<td>真实姓名:</td>
						<td><input type="text" id="re52" name="realname"></td>
					</tr>
					<tr>
						<td>年龄:</td>
						<td><input type="text" id="ag52" name="age"
							onkeyup="checkRate(this.id)"></td>
					</tr>
					<tr>
						<td>性别:</td>
						<td><select name="sex" id="se52">
								<option value="0">男</option>
								<option value="1">女</option>
								<option value="2">未知</option>
						</select></td>
					</tr>
					<tr>
						<td>出生日期:</td>
						<td><input type="text" id="bi52" onclick="WdatePicker()"
							name="birthday" readonly="readonly"></td>
					</tr>
					<tr>
						<td>证件号:</td>
						<td><input type="text" id="ce52" name="certsnum"></td>
					</tr>
					<tr>
						<td>电话号码:</td>
						<td><input type="text" id="te52" name="telephone"></td>
					</tr>
					<tr>
						<td>邮箱:</td>
						<td><input type="text" id="em52" name="email"></td>
					</tr>
					<tr>
						<td>qq号:</td>
						<td><input type="text" id="qq52" name="qq"></td>
					</tr>
					<tr>
						<td>住址:</td>
						<td><input type="text" id="ad52" name="address"></td>
					</tr>
					<tr>
						<td>爱好:</td>
						<td><input type="text" id="ho52" name="hobby" /></td>
					</tr>
					<tr>
						<td>注册时间:</td>
						<td><input type="text" id="reg52" name="regtime"
							onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
							readonly="readonly" /></td>
					</tr>
					<tr>
						<td>积分:</td>
						<td><input type="text" name="scores" id="sc52"
							onkeyup="checkRate(this.id)" />(0-100)</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="button" class="btn btn-primary"
				onclick="form52submit()">保存</button>
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
