//项目名获取
function getRootPath() {
	var pathName = window.document.location.pathname;
	var projectName = pathName
			.substring(0, pathName.substr(1).indexOf('/') + 1);
	return projectName;
}
//判断输入是否为整数
function checkRate(input) {
	var re = /^[0-9]+.?[0-9]*$/;// 判断整数
	var number = document.getElementById(input).value;
	if (!re.test(number)) {
		alert("请输入数字");
		return false;
	}
}
//验证手机号
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
//密码修改
function form12submit(){
	var p2=$("#pass2").val();
	var p3=$("#pass3").val();
	if(p2!=p3){
		alert("输入密码不匹配");
		return false;
	}
	$.post(getRootPath() + "/updateUserpassword.do", {
		id : $("#userId").val(),
		p1:$("#pass1").val(),
		p2:p2
	}, function(data) {
		if(data=="true"){
			alert("修改成功!!!");
			$('#myModal12').modal('hide');
		}else{
			alert("旧密码输入错误!!");
		}
	});
}

// 用户管理
function findAllUsers() {
	$("#showdata").empty();
	$("#showdata").append('<h3 class="page-header text-info">用户管理</h3>');
	$("#showdata")
			.append(
					'<table id="table1" class="table table-bordered" width="100%"><thead><tr class="text-info"><th height="30px" width="70px" class="th1">用户名</th><th width="100px" class="th1">真实姓名</th><th width="150px" class="th1">注册时间</th><th width="100px" class="th1">注册邮箱</th><th width="80px" class="th1">qq</th><th width="80px" class="th1">电话</th><th width="120px" class="th2">权限</th><th width="120px" class="th2">认证类型</th><th width="180px" class="th2">用户等级</th><th width="50px">查看</th><th width="50px">操作</th></tr></thead><tbody id="t1"></tbody></table>');
	$
			.ajax({
				type : 'post',
				dataType : 'json',
				url : getRootPath() + '/findAllUsers.do',
				cache : false,
				error : function(data) {
					alert("出错了！！");
				},
				success : function(data) {
					for ( var o in data) {
						$("#t1")
								.append(
										"<tr style='font-size: 13px;height: 45px;'><td>"
												+ data[o].username
												+ "</td><td>"
												+ data[o].realname
												+ "</td><td>"
												+ data[o].regtimeString
												+ "</td><td>"
												+ data[o].email
												+ "</td><td>"
												+ data[o].qq
												+ "</td><td>"
												+ data[o].telephone
												+ "</td><td>"
												+ data[o].limitsString
												+ "</td><td>"
												+ data[o].identifysString
												+ "</td><td>"
												+ data[o].userlevelsString
												+ "</td><td><button type='button' onclick='findUserById("
												+ data[o].id
												+ ")' class='btn btn-mini btn-info'>详细</button></td><td><button type='button' onclick='updateUserById("
												+ data[o].id
												+ ")' class='btn btn-mini btn-info'>修改</button><button type='button' onclick='deleteUserById("
												+ data[o].id
												+ ")'class='btn btn-mini btn-info'>删除</button></td></tr>");
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

function findUserById(id) {
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
			showInfo(data);
			$('#myModal2').modal('show');
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
			$('#myModal5').modal('show');
		}
	});
}



function form5submit() {
	var userle = $("#usle5").val();
	if (userle < 1 || userle > 10) {
		alert("对不起，用户等级范围是1-10!!");
		return false;
	}
	var scores = $("#sc5").val();
	if (scores < 0 || scores > 100||scores=="") {
		alert("对不起，你输入的积分不符合!!");
		return false;
	}
	var telephone = $("#te5").val();
	if(!(checkMobile(telephone)||checkPhone(telephone))){
		alert("电话号码格式错误!!");
		return false;
	}
	var email= $("#em5").val();
	if(!checkEmail(email)){
		alert("邮箱格式错误!!");
		return false;
	}
	var certsnum=$("#ce5").val();
	if(!isCardNo(certsnum)){
		alert("身份证号码格式错误!!");
		return false;
	}
	$.post(getRootPath() + '/updateUserById.do', {
		id : $("#id5").val(),
		username : $("#us5").val(),
		realname : $("#re5").val(),
		age : $("#ag5").val(),
		sex : $("#se5").val(),
		birthday : $("#bi5").val(),
		certsnum :certsnum,
		telephone : telephone,
		email : email,
		address : $("#ad5").val(),
		qq : $("#qq5").val(),
		hobby : $("#ho5").val(),
		regtime : $("#reg5").val(),
		limits : $("#li5").val(),
		identifys:$("#ide5").val()==1?$("#mem5").val():$("#ide5").val(),
		userlevelId : userle,
		scores : scores
	}, function(data) {
		alert(data);
		$('#myModal5').modal('hide');
		findAllUsers();
	});
}

function deleteUserById(id) {
	$.post(getRootPath() + "/deleteUserByuserId.do", {
		id : id
	}, function() {
		findAllUsers();
	});
}

function showInfo(data) {
	$("#usernameID").text(data.username);
	$("#realnameID").text(data.realname);
	$("#ageID").text(data.age);
	if (data.sex == 0) {
		$("#sexID").text("男");
	} else if (data.sex == 1) {
		$("#sexID").text("女");
	} else {
		$("#sexID").text("未知");
	}
	$("#birthdayID").text(data.birthday);
	$("#certsnumID").text(data.certsnum);
	$("#telephoneID").text(data.telephone);
	$("#emailID").text(data.email);
	$("#qqID").text(data.qq);
	$("#addressID").text(data.address);
	$("#hobbyID").text(data.hobby);
	$("#regtimeID").text(data.regtime);
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
	$("#limitsID").text(limits);
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
	$("#identifysID").text(identifys);
	$("#userlevelIdID").text(data.userlevelId);
	$("#scoresID").text(data.scores);
}

function showInfo1(data) {
	$("#us5").val(data.username);
	$("#id5").val(data.id);
	$("#re5").val(data.realname);
	$("#ag5").val(data.age);
	if (data.sex == 0) {
		$("#se5 option[value='0']").attr("selected", "selected");
	} else if (data.sex == 1) {
		$("#se5 option[value='1']").attr("selected", "selected");
	} else {
		$("#se5 option[value='2']").attr("selected", "selected");
	}
	$("#bi5").val(data.birthday);
	$("#ce5").val(data.certsnum);
	$("#te5").val(data.telephone);
	$("#em5").val(data.email);
	$("#qq5").val(data.qq);
	$("#ad5").val(data.address);
	$("#ho5").val(data.hobby);
	$("#reg5").val(data.regtimeString);
	var limits = data.limits;
	if (limits == 0) {
		$("#li5 option[value='0']").attr("selected", "selected");
	} else if (limits == 1) {
		$("#li5 option[value='1']").attr("selected", "selected");
	} else if (limits == 2) {
		$("#li5 option[value='2']").attr("selected", "selected");
	} else if (limits == 3) {
		$("#li5 option[value='3']").attr("selected", "selected");
	} else if (limits == 4) {
		$("#li5 option[value='4']").attr("selected", "selected");
	} else {
		$("#li5 option[value='5']").attr("selected", "selected");
	}
	var identifys = data.identifys;
	if (identifys <1) {
		$("#ide5").val(identifys);
		$("#span5").css("display","none");
	} else {
		$("#ide5 option[value='1']").attr("selected", "selected");
		$("#mem5").val(identifys);
		$("#span5").css("display","block");
	}
	$("#usle5").val(data.userlevelId);
	$("#sc5").val(data.scores);
}

function getMem(){
	var value=$("#ide5").val();
	if(value==1){
		$("#mem5").val("");
		$("#span5").css("display","block");
	}else{
		$("#span5").css("display","none");
	}
}
// 用户信箱管理

function findAllUsermsg() {
	$("#showdata").empty();
	$("#showdata").append('<h3 class="page-header text-info">用户信箱管理</h3>');
	$("#showdata")
			.append(
					'<table id="table2" class="table table-bordered" width="100%"><thead><tr class="text-info"><th>用户名</th><th>真实姓名</th><th>信息内容</th><th>已读标记</th><th>发送方</th><th>接收日期</th><th>操作</th></tr></thead><tbody id="t2"></tbody></table>');
	$
			.ajax({
				type : 'post',
				dataType : 'json',
				url : getRootPath() + '/findAllUsermsg.do',
				cache : false,
				error : function(data) {
					alert("出错了！！");
				},
				success : function(data) {
					for ( var o in data) {
						$("#t2")
								.append(
										"<tr style='font-size: 13px;height: 45px;'><td>"
												+ data[o].username
												+ "</td><td>"
												+ data[o].realname
												+ "</td><td>"
												+ data[o].msgcontent
												+ "</td><td>"
												+ data[o].readsign
												+ "</td><td>"
												+ data[o].sendauthor
												+ "</td><td>"
												+ data[o].gettime
												+ "</td><td><button type='button' onclick='updateUserMsgById("
												+ data[o].id
												+ ")'"
												+ " class='btn btn-mini btn-info'>修改</button><button type='button' onclick='deleteUserMsgById("
												+ data[o].id
												+ ")'class='btn btn-mini btn-info'>删除</button></td></tr>");
					}
					$("#table2")
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

function updateUserMsgById(id) {
	$.ajax({
		data : {
			id : id
		},
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findUserMsgById.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			$("#id3").val(data.id);
			$("#msg3").val(data.msgcontent);
			var  readsign=data.readsign;
			if(readsign==0){
				$("#res3 option[value='0']").attr("selected", "selected");
			}else{
				$("#res3 option[value='1']").attr("selected", "selected");
			}
			$("#get3").val(data.datetimeString);
			$("#sea3").val(data.sendauthor);
			$('#myModal3').modal('show');
		}
	});
}

function form3submit() {
	var id = $("#id3").val();
	var msgcontent = $("#msg3").val();
	var readsign=$("#res3").val();
	var gettime=$("#get3").val();
	var sendauthor=$("#sea3").val();
	$.post(getRootPath() + "/updateUserMsgById.do", {
		id : id,
		msgcontent : msgcontent,
		readsign:readsign,
		sendauthor:sendauthor,
		gettime:gettime
	}, function(data) {
		alert(data);
		$('#myModal3').modal('hide');
		findAllUsermsg();
	});
}

function deleteUserMsgById(id){
	$.post(getRootPath() + "/deleteUserMsgById.do", {
		id : id
	}, function() {
		findAllUsermsg();
	});
}


// 积分等级管理
function findAllLevel() {
	$("#showdata").empty();
	$("#showdata").append('<h3 class="page-header text-info">积分等级管理</h3>');
	$("#showdata")
			.append(
					'<table id="table3" class="table table-bordered" width="100%"><thead><tr class="text-info"><th>等级</th><th>最低积分</th><th>最高积分</th><th>等级描述</th><th>操作</th></tr></thead><tbody id="t3"></tbody></table>');
	$
			.ajax({
				type : 'post',
				dataType : 'json',
				url : getRootPath() + '/findAllLevel.do',
				cache : false,
				error : function(data) {
					alert("出错了！！");
				},
				success : function(data) {
					for ( var o in data) {
						$("#t3")
								.append(
										"<tr style='font-size: 13px;height: 45px;'><td>"
												+ data[o].levels
												+ "</td><td>"
												+ data[o].minscores
												+ "</td><td>"
												+ data[o].maxscores
												+ "</td><td>"
												+ data[o].descriptions
												+ "</td><td><button type='button' onclick='updateUserLevelById("
												+ data[o].id
												+ ")'"
												+ " class='btn btn-mini btn-info'>修改</button></td></tr>");
					}
					$("#table3")
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

function updateUserLevelById(id) {
	$.ajax({
		data : {
			id : id
		},
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findUserLevelById.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			$("#id4").val(data.id);
			$("#des4").val(data.descriptions);
			$("#min4").val(data.minscores);
			$("#max4").val(data.maxscores);
			var levels = data.levels;
			if (levels == 1) {
				$("#lev4 option[value='1']").attr("selected", "selected");
			} else if (levels == 2) {
				$("#lev4 option[value='2']").attr("selected", "selected");
			} else if (levels == 3) {
				$("#lev4 option[value='3']").attr("selected", "selected");
			} else if (levels == 4) {
				$("#lev4 option[value='4']").attr("selected", "selected");
			} else if (levels == 5) {
				$("#lev4 option[value='5']").attr("selected", "selected");
			} else if (levels == 6) {
				$("#lev4 option[value='6']").attr("selected", "selected");
			} else if (levels == 7) {
				$("#lev4option[value='7']").attr("selected", "selected");
			} else if (levels == 8) {
				$("#lev4 option[value='8']").attr("selected", "selected");
			} else if (levels == 9) {
				$("#lev4 option[value='9']").attr("selected", "selected");
			} else if (levels == 10) {
				$("#lev4 option[value='10']").attr("selected", "selected");
			}
			$('#myModal4').modal('show');
		}
	});
}

function form4submit() {
	var id = $("#id4").val();
	var levels=$("#lev4").val();
	var minscores=$("#min4").val();
	var maxscores=$("#max4").val();
	var descriptions=$("#des4").val();
	$.post(getRootPath() + "/updateUserLevelById.do", {
		id : id,
		levels:levels,
		minscores:minscores,
		maxscores:maxscores,
		descriptions:descriptions
	}, function(data) {
		alert(data);
		$('#myModal4').modal('hide');
		findAllLevel();
	});
}

// 成员管理
function findALlMember() {
	$("#showdata").empty();
	$("#showdata").append('<h3 class="page-header text-info">成员管理</h3>');
	$("#showdata")
			.append(
					'<table id="table4" class="table table-bordered" width="100%"><thead><tr class="text-info"><th height="30px" width="50px" class="th1">姓名</th><th width="130px" class="th1">认证类型</th><th width="100px" class="th1">现所在地</th><th width="100px" class="th1">现今工作</th><th width="100px" class="th1">熟悉领域</th><th width="80px" class="th1">qq</th><th width="100px" class="th2">电话</th><th width="120px" class="th2">博客地址</th><th width="180px" class="th2">成员表述</th><th width="50px">查看</th><th width="50px">操作</th></tr></thead><tbody id="t4"></tbody></table>');
	$
			.ajax({
				type : 'post',
				dataType : 'json',
				url : getRootPath() + '/findALlMember.do',
				cache : false,
				error : function(data) {
					alert("出错了！！");
				},
				success : function(data) {
					for ( var o in data) {
						$("#t4")
								.append(
										"<tr style='font-size: 13px;height: 45px;'><td>"
												+ data[o].membername
												+ "</td><td>"
												+ data[o].identify
												+ "</td><td>"
												+ data[o].nowaddress
												+ "</td><td>"
												+ data[o].nowwork
												+ "</td><td>"
												+ data[o].knowsphere
												+ "</td><td>"
												+ data[o].qq
												+ "</td><td>"
												+ data[o].telephone
												+ "</td><td>"
												+ data[o].blogs
												+ "</td><td>"
												+ data[o].descriptions
												+ "</td><td><button type='button' onclick='findMemberById("
												+ data[o].id
												+ ")' class='btn btn-mini btn-info'>详细</button></td><td><button type='button' onclick='updateMemberById("
												+ data[o].id
												+ ")' class='btn btn-mini btn-info'>修改</button><button type='button' onclick='deleteMemberById("
												+ data[o].id
												+ ")'class='btn btn-mini btn-info'>删除</button></td></tr>");
					}
					$("#table4")
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

function findMemberById(id) {
	$.ajax({
		data : {
			id : id
		},
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findMemberByuserId.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			$("#ide6").text(data.identifyname);
			$("#des6").text(data.descriptions);
			$("#con6").text(data.cotents);
			$("#purl6").text(data.purl);
			$("#nad6").text(data.nowaddress);
			$("#nwo6").text(data.nowwork);
			$("#kws6").text(data.knowsphere);
			$("#ski6").text(data.skills);
			$("#edu6").text(data.educations);
			$("#wbk6").text(data.workbk);
			$("#myp6").text(data.myplan);
			$("#sug6").text(data.suggestions);
			$("#qq6").text(data.qq);
			$("#tel6").text(data.telephone);
			$("#ema6").text(data.email);
			$("#wxh6").text(data.weixinnum);
			$("#blo6").text(data.blogs);
			$("#vit6").text(data.viewtypename);
			$("#pesw6").text(data.pwurl);
			$("#idt6").text(data.indentifytimeString);
			$('#myModal6').modal('show');
		}
	});
}

function updateMemberById(id) {
	$.ajax({
		data : {
			id : id
		},
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findMemberByuserId.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			$("#id7").val(data.id);
			$("#des7").val(data.descriptions);
			$("#con7").val(data.cotents);
			$("#purl7").val(data.purl);
			$("#nad7").val(data.nowaddress);
			$("#nwo7").val(data.nowwork);
			$("#kws7").val(data.knowsphere);
			$("#ski7").val(data.skills);
			$("#edu7").val(data.educations);
			$("#wbk7").val(data.workbk);
			$("#myp7").val(data.myplan);
			$("#sug7").val(data.suggestions);
			$("#qq7").val(data.qq);
			$("#tel7").val(data.telephone);
			$("#ema7").val(data.email);
			$("#wxh7").val(data.weixinnum);
			$("#blo7").val(data.blogs);
			var viewtype = data.viewtype;
			if (viewtype == 0) {
				$("#vit7 option[value='0']").attr("selected", "selected");
			} else if (viewtype == 1) {
				$("#vit7 option[value='1']").attr("selected", "selected");
			} else if (viewtype == 2) {
				$("#vit7 option[value='2']").attr("selected", "selected");
			} else if (viewtype == 3) {
				$("#vit7 option[value='3']").attr("selected", "selected");
			} else {
				$("#vit7 option[value='4']").attr("selected", "selected");
			}
			$("#pesw7").val(data.pwurl);
			$("#idt7").val(data.indentifytimeString);
			$('#myModal7').modal('show');
		}
	});
}

function form7submit() {
	var email = $("#ema7").val();
	if(!checkEmail(email)){
		alert("邮箱格式错误!!");
		return false;
	}
	$.post(getRootPath() + "/updateMemberById.do", {
		id : $("#id7").val(),
		descriptions : $("#des7").val(),
		cotents : $("#con7").val(),
		purl : $("#purl7").val(),
		nowaddress : $("#nad7").val(),
		nowwork : $("#nwo7").val(),
		knowsphere : $("#kws7").val(),
		skills : $("#ski7").val(),
		educations : $("#edu7").val(),
		workbk : $("#wbk7").val(),
		myplan : $("#myp7").val(),
		suggestions : $("#sug7").val(),
		qq : $("#qq7").val(),
		telephone : $("#tel7").val(),
		email : email,
		weixinnum : $("#wxh7").val(),
		blogs : $("#blo7").val(),
		viewtypename : $("#vit7").val(),
		pwurl : $("#pesw7").val(),
		indentifytime : $("#idt7").val()
	}, function(data) {
		alert(data);
		$('#myModal7').modal('hide');
		findALlMember();
	});
}

function deleteMemberById(id) {
	$.post(getRootPath() + "/deleteMemberByuserId.do", {
		id : id
	}, function() {
		findALlMember();
	});
}

//成员认证
function findAllIndentify(){
	$("#showdata").empty();
	$("#showdata").append('<h3 class="page-header text-info">认证管理</h3>');
	$("#showdata").append(' <button class="btn btn-primary" type="button" onclick="addIdentify()">增添认证用户</button>');
	$("#showdata")
			.append(
					'<table id="table5" class="table table-bordered" width="100%"><thead><tr class="text-info"><th>成员姓名</th><th>证件号</th><th>实验室成员届数</th><th>职位</th><th>描述</th><th>操作</th></tr></thead><tbody id="t5"></tbody></table>');
	$
			.ajax({
				type : 'post',
				dataType : 'json',
				url : getRootPath() + '/findAllIndentify.do',
				cache : false,
				error : function(data) {
					alert("出错了！！");
				},
				success : function(data) {
					for ( var o in data) {
						$("#t5")
								.append(
										"<tr style='font-size: 13px;height: 45px;'><td>"
												+ data[o].iname
												+ "</td><td>"
												+ data[o].certnum
												+ "</td><td>"
												+ data[o].sessions
												+ "</td><td>"
												+ data[o].positions
												+ "</td><td>"
												+ data[o].descriptions
												+ "</td><td><button type='button' onclick='updateIdentifyById("
												+ data[o].id
												+ ")'"
												+ " class='btn btn-mini btn-info'>修改</button><button type='button' onclick='deleteIdentifyById("
												+ data[o].id
												+ ")'"
												+ " class='btn btn-mini btn-info'>删除</button></td></tr>");
					}
					$("#table5")
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

function updateIdentifyById(id){
	$.ajax({
		data : {
			id : id
		},
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findIdentifyById.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			$("#id8").val(data.id);
			$("#iname8").val(data.iname);
			$("#certnum8").val(data.certnum);
			$("#sessions8").val(data.sessions);
			$("#descriptions8").val(data.descriptions);
			$("#positions8").val(data.positions);
			$('#myModal8').modal('show');
		}
	});
}

function form8submit(){
	var certnum=$("#certnum8").val();
	if(!isCardNo(certnum)){
		alert("身份证号码格式错误!!");
		return false;
	}
	$.post(getRootPath() + "/updateIdentify1.do", {
		id:$("#id8").val(),
		iname:$("#iname8").val(),
		certnum:certnum,
		sessions:$("#sessions8").val(),
		positions:$("#positions8").val(),
		descriptions:$("#descriptions8").val()
	}, function(data) {
		alert(data);
		$('#myModal8').modal('hide');
		findAllIndentify();
	});
}

function deleteIdentifyById(id){
	$.post(getRootPath() + "/deleteIdentifyById.do", {
		id : id
	}, function() {
		findAllIndentify();
	});
}

function addIdentify(){
	$('#form9')[0].reset();//对表单清空
	$('#myModal9').modal('show');
	
}
function form9submit(){
	var certnum=$("#certnum9").val();
	if(!isCardNo(certnum)){
		alert("身份证号码格式错误!!");
		return false;
	}
	$.post(getRootPath() + "/insertIdentify.do", {
		iname:$("#iname9").val(),
		certnum:$("#certnum9").val(),
		sessions:$("#sessions9").val(),
		positions:$("#positions9").val(),
		descriptions:$("#descriptions9").val()
	}, function(data) {
		alert(data);
		$('#myModal9').modal('hide');
		findAllIndentify();
	});
}
//网站封锁
function closeWebnet(){
	$("#showdata").empty();
	$("#showdata").append('<h3 class="page-header text-info">网站封锁</h3>');
	$("#showdata").append('<div class="btn-group"><button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">网站封锁 <span class="caret"></span></button><ul class="dropdown-menu"><li><a onclick="closeweb(0)">开</a></li><li><a onclick="closeweb(1)">关</a></li> </ul></div>');
}
function closeweb(status){
	$.post(getRootPath() + "/closeoropenweb.do", {
		status : status
	}, function(data) {
		alert(data);
		closeWebnet();
	});
}
//众筹赛事
function competitiomManage() {
	alert("正在开发中!!!!");
	return false;
}
