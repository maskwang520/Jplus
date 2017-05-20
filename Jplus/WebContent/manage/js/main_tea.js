//项目名获取
function getRootPath() {
	var pathName = window.document.location.pathname;
	var projectName = pathName
			.substring(0, pathName.substr(1).indexOf('/') + 1);
	return projectName;
}
// 判断输入是否为整数
function checkRate(input) {
	var re = /^[0-9]+.?[0-9]*$/;// 判断整数
	var number = document.getElementById(input).value;
	if (!re.test(number)) {
		alert("请输入数字");
		return false;
	}
}
// 验证手机号
function checkMobile(str) {
	var re = /^1\d{10}$/;
	if (re.test(str)) {
		return true;
	} else {
		return false;
	}
}
// 验证电话号
function checkPhone(str) {
	var re = /^0\d{2,3}-?\d{7,8}$/;
	if (re.test(str)) {
		return true;
	} else {
		return false;
	}
}
// 验证邮箱
function checkEmail(str) {
	var re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
	if (re.test(str)) {
		return true;
	} else {
		return false;
	}
}
// 验证身份证号码
function isCardNo(str)  {  
   // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
   var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
   if(reg.test(str)){  
       return  true; 
   }else{
	   return false;
   }  
}  
// 密码修改
function form12submit() {
	var p2 = $("#pass2").val();
	var p3 = $("#pass3").val();
	if (p2 != p3) {
		alert("输入密码不匹配");
		return false;
	}
	$.post(getRootPath() + "/updateUserpassword.do", {
		id : $("#userId").val(),
		p1 : $("#pass1").val(),
		p2 : p2
	}, function(data) {
		if (data == "true") {
			alert("修改成功!!!");
			$('#myModal12').modal('hide');
		} else {
			alert("旧密码输入错误!!");
		}
	});
}

// 个人资料
function findUser() {
	$("#showdata").empty();
	$("#showdata").append('<h3 class="page-header text-info">个人资料</h3>');
	$("#showdata")
			.append(
					'<table class="table table-bordered" width="50%"><tbody id="t1"></tbody></table>');
	$
			.ajax({
				type : 'post',
				data : {
					id : $("#userId").val()
				},
				dataType : 'json',
				url : getRootPath() + '/findUserByuserId.do',
				cache : false,
				error : function(data) {
					alert("出错了！！");
				},
				success : function(data) {
					var sex = data.sex;
					if (sex == 0) {
						sex = "男";
					} else if (sex == 1) {
						sex = "女";
					} else {
						sex = "未知";
					}
					var limits = data.limits;
					if (limits == 0) {
						limits = "用户(信息未完善)";
					} else if (limits == 1) {
						limits = "用户（信息完善）";
					} else if (limits == 2) {
						limits = "实验室成员";
					} else if (limits == 3) {
						limits = "网站管理员";
					} else if (limits == 4) {
						limits = "指导老师";
					} else {
						limits = "系统管理员";
					}
					var identifys = data.identifys;
					if (identifys == 0) {
						identifys = "非认证用户";
					} else if (identifys > 0) {
						identifys = "第" + identifys + "届实验室成员";
					} else if (identifys == -1) {
						identifys = "实验室指导老师";
					} else {
						identifys = "企业用户";
					}
					$("#t1")
							.append(
									"<tr><td width='180px'>用户名:</td><td>"
											+ data.username
											+ "</td></tr><tr><td>真实姓名:</td><td>"
											+ data.realname
											+ "</td></tr><tr><td>证件号:</td><td>"
											+ data.username
											+ "</td></tr><tr><td>年龄:</td><td>"
											+ data.age
											+ "</td></tr><tr><td>性别:</td><td>"
											+ sex
											+ "</td></tr><tr><td>注册时间:</td><td>"
											+ data.regtimeString
											+ "</td></tr><tr><td>QQ:</td><td>"
											+ data.qq
											+ "</td></tr><tr><td>电话:</td><td>"
											+ data.telephone
											+ "</td></tr><tr><td>出生日期:</td><td>"
											+ data.birthday
											+ "</td></tr><tr><td>爱好:</td><td>"
											+ data.hobby
											+ "</td></tr><tr><td>地址:</td><td>"
											+ data.address
											+ "</td></tr><tr><td>注册邮箱:</td><td>"
											+ data.email
											+ "</td></tr><tr><td>权限:</td><td>"
											+ limits
											+ "</td></tr><tr><td>认证类型:</td><td>"
											+ identifys
											+ "</td></tr><tr><td>用户等级:</td><td>"
											+ data.userlevelsString
											+ "</td></tr><tr><td>用户积分:</td><td>"
											+ data.scores
											+ "</td></tr><tr><td align='center' colspan='2'><button type='button' class='btn btn-primary' onclick='updateUserById("
											+ data.id
											+ ")'>修改</button></td></tr>");
				}
			});
}

function updateUserById(id) {
	$.ajax({
		data : {
			id : id
		},
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findUserByuserId.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			showInfo1(data);
			$('#myModal2').modal('show');
		}
	});
}

function form2submit() {
	var telephone = $("#te2").val();
	if(!(checkMobile(telephone)||checkPhone(telephone))){
		alert("电话号码格式错误!!");
		return false;
	}
	var email=$("#em2").val();
	if(!checkEmail(email)){
		alert("邮箱格式错误!!");
		return false;
	}
	var certsnum=$("#cen2").val();
	if(!isCardNo(certsnum)){
		alert("身份证号码格式错误!!");
		return false;
	}
	$.post(getRootPath() + '/updateUserById1.do', {
		id : $("#id2").val(),
		realname : $("#re2").val(),
		age : $("#ag2").val(),
		sex : $("#se2").val(),
		certsnum : certsnum,
		birthday : $("#bi2").val(),
		telephone :telephone,
		email : email,
		address : $("#ad2").val(),
		qq : $("#qq2").val(),
		hobby : $("#ho2").val()
	}, function(data) {
		alert(data);
		$('#myModal2').modal('hide');
		findUser();
	});
}

function showInfo1(data) {
	$("#id2").val(data.id);
	$("#re2").val(data.realname);
	$("#ag2").val(data.age);
	if (data.sex == 0) {
		$("#se2 option[value='0']").attr("selected", "selected");
	} else if (data.sex == 1) {
		$("#se2 option[value='1']").attr("selected", "selected");
	} else {
		$("#se2 option[value='2']").attr("selected", "selected");
	}
	$("#cen2").val(data.certsnum);
	$("#bi2").val(data.birthday);
	$("#te2").val(data.telephone);
	$("#em2").val(data.email);
	$("#qq2").val(data.qq);
	$("#ad2").val(data.address);
	$("#ho2").val(data.hobby);
}
//发布招聘消息
function addWorknwe(){
	alert("正在开发!!");
	return false;
}

function findAllCommication(){
	$("#showdata").empty();
	$("#showdata").append('<h3 class="page-header text-info">jplus实验室通讯录</h3>');
	$("#showdata")
			.append(
					'<table id="table3" class="table table-bordered" width="100%"><thead><tr class="text-info"><th height="30px" width="50px">姓名</th><th width="120px">身份</th><th width="100px">现今所在地</th><th width="80px">现今工作</th><th width="80px">QQ</th><th width="80px">电话</th><th width="100px">常用邮箱</th><th width="150px">博客</th><th width="150px">个人网站</th></tr></thead><tbody id="t3"></tbody></table>');
	$
			.ajax({
				type : 'post',
				dataType : 'json',
				url : getRootPath() + '/findAllCommication.do',
				cache : false,
				error : function(data) {
					alert("出错了！！");
				},
				success : function(data) {
					for ( var o in data) {
						$("#t3")
								.append(
										"<tr style='font-size: 13px;height: 45px;'><td>"
												+ data[o].membername
												+ "</td><td>"
												+ data[o].sf
												+ "</td><td>"
												+ data[o].nowaddress
												+ "</td><td>"
												+ data[o].nowwork
												+ "</td><td>"
												+ data[o].qq
												+ "</td><td>"
												+ data[o].telephone
												+ "</td><td>"
												+ data[o].email
												+ "</td><td>"
												+ data[o].blogs
												+ "</td><td>"
												+ data[o].pwurl
												+ "</td>></tr>");
					}
					$("#table1")
							.dataTable(
									{
										"bInfo" : true,
										"sPaginationType" : "full_numbers",
										"bPaginate" : true,
										"bLengthChange" : true,
										"iDisplayLength" : 10,
										"aLengthMenu" : [ 5, 10, 20, 50, 100 ],
										"bProcessing" : true,
										"oLanguage" : {// 下面是一些汉语翻译
											"sSearch" : "搜索",
											"sLengthMenu" : "每页显示 _MENU_ 条记录",
											"sZeroRecords" : "没有检索到数据",
											"sInfo" : "显示 _START_ 至 _END_ 条 &nbsp;&nbsp;共 _TOTAL_ 条",
											"sInfoFiltered" : "(筛选自 _MAX_ 条数据)",
											"sInfoEmtpy" : "没有数据",
											"sProcessing" : "正在加载数据...",
											"oPaginate" : {
												"sFirst" : "首页",
												"sPrevious" : "前一页",
												"sNext" : "后一页",
												"sLast" : "末页"
											}
										},
									});
				}
			});
}

//联系系统管理员
function findSystemmanage(){
	$('#myModalianxi').modal('show');
}
