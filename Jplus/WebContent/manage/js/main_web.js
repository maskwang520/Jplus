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
											+ data.certsnum
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
											+ "</td></tr><tr><td>用户级别:</td><td>"
											+ data.userlevelsString
											+ "</td></tr><tr><td>用户积分:</td><td>"
											+ data.scores
											+ "</td></tr><tr><td align='center' colspan='2'><button type='button' class='btn btn-primary' onclick='updateUserByIdll("
											+ data.id
											+ ")'>修改</button></td></tr>");
				}
			});
}
function updateUserByIdll(id) {
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
			showInfoll(data);
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
	$.post(getRootPath() + '/updateUserByIdl.do', {
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

function showInfoll(data) {
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

// 认证资料
function findMemberIdentify() {
	$("#showdata").empty();
	$("#showdata").append('<h3 class="page-header text-info">认证资料</h3>');
	$("#showdata")
			.append(
					'<table class="table table-bordered" width="50%"><tbody id="t2"></tbody></table>');
	$
			.ajax({
				data : {
					id : $("#userId").val()
				},
				type : 'post',
				dataType : 'json',
				url : getRootPath() + '/findMemberByuserId1.do',
				cache : false,
				error : function(data) {
					alert("出错了！！");
				},
				success : function(data) {
					var viewtype = data.viewtype;
					if (viewtype == 0) {
						viewtype ="所有用户可见";
					} else if (viewtype == 1) {
						viewtype = "Jplus实验室成员可见";
					} else if (viewtype == 2) {
						viewtype ="管理员及指导老师可见";
					} else if (viewtype == 3) {
						viewtype ="仅系统管理员可见";
					} else {
						viewtype ="仅自己可见";
					}
					$("#t2")
							.append(
									"<tr><td width='180px'>真实姓名:</td><td>"
											+ data.membername
											+ "</td></tr><tr><td>认证身份:</td><td>第"
											+ data.sessions
											+ "届"
											+ data.positions
											+ "</td></tr><tr><td>照片:</td><td><img src='"+getRootPath()+data.purl+"' height='40px' width='40' class='img-circle'></td></tr><tr><td>成员描述:</td><td>"
											+ data.descriptions
											+ "</td></tr><tr><td>简介资料:</td><td>"
											+ data.cotents
											+ "</td></tr><tr><td>现今所在地:</td><td>"
											+ data.nowaddress
											+ "</td></tr><tr><td>现今工作:</td><td>"
											+ data.nowwork
											+ "</td></tr><tr><td>未来规划:</td><td>"
											+ data.myplan
											+ "</td></tr><tr><td>熟悉领域:</td><td>"
											+ data.knowsphere
											+ "</td></tr><tr><td>专业技能:</td><td>"
											+ data.skills
											+ "</td></tr><tr><td>教育背景:</td><td>"
											+ data.educations
											+ "</td></tr><tr><td>职业经历:</td><td>"
											+ data.workbk
											+ "</td></tr><tr><td>对师弟妹的建议:</td><td>"
											+ data.suggestions
											+ "</td></tr><tr><td>电话:</td><td>"
											+ data.telephone
											+ "</td></tr><tr><td>QQ:</td><td>"
											+ data.qq
											+ "</td></tr><tr><td>微信号:</td><td>"
											+ data.weixinnum
											+ "</td></tr><tr><td>常用邮箱:</td><td>"
											+ data.email
											+ "</td></tr><tr><td>博客:</td><td>"
											+ data.blogs
											+ "</td></tr><tr><td>个人网站:</td><td>"
											+ data.pwurl
											+ "</td></tr><tr><td>敏感信息可见:</td><td>"
											+ viewtype
											+ "</td></tr><tr><td align='center' colspan='2'><button type='button' class='btn btn-primary' onclick='updateMemberIdebtifyById()'>修改认证资料</button><button type='button' class='btn btn-primary' onclick='updateMemberpulr()'>上传个人照片</button></td></tr>");
				}
			});
}

function updateMemberpulr(){
	$('#myModal13').modal('show');
}
// 判断图片类型
function checkImgType(ths){  
    if (ths.value == "") {  
        alert("请上传图片");  
        return false;  
    }else {  
        if (!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(ths.value)) {  
            alert("图片类型必须是.gif,jpeg,jpg,png中的一种!");  
            ths.value = "";  
            return false;  
        }else{
             var img=new Image(); 
             img.src=filepath;   
             while(true){ 
                 if(img.fileSize>0){ 
                	 if(img.fileSize>5*1024){       
                		 alert("图片不大于5M!"); 
                		 return false; 
                      } 
                      break; 
                  } 
             }
          }
    }  
    return true;  
}  
function form13submit(){
	// 判断是否选择照片
	 var file=$("#file");
     if($.trim(file.val())==''){
            alert("请选择照片!");
            return false;
      }
 		var elementIds = ["file"]; // flag为id、name属性名
 		$.ajaxFileUpload({
 			url : getRootPath() + '/uploadPicture.do',
 			type : 'post',
 			data: {
 				id:$("#id13").val()
 			},
 			secureuri : false, // 一般设置为false
 			fileElementId : 'file', // 上传文件的id、name属性名
 			dataType : 'text', // 返回值类型，一般设置为json、application/json
 			elementIds : elementIds, // 传递参数到服务器
 			success : function(data, status) {
 				if(status=="success"){
	 				alert(data);
	 				$('#myModal13').modal('hide');
	 				findMemberIdentify();
 				}else{
 					alert("上传失败");
 				}
 			},
 			error : function(data, status, e) {
 				alert(e);
 			}
 		});
}
function updateMemberIdebtifyById() {
	$.ajax({
		data : {
			id : $("#userId").val()
		},
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findMemberByuserId1.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			showInfo2(data);
			$('#myModal3').modal('show');
		}
	});
}

function showInfo2(data){
	$("#id3").val(data.id);
	$("#inm3").text(data.membername);
	$("#ses3").val(data.sessions);
	$("#des3").val(data.descriptions);
	$("#cte3").val(data.cotents);
	$("#nad3").val(data.nowaddress);
	$("#nwk3").val(data.nowwork);
	$("#myp3").val(data.myplan);
	$("#knw3").val(data.knowsphere);
	$("#ski3").val(data.skills);
	$("#wbk3").val(data.workbk);
	$("#sug3").val(data.suggestions);
	$("#qq3").val(data.qq);
	$("#wxn3").val(data.weixinnum);
	$("#ema3").val(data.email);
	$("#edu3").val(data.educations);
	$("#blo3").val(data.blogs);
	$("#pwu3").val(data.pwurl);
	var viewtype=data.viewtype;
	if (viewtype == 0) {
		$("#viw3 option[value='0']").attr("selected", "selected");
	} else if (viewtype == 1) {
		$("#viw3 option[value='1']").attr("selected", "selected");
	} else if (viewtype== 2) {
		$("#viw3 option[value='2']").attr("selected", "selected");
	}else if (viewtype == 3) {
		$("#viw3 option[value='3']").attr("selected", "selected");
	}else if (viewtype == 4) {
		$("#viw3 option[value='4']").attr("selected", "selected");
	}
}

function form3submit() {
	var sessions=$("#ses3").val();
	if(sessions==null){
		alert("认证身份没有填写!");
		return false;
	}
	var email= $("#ema3").val();
	if(!checkEmail(email)){
		alert("邮箱格式错误!!");
		return false;
	}
	$.post(getRootPath() + "/updateMemberById1.do", {
		id : $("#id3").val(),
		sessions:sessions,
		descriptions:$("#des3").val(),
		cotents:$("#cte3").val(),
		nowaddress:$("#nad3").val(),
		nowwork:$("#nwk3").val(),
		myplan:$("#myp3").val(),
		knowsphere:$("#knw3").val(),
		skills:$("#ski3").val(),
		workbk:$("#wbk3").val(),
		suggestions:$("#sug3").val(),
		qq:$("#qq3").val(),
		weixinnum:$("#wxn3").val(),
		email :email,
		educations : $("#edu3").val(),
		blogs : $("#blo3").val(),
		pwurl : $("#pwu3").val(),
		viewtype : $("#viw3").val()
	}, function(data) {
		alert(data);
		$('#myModal3').modal('hide');
		findMemberIdentify();
	});
}
// 查看通讯录
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
// 发布招聘消息
function addWorknwe(){
	alert("正在开发!!");
	return false;
}
// 用户访问量修改
function findUserAccess(){
	$("#showdata").empty();
	$("#showdata").append('<h3 class="page-header text-info">用户访问量 </h3>');
	$("#showdata")
			.append(
					'<table id="table4" class="table table-bordered" width="100%"><thead><tr class="text-info"><th height="30px" width="50px">名称</th><th width="50px">访问量</th><th width="50px">最大访问量</th><th width="120px">最大访问量日期</th><th width="100px">描述</th><th width="150px">操作</th></thead><tbody id="t4"></tbody></table>');
	$
			.ajax({
				type : 'post',
				dataType : 'json',
				url : getRootPath() + '/findUserAccess.do',
				cache : false,
				error : function(data) {
					alert("出错了！！");
				},
				success : function(data) {
					for ( var o in data) {
					$("#t4")
						.append(
								"<tr style='font-size: 13px;height: 45px;'><td>"
										+ data[o].as_name
										+ "</td><td>"
										+ data[o].as_sum
										+ "</td><td>"
										+ data[o].as_max
										+ "</td><td>"
										+ data[o].as_maxdate
										+ "</td><td>"
										+ data[o].as_description
										+ "</td><td><button type='button' onclick='updateUserAccess("
										+ data[o].id
										+ ")'"
										+ " class='btn btn-mini btn-info'>修改</button></td></tr>");
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
								"aaSorting": [
									[ 1, "asc"]
									],
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

function updateUserAccess(id){
	$.ajax({
		data : {
			id : id
		},
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findUserAccessById.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			$("#id4").val(data.id);
			$("#ana4").text(data.as_name);
			$("#asum4").val(data.as_sum);
			$("#amax4").val(data.as_max);
			$("#amd4").val(data.as_maxdate);
			$("#ade4").val(data.as_description);
			$('#myModal4').modal('show');
		}
	});
}
function form4submit(){
	$.post(getRootPath() + "/updateUserAccess.do", {
		id : $("#id4").val(),
		as_sum:$("#asum4").val(),
		as_max:$("#amax4").val(),
		as_maxdate:$("#amd4").val(),
		as_description:$("#ade4").val()
	}, function(data) {
		alert(data);
		$('#myModal4').modal('hide');
		findUserAccess();
	});
}
//添加友链
function addFriendLink(){
	$('#formfl')[0].reset();// 对表单清空
	$('#myModalfriendlink').modal('show');
}
function formflsubmit(){
	$.post(getRootPath() + "/addFriendLink.do", {
		fl_name:$("#flname1d").val(),
		fl_url:$("#flurl").val(),
		fl_des:$("#fldes1d").val()
	}, function(data) {
		alert(data);
		$('#myModalfriendlink').modal('hide');
		findFriendlink();
	});
}

// 友情链接修改
function findFriendlink(){
	$("#showdata").empty();
	$("#showdata").append('<h3 class="page-header text-info">友情链接 </h3>');
	$("#showdata").append(' <button class="btn btn-primary" type="button" onclick="addFriendLink()">添加友链</button>');
	$("#showdata")
	.append(
	'<table id="table5" class="table table-bordered" width="100%"><thead><tr class="text-info"><th height="30px" width="150px">名称</th><th width="80px">URL</th><th width="150px">描述</th><th width="50px">操作</th></thead><tbody id="t5"></tbody></table>');
	$
	.ajax({
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findFriendlink.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			for ( var o in data) {
				$("#t5")
				.append(
						"<tr style='font-size: 13px;height: 45px;'><td>"
						+ data[o].fl_name
						+ "</td><td>"
						+ data[o].fl_url
						+ "</td><td>"
						+ data[o].fl_descriptions
						+ "</td><td><button type='button' onclick='updateFriendlink("
						+ data[o].id
						+ ")'"
						+ " class='btn btn-mini btn-info'>修改</button></td></tr>");
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

function updateFriendlink(id){
	$.ajax({
		data : {
			id : id
		},
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findFriendlinkById.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			$("#id5").val(data.id);
			$("#fname5").val(data.fl_name);
			$("#furl5").val(data.fl_url);
			$("#fdes5").val(data.fl_descriptions);
			$('#myModal5').modal('show');
		}
	});
}
function form5submit(){
	$.post(getRootPath() + "/updateFriendlink1.do", {
		id:$("#id5").val(),
		fl_name:$("#fname5").val(),
		fl_url:$("#furl5").val(),
		fl_descriptions:$("#fdes5").val()
	}, function(data) {
		alert(data);
		$('#myModal5').modal('hide');
		findFriendlink();
	});
}
// 网站静态图片地址修改
function findNetPurl(){
	$("#showdata").empty();
	$("#showdata").append('<h3 class="page-header text-info">网站静态图片地址 </h3>');
	$("#showdata")
	.append(
	'<table id="table6" class="table table-bordered" width="100%"><thead><tr class="text-info"><th height="30px" width="120px">图片名称</th><th width="80px">图片URL</th><th width="150px">描述</th><th width="50px">操作</th></thead><tbody id="t6"></tbody></table>');
	$
	.ajax({
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findNetPurl.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			for ( var o in data) {
				$("#t6")
				.append(
						"<tr style='font-size: 13px;height: 45px;'><td>"
						+ data[o].np_title
						+ "</td><td>"
						+ data[o].np_url
						+ "</td><td>"
						+ data[o].np_description
						+ "</td><td><button type='button' onclick='updateNetPurl("
						+ data[o].id
						+ ")'"
						+ " class='btn btn-mini btn-info'>修改</button></td></tr>");
			}
			$("#table6")
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
function updateNetPurl(id){
	$.ajax({
		data : {
			id : id
		},
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findNetPurlById.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			$("#id6").val(data.id);
			$("#ntitle6").val(data.np_title);
			$("#nurl6").val(data.np_url);
			$("#ndes6").val(data.np_description);
			$('#myModal6').modal('show');
		}
	});
}
function form6submit(){
	$.post(getRootPath() + "/updateNetPurl.do", {
		id:$("#id6").val(),
		np_title:$("#ntitle6").val(),
		np_url:$("#nurl6").val(),
		np_description:$('#ndes6').val()
	}, function(data) {
		alert(data);
		$('#myModal6').modal('hide');
		findNetPurl();
	});
}

//添加案例
function addAL(){
	$('#formAL')[0].reset();// 对表单清空
	$('#myModalAL').modal('show');
}

// 合作案例管理
function findNavUrl(){
	$("#showdata").empty();
	$("#showdata").append('<h3 class="page-header text-info">合作案例管理</h3>');
	$("#showdata").append(' <button class="btn btn-primary" type="button" onclick="addAL()">添加案例</button>');
	$("#showdata")
	.append(
	'<table id="table7" class="table table-bordered" width="100%"><thead><tr class="text-info"><th height="30px" width="80px">导航名字</th><th width="120px">导航标题</th><th width="80px">导航URL</th><th width="150px">描述</th><th width="50px">操作</th></thead><tbody id="t7"></tbody></table>');
	$
	.ajax({
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findNavUrl.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			for ( var o in data) {
				$("#t7")
				.append(
						"<tr style='font-size: 13px;height: 45px;'><td>"
						+ data[o].n_name
						+ "</td><td>"
						+ data[o].n_title
						+ "</td><td>"
						+ data[o].n_url
						+ "</td><td>"
						+ data[o].n_descriptions
						+ "</td><td><button type='button' onclick='updateNavUrl("
						+ data[o].id
						+ ")'"
						+ " class='btn btn-mini btn-info'>修改</button></td></tr>");
			}
			$("#table7")
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

function updateNavUrl(id){
	$.ajax({
		data : {
			id : id
		},
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findNavUrlById.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			$("#id7").val(data.id);
			$("#nname7").val(data.n_name);
			$("#ntitle7").val(data.n_title);
			$("#nurl7").val(data.n_url);
			$("#ndes7").val(data.n_descriptions);
			$('#myModal7').modal('show');
		}
	});
}
function form7submit(){
	$.post(getRootPath() + "/updateNavUrl.do", {
		id:$("#id7").val(),
		n_name:$("#nname7").val(),
		n_title:$("#ntitle7").val(),
		n_url:$("#nurl7").val(),
		n_descriptions:$("#ndes7").val()
	}, function(data) {
		alert(data);
		$('#myModal7').modal('hide');
		findNavUrl();
	});
}


//合作单位
function addBs(){
	$('#formDL')[0].reset();// 对表单清空
	$('#myModalDL').modal('show');
}

// 合作单位管理
function findBbsRecommend(){
	$("#showdata").empty();
	$("#showdata").append('<h3 class="page-header text-info">合作单位管理</h3>');
	$("#showdata").append(' <button class="btn btn-primary" type="button" onclick="addBs()">添加单位</button>');
	$("#showdata")
	.append(
	'<table id="table8" class="table table-bordered" width="100%"><thead><tr class="text-info"><th height="30px" width="120px">板块名称</th><th width="80px">板块标题</th><th width="80px">板块URL</th><th width="80px">板块图标地址</th><th width="150px">描述</th><th width="50px">操作</th></thead><tbody id="t8"></tbody></table>');
	$
	.ajax({
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findBbsRecommend.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			for ( var o in data) {
				$("#t8")
				.append(
						"<tr style='font-size: 13px;height: 45px;'><td>"
						+ data[o].vr_name
						+ "</td><td>"
						+ data[o].vr_title
						+ "</td><td>"
						+ data[o].vr_url
						+ "</td><td>"
						+ data[o].vr_purl
						+ "</td><td>"
						+ data[o].vr_descriptions
						+ "</td><td><button type='button' onclick='updateBbsRecommend("
						+ data[o].id
						+ ")'"
						+ " class='btn btn-mini btn-info'>修改</button></td></tr>");
			}
			$("#table8")
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
function updateBbsRecommend(id){
	$.ajax({
		data : {
			id : id
		},
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findBbsRecommendById.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			$("#id8").val(data.id);
			$("#vname8").val(data.vr_name);
			$("#vtitle8").val(data.vr_title);
			$("#vurl8").val(data.vr_url);
			$("#vpurl8").val(data.vr_purl);
			$("#vdes8").val(data.vr_descriptions);
			$('#myModal8').modal('show');
		}
	});
}
function form8submit(){
	$.post(getRootPath() + "/updateBbsRecommend.do", {
		id:$("#id8").val(),
		vr_name:$("#vname8").val(),
		vr_title:$("#vtitle8").val(),
		vr_url:$("#vurl8").val(),
		vr_purl:$("#vpurl8").val(),
		vr_descriptions:$("#vdes8").val()
	}, function(data) {
		alert(data);
		$('#myModal8').modal('hide');
		findBbsRecommend();
	});
}
// 专辑推荐修改
function findVedioRecommend(){
	$("#showdata").empty();
	$("#showdata").append('<h3 class="page-header text-info">专辑推荐</h3>');
	$("#showdata")
	.append(
	'<table id="table9" class="table table-bordered" width="100%"><thead><tr class="text-info"><th height="30px" width="120px">专辑名称</th><th width="80px">专辑标题</th><th width="80px">专辑URL</th><th width="80px">专辑图标地址</th><th width="150px">描述</th><th width="50px">操作</th></thead><tbody id="t9"></tbody></table>');
	$
	.ajax({
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findVedioRecommend.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			for ( var o in data) {
				$("#t9")
				.append(
						"<tr style='font-size: 13px;height: 45px;'><td>"
						+ data[o].vr_name
						+ "</td><td>"
						+ data[o].vr_title
						+ "</td><td>"
						+ data[o].vr_url
						+ "</td><td>"
						+ data[o].vr_purl
						+ "</td><td>"
						+ data[o].vr_descriptions
						+ "</td><td><button type='button' onclick='updateVedioRecommend("
						+ data[o].id
						+ ")'"
						+ " class='btn btn-mini btn-info'>修改</button></td></tr>");
			}
			$("#table9")
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
function updateVedioRecommend(id){
	$.ajax({
		data : {
			id : id
		},
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findVedioRecommendId.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			$("#id9").val(data.id);
			$("#vname9").val(data.vr_name);
			$("#vtitle9").val(data.vr_title);
			$("#vurl9").val(data.vr_url);
			$("#vpurl9").val(data.vr_purl);
			$("#vdes9").val(data.vr_descriptions);
			$('#myModal9').modal('show');
		}
	});
}
function form9submit(){
	$.post(getRootPath() + "/updateVedioRecommend.do", {
		id:$("#id9").val(),
		vr_name:$("#vname9").val(),
		vr_title:$("#vtitle9").val(),
		vr_url:$("#vurl9").val(),
		vr_purl:$("#vpurl9").val(),
		vr_descriptions:$("#vdes9").val()
	}, function(data) {
		alert(data);
		$('#myModal9').modal('hide');
		findVedioRecommend();
	});
}
// 使用工具官方推荐
function findToolRecommend(){
	$("#showdata").empty();
	$("#showdata").append('<h3 class="page-header text-info">实用工具官方推荐</h3>');
	$("#showdata")
	.append(
	'<table id="table10" class="table table-bordered" width="100%"><thead><tr class="text-info"><th height="30px" width="120px">工具名称</th><th width="80px">工具标题</th><th width="80px">工具URL</th><th width="80px">工具图标地址</th><th width="150px">描述</th><th width="50px">操作</th></thead><tbody id="t10"></tbody></table>');
	$
	.ajax({
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findToolRecommend.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			for ( var o in data) {
				$("#t10")
				.append(
						"<tr style='font-size: 13px;height: 45px;'><td>"
						+ data[o].tr_name
						+ "</td><td>"
						+ data[o].tr_title
						+ "</td><td>"
						+ data[o].tr_url
						+ "</td><td>"
						+ data[o].tr_purl
						+ "</td><td>"
						+ data[o].tr_descriptions
						+ "</td><td><button type='button' onclick='updateToolRecommend("
						+ data[o].id
						+ ")'"
						+ " class='btn btn-mini btn-info'>修改</button></td></tr>");
			}
			$("#table10")
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
function updateToolRecommend(id){
	$.ajax({
		data : {
			id : id
		},
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findToolRecommendById.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			$("#id10").val(data.id);
			$("#tname10").val(data.tr_name);
			$("#ttitle10").val(data.tr_title);
			$("#turl10").val(data.tr_url);
			$("#tpurl10").val(data.tr_purl);
			$("#tdes10").val(data.tr_descriptions);
			$('#myModal10').modal('show');
		}
	});
}
function form10submit(){
	$.post(getRootPath() + "/updateToolRecommend.do", {
		id:$("#id10").val(),
		tr_name:$("#tname10").val(),
		tr_title:$("#ttitle10").val(),
		tr_url:$("#turl10").val(),
		tr_purl:$("#tpurl10").val(),
		tr_descriptions:$("#tdes10").val()
	}, function(data) {
		alert(data);
		$('#myModal10').modal('hide');
		findToolRecommend();
	});
}
// 公告管理
function findNotices(){
	$("#showdata").empty();
	$("#showdata").append('<h3 class="page-header text-info">公告管理</h3>');
	$("#showdata").append(' <button class="btn btn-primary" type="button" onclick="addNotices()">发布公告</button>');
	$("#showdata")
	.append(
	'<table id="table1a" class="table table-bordered" width="100%"><thead><tr class="text-info"><th height="30px" width="120px">发布人</th><th width="80px">公告标题</th><th width="80px">公告内容</th><th width="150px">发布时间</th><th width="50px">操作</th></thead><tbody id="t1a"></tbody></table>');
	$
	.ajax({
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findNotices.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			for ( var o in data) {
				var contend=data[o].n_content;
				var length=contend.length;
				if(length>35){
					contend=contend.substring(0,35)+"..<span class='text-info'>【点击修改查看详细】</span>";
				}
				$("#t1a")
					.append(
						"<tr style='font-size: 13px;height: 45px;'><td>"
						+ data[o].realname
						+ "</td><td>"
						+ data[o].n_title
						+ "</td><td style='overflow-y: scroll;height:45px;'>"
						+ contend
						+ "</td><td>"
						+ data[o].n_reltime
						+ "</td><td><button type='button' onclick='updateNotices("
						+ data[o].id
						+ ")'"
						+ " class='btn btn-mini btn-info'>修改</button><button type='button' onclick='deleteNotices("
						+ data[o].id
						+ ")'"
						+ " class='btn btn-mini btn-info'>删除</button></td></tr>");
			}
			$("#table1a")
				.dataTable(
					{
						"bInfo" : true,
						"sPaginationType" : "full_numbers",
						"bPaginate" : true,
						"bLengthChange" : true,
						"iDisplayLength" : 10,
						"aLengthMenu" : [ 5, 10, 20, 50, 100 ],
						"bProcessing" : true,
						"aaSorting": [[ 3, "desc"]],
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
function updateNotices(id){
	$.ajax({
		data : {
			id : id
		},
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findNoticesById.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			$("#id1a").val(data.id);
			$("#jname1a").val(data.n_title);
			$("#jcontent1a").val(data.n_content);
			$("#jtime1a").val(data.n_reltime);
			$('#myModal1a').modal('show');
		}
	});
}
function form1asubmit(){
	$.post(getRootPath() + "/updateNotices.do", {
		id:$("#id1a").val(),
		n_title:$("#jname1a").val(),
		n_content:$("#jcontent1a").val(),
		n_reltime:$("#jtime1a").val()
	}, function(data) {
		alert(data);
		$('#myModal1a').modal('hide');
		findNotices();
	});
}
function deleteNotices(id){
	$.post(getRootPath() + "/deleteNotices.do", {
		id : id
	}, function(data) {
		alert(data);
		findNotices();
	});
}
// 发布公告
function addNotices(){
	$('#form1b')[0].reset();// 对表单清空
	$('#myModal1b').modal('show');
}
function form1bsubmit(){
	$.post(getRootPath() + "/addNotices.do", {
		userId:$("#userId").val(),
		n_title:$("#jname1b").val(),
		n_content:$("#jcontent1b").val(),
		n_reltime:$("#jtime1b").val()
	}, function(data) {
		alert(data);
		$('#myModal1b').modal('hide');
		findNotices();
	});
}

// 任务管理
function findTaks(){
	$("#showdata").empty();
	$("#showdata").append('<h3 class="page-header text-info">任务管理</h3>');
	$("#showdata").append(' <button class="btn btn-primary" type="button" onclick="addTasks()">发布任务</button>');
	$("#showdata")
	.append(
	'<table id="table1c" class="table table-bordered" width="100%"><thead><tr class="text-info"><th height="30px" width="120px">发布人</th><th width="80px">任务标题</th><th width="80px">任务内容</th><th width="80px">任务描述</th><th width="150px">发布时间</th><th width="50px">操作</th></thead><tbody id="t1c"></tbody></table>');
	$
	.ajax({
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findTaks.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			for ( var o in data) {
				var contend=data[o].n_content;
				var length=contend.length;
				if(length>35){
					contend=contend.substring(0,35)+"..<span class='text-info'>【点击修改查看详细】</span>";
				}
				$("#t1c")
					.append(
						"<tr style='font-size: 13px;height: 45px;'><td>"
						+ data[o].realname
						+ "</td><td>"
						+ data[o].n_title
						+ "</td><td>"
						+ contend
						+ "</td><td>"
						+ data[o].n_des
						+ "</td><td>"
						+ data[o].n_reltime
						+ "</td><td><button type='button' onclick='updateTasks("
						+ data[o].id
						+ ")'"
						+ " class='btn btn-mini btn-info'>修改</button><button type='button' onclick='deleteTasks("
						+ data[o].id
						+ ")'"
						+ " class='btn btn-mini btn-info'>删除</button></td></tr>");
			}
			$("#table1c")
				.dataTable(
					{
						"bInfo" : true,
						"sPaginationType" : "full_numbers",
						"bPaginate" : true,
						"bLengthChange" : true,
						"iDisplayLength" : 10,
						"aLengthMenu" : [ 5, 10, 20, 50, 100 ],
						"bProcessing" : true,
						"aaSorting": [[ 4, "desc"]],
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
function updateTasks(id){
	$.ajax({
		data : {
			id : id
		},
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findTasksById.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			$("#id1c").val(data.id);
			$("#jname1c").val(data.n_title);
			$("#jcontent1c").val(data.n_content);
			$("#jdes1c").val(data.n_des);
			$("#jtime1c").val(data.n_reltime);
			$('#myModal1c').modal('show');
		}
	});
}
function form1csubmit(){
	$.post(getRootPath() + "/updateTasks.do", {
		id:$("#id1c").val(),
		n_title:$("#jname1c").val(),
		n_content:$("#jcontent1c").val(),
		n_des:$("#jdes1c").val(),
		n_reltime:$("#jtime1c").val()
	}, function(data) {
		alert(data);
		$('#myModal1c').modal('hide');
		findTaks();
	});
}
function deleteTasks(id){
	$.post(getRootPath() + "/deleteTasks.do", {
		id : id
	}, function(data) {
		alert(data);
		findTaks();
	});
}
// 发布公告
function addTasks(){
	$('#form1d')[0].reset();// 对表单清空
	$('#myModal1d').modal('show');
}
function form1dsubmit(){
	$.post(getRootPath() + "/addTasks.do", {
		userId:$("#userId").val(),
		n_title:$("#jname1d").val(),
		n_content:$("#jcontent1d").val(),
		n_des:$("#jdes1d").val(),
		n_reltime:$("#jtime1d").val()
	}, function(data) {
		alert(data);
		$('#myModal1d').modal('hide');
		findTaks();
	});
}
// 资源类目管理
function findResclass(){
	$("#showdata").empty();
	$("#showdata").append('<h3 class="page-header text-info">资源类目管理</h3>');
	$("#showdata").append(' <button class="btn btn-primary" type="button" onclick="addResclass()">添加资源类目</button>');
	$("#showdata")
	.append(
	'<table id="tablet1" class="table table-bordered" width="100%"><thead><tr class="text-info"><th height="30px" width="120px">资源类目名称</th><th width="80px">资源描述</th><th width="80px">百度云下载</th><th width="80px">本地下载</th><th width="80px">360下载</th><th width="150px">资源图片</th><th width="50px">操作</th></thead><tbody id="tt1"></tbody></table>');
	$
	.ajax({
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findResclass.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			for ( var o in data) {
				$("#tt1")
					.append(
						"<tr style='font-size: 13px;height: 45px;'><td>"
						+ data[o].resname
						+ "</td><td>"
						+ data[o].resdescription
						+ "</td><td>"
						+ data[o].isbdydown
						+ "</td><td>"
						+ data[o].is360down
						+ "</td><td>"
						+ data[o].islocationdown
						+ "</td><td>"
						+ data[o].respurl
						+ "</td><td><button type='button' onclick='updateResclass("
						+ data[o].id
						+ ")'"
						+ " class='btn btn-mini btn-info'>修改</button><button type='button' onclick='deleteResclass("
						+ data[o].id
						+ ")'"
						+ " class='btn btn-mini btn-info'>删除</button></td></tr>");
			}
			$("#tablet1")
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
function updateResclass(id){
	$.ajax({
		data : {
			id : id
		},
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findResclassById.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			$("#idt1").val(data.id);
			$("#rnamet1").val(data.resname);
			$("#rdest1").val(data.resdescription);
			if (data.isbdydown ==1) {
				$("#isbdyt1 option[value='1']").attr("selected", "selected");
			} else if (data.isbdydown == 0) {
				$("#isbdyt1 option[value='0']").attr("selected", "selected");
			}
			if (data.is360down ==1) {
				$("#is360t1 option[value='1']").attr("selected", "selected");
			} else if (data.is360down == 0) {
				$("#is360t1 option[value='0']").attr("selected", "selected");
			}
			if (data.islocationdown ==1) {
				$("#isloct1 option[value='1']").attr("selected", "selected");
			} else if (data.islocationdown == 0) {
				$("#isloct1 option[value='0']").attr("selected", "selected");
			}
			$("#rpurlt1").val(data.respurl);
			$('#myModalt1').modal('show');
		}
	});
}
function formt1submit(){
	$.post(getRootPath() + "/updateResclass.do", {
		id:$("#idt1").val(),
		resname:$("#rnamet1").val(),
		resdescription:$("#rdest1").val(),
		isbdydown:$("#isbdyt1").val(),
		is360down:$("#is360t1").val(),
		islocationdown:$("#isloct1").val(),
		respurl:$("#rpurlt1").val()
	}, function(data) {
		alert(data);
		$('#myModalt1').modal('hide');
		findResclass();
	});
}
function deleteResclass(id){
	$.post(getRootPath() + "/deleteResclass.do", {
		id : id
	}, function(data) {
		alert(data);
		findResclass();
	});
}
// 添加资源类目
function addResclass(){
	$('#formt2')[0].reset();// 对表单清空
	$('#myModalt2').modal('show');
}
function formt2submit(){
	$.post(getRootPath() + "/addResclass.do", {
		resname:$("#rnamet2").val(),
		resdescription:$("#rdest2").val(),
		isbdydown:$("#isbdyt2").val(),
		is360down:$("#is360t2").val(),
		islocationdown:$("#isloct2").val(),
		respurl:$("#rdest2").val()
	}, function(data) {
		alert(data);
		$('#myModalt2').modal('hide');
		findResclass();
	});
}
// 资源管理
function findRes(){
	$("#showdata").empty();
	$("#showdata").append('<h3 class="page-header text-info">资源管理</h3>');
	$("#showdata").append(' <button class="btn btn-primary" type="button" onclick="addRes()">添加资源</button>');
	$("#showdata")
	.append(
	'<table id="tablet3" class="table table-bordered" width="100%"><thead><tr class="text-info"><th height="30px" width="50px">名称</th><th width="50px">分类</th><th width="80px">描述</th><th width="85px">百度云网盘地址</th><th width="85px">百度云提取码</th><th width="85px">360云盘地址</th><th width="85px">360云盘提取码</th><th width="85px">本地下载</th><th width="45px">下载量</th><th width="25px">积分</th><th width="50px">作者</th><th width="75px">上传时间</th><th width="35px">审核</th><th width="20px">赞</th><th width="50px">操作</th></thead><tbody id="tt3"></tbody></table>');
	$
	.ajax({
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findRes.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			for ( var o in data) {
				$("#tt3")
					.append(
						"<tr style='font-size: 13px;height: 45px;'><td>"
						+ data[o].resname
						+ "</td><td>"
						+ data[o].resClass
						+ "</td><td>"
						+ data[o].resdescription
						+ "</td><td>"
						+ data[o].res_bdypath
						+ "</td><td>"
						+ data[o].res_bdypassword
						+ "</td><td>"
						+ data[o].res_360path
						+ "</td><td>"
						+ data[o].res_360password
						+ "</td><td>"
						+ data[o].res_locationpath
						+ "</td><td>"
						+ data[o].downloadnum
						+ "</td><td>"
						+ data[o].downloadscore
						+ "</td><td>"
						+ data[o].username
						+ "</td><td>"
						+ data[o].resdate
						+ "</td><td>"
						+ data[o].resstate
						+ "</td><td>"
						+ data[o].resdiscuss
						+ "</td><td><button type='button' onclick='updateRes("
						+ data[o].id
						+ ")'"
						+ " class='btn btn-mini btn-info'>修改</button><button type='button' onclick='deleteRes("
						+ data[o].id
						+ ")'"
						+ " class='btn btn-mini btn-info'>删除</button></td></tr>");
			}
			$("#tablet3")
				.dataTable(
					{
						"bInfo" : true,
						"sPaginationType" : "full_numbers",
						"bPaginate" : true,
						"bLengthChange" : true,
						"iDisplayLength" : 10,
						"aLengthMenu" : [ 5, 10, 20, 50, 100 ],
						"bProcessing" : true,
						"aaSorting": [[ 11, "desc"]],
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
function updateRes(id){
	$.ajax({
		data : {
			id : id
		},
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findResById.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		beforeSend:function(){
			$.post(getRootPath() + "/findResclassname.do", function(data) {
				// 对于post和get方式记得现将传回来的数据进行json格式的转换
				var d=eval("("+data+")");
				$("#rct3").empty();
				for ( var o in d) {
					$("#rct3").append("<option value='"+d[o].id+"'>"+d[o].resname+"</option>");
				}
			});
		},
		success : function(data) {
			$("#idt3").val(data.id);
			$("#rnt3").val(data.resname);
			$("#rct3").val(data.resclassId);
			$("#rdt3").val(data.resdescription);
			$("#rbut3").val(data.resBdypath);
			$("#rbpt3").val(data.resBdypassword);
			$("#r3ut3").val(data.res360path);
			$("#r3pt3").val(data.res360password);
			$("#rlt3").val(data.resLocationpath);
			$("#rlnt3").val(data.downloadnum);
			$("#rsot3").val(data.downloadscore);
			$("#rdat3").val(data.resdate1);
			if (data.resstate ==0) {
				$("#rstt3 option[value='0']").attr("selected", "selected");
			} else if (data.resstate == 1) {
				$("#rstt3 option[value='1']").attr("selected", "selected");
			}else if(data.resstate == 2){
				$("#rstt3 option[value='2']").attr("selected", "selected");
			}
			$("#rdit3").val(data.resdiscuss);
			$('#myModalt3').modal('show');
		}
	});
}

function formt3submit(){
	$.post(getRootPath() + "/updateRes.do", {
		id:$("#idt3").val(),
		resname:$("#rnt3").val(),
		resClass:$("#rct3").val(),
		resdescription:$("#rdt3").val(),
		res_bdypath:$("#rbut3").val(),
		res_bdypassword:$("#rbpt3").val(),
		res_360path:$("#r3ut3").val(),
		res_360password:$("#r3pt3").val(),
		res_locationpath:$("#rlt3").val(),
		downloadnum:$("#rlnt3").val(),
		downloadscore:$("#rsot3").val(),
		resdate:$("#rdat3").val(),
		resstate:$("#rstt3").val(),
		resdiscuss:$("#rdit3").val()
	}, function(data) {
		alert(data);
		$('#myModalt3').modal('hide');
		findRes();
	});
}
function deleteRes(id){
	$.post(getRootPath() + "/deleteRes.do", {
		id : id
	}, function(data) {
		alert(data);
		findRes();
	});
}
function addRes(){
	$('#formt4')[0].reset();// 对表单清空
	$.post(getRootPath() + "/findResclassname.do", function(data) {
		// 对于post和get方式记得现将传回来的数据进行json格式的转换
		var d=eval("("+data+")");
		$("#rct4").empty();
		for ( var o in d) {
			$("#rct4").append("<option value='"+d[o].id+"'>"+d[o].resname+"</option>");
		}
	});
	$('#myModalt4').modal('show');
}
function formt4submit(){
	$.post(getRootPath() + "/addRes.do", {
		userId:$("#userId").val(),
		resname:$("#rnt4").val(),
		resClass:$("#rct4").val(),
		resdescription:$("#rdt4").val(),
		res_bdypath:$("#rbut4").val(),
		res_bdypassword:$("#rbpt4").val(),
		res_360path:$("#r3ut4").val(),
		res_360password:$("#r3pt4").val(),
		res_locationpath:$("#rlt4").val(),
		downloadnum:$("#rlnt4").val(),
		downloadscore:$("#rsot4").val(),
		resdate:$("#rdat4").val(),
		resstate:$("#rstt4").val(),
		resdiscuss:$("#rdit4").val()
	}, function(data) {
		alert(data);
		$('#myModalt4').modal('hide');
		findRes();
	});
}
// jplus简介管理
function findJplusDes(){
	$("#showdata").empty();
	$("#showdata").append('<h3 class="page-header text-info">Jplus简介</h3>');
	$("#showdata")
	.append(
	'<table class="table table-bordered" width="100%"><thead><tr class="text-info"><th height="30px" width="80px">标题</th><th width="180px">内容</th><th width="80px">发布时间</th><th width="60px">发布作者</th><th width="50px">操作</th></thead><tbody id="tt5"></tbody></table>');
	$.ajax({
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findJplusDes.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			for ( var o in data) {
				$("#tt5")
					.append(
						"<tr style='font-size: 13px;height: 45px;'><td>"
						+ data[o].jd_title
						+ "</td><td>"
						+ data[o].jd_content
						+ "</td><td>"
						+ data[o].jd_reltime
						+ "</td><td>"
						+ data[o].jd_author
						+ "</td><td><button type='button' onclick='updateJplusDes("
						+ data[o].id
						+ ")'"
						+ " class='btn btn-mini btn-info'>修改</button></td></tr>");
			}
		}
	});
}
function updateJplusDes(id){
	$.ajax({
		data : {
			id : id
		},
		type : 'post',
		dataType : 'json',
		url : getRootPath() + '/findJplusDesById.do',
		cache : false,
		error : function(data) {
			alert("出错了！！");
		},
		success : function(data) {
			$("#idt5").val(data.id);
			$("#jdt5").val(data.jd_title);
			$("#jdc5").text(data.jd_content);
			$("#jdr5").val(data.jd_reltime);
			$('#myModalt5').modal('show');
		}
	});
}
function formt5submit(){
	$.post(getRootPath() + "/updateJplusDes.do", {
		id:$("#idt5").val(),
		jd_title:$("#jdt5").val(),
		jd_content:$("#jdc5").val(),
		jd_reltime:$("#jdr5").val()
	}, function(data) {
		alert(data);
		$('#myModalt5').modal('hide');
		findJplusDes();
	});
}

//用户管理
function findAllUsers() {
	$("#showdata").empty();
	$("#showdata").append('<h3 class="page-header text-info">用户管理</h3>');
	$("#showdata")
			.append(
					'<table id="table122" class="table table-bordered" width="100%"><thead><tr class="text-info"><th height="30px" width="70px" class="th1">用户名</th><th width="90px" class="th1">真实姓名</th><th width="150px" class="th1">注册时间</th><th width="100px" class="th1">注册邮箱</th><th width="80px" class="th1">qq</th><th width="80px" class="th1">电话</th><th width="120px" class="th2">权限</th><th width="120px" class="th2">认证类型</th><th width="180px" class="th2">用户等级</th><th width="50px">查看</th><th width="50px">操作</th></tr></thead><tbody id="t122"></tbody></table>');
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
						$("#t122")
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
					$("#table122")
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
			$('#myModal22').modal('show');
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
			$('#myModal52').modal('show');
		}
	});
}



function form52submit() {
	var scores = $("#sc52").val();
	if (scores < 0 || scores > 100||scores=="") {
		alert("对不起，你输入的积分不符合!!");
		return false;
	}
	$.post(getRootPath() + '/updateUserById.do', {
		id : $("#id52").val(),
		username : $("#us52").val(),
		realname : $("#re52").val(),
		age : $("#ag52").val(),
		sex : $("#se52").val(),
		birthday : $("#bi52").val(),
		certsnum : $("#ce52").val(),
		telephone : $("#te52").val(),
		email : $("#em52").val(),
		address : $("#ad52").val(),
		qq : $("#qq52").val(),
		hobby : $("#ho52").val(),
		regtime : $("#reg52").val(),
		scores : scores
	}, function(data) {
		alert(data);
		$('#myModal52').modal('hide');
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
	$("#usernameID2").text(data.username);
	$("#realnameID2").text(data.realname);
	$("#ageID2").text(data.age);
	if (data.sex == 0) {
		$("#sexID2").text("男");
	} else if (data.sex == 1) {
		$("#sexID2").text("女");
	} else {
		$("#sexID2").text("未知");
	}
	$("#birthdayID2").text(data.birthday);
	$("#certsnumID2").text(data.certsnum);
	$("#telephoneID2").text(data.telephone);
	$("#emailID2").text(data.email);
	$("#qqID2").text(data.qq);
	$("#addressID2").text(data.address);
	$("#hobbyID2").text(data.hobby);
	$("#regtimeID2").text(data.regtimeString);
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
	$("#limitsID2").text(limits);
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
	$("#identifysID2").text(identifys);
	$("#userlevelIdID2").text(data.userlevelId);
	$("#scoresID2").text(data.scores);
}

function showInfo1(data) {
	$("#us52").val(data.username);
	$("#id52").val(data.id);
	$("#re52").val(data.realname);
	$("#ag52").val(data.age);
	if (data.sex == 0) {
		$("#se5 option[value='0']").attr("selected", "selected");
	} else if (data.sex == 1) {
		$("#se5 option[value='1']").attr("selected", "selected");
	} else {
		$("#se5 option[value='2']").attr("selected", "selected");
	}
	$("#bi52").val(data.birthday);
	$("#ce52").val(data.certsnum);
	$("#te52").val(data.telephone);
	$("#em52").val(data.email);
	$("#qq52").val(data.qq);
	$("#ad52").val(data.address);
	$("#ho52").val(data.hobby);
	$("#reg52").val(data.regtimeString);
	$("#sc52").val(data.scores);
}
//联系系统管理员
function findSystemmanage(){
	$('#myModalianxi').modal('show');
}

function formALsubmit(){
	// 判断是否选择照片
	 var file=$("#fileAL");
     if($.trim(file.val())==''){
            alert("请选择照片!");
            return false;
      }
 		var elementIds = ["fileAL"]; // flag为id、name属性名
 		$.ajaxFileUpload({
 			url : getRootPath() + '/uploadPictureAL.do',
 			type : 'post',
 			data:{
 				al_name:$("#alname").val(),
 				al_title:$("#altitle").val(),
 				al_lj:$("#allj").val()
 			},
 			secureuri : false, // 一般设置为false
 			fileElementId : 'fileAL', // 上传文件的id、name属性名
 			dataType : 'text', // 返回值类型，一般设置为json、application/json
 			elementIds : elementIds, // 传递参数到服务器
 			success : function(data, status) {
 				if(status=="success"){
	 				alert(data);
	 				$('#myModalAL').modal('hide');
	 				findNavUrl();
 				}else{
 					alert("上传失败");
 				}
 			},
 			error : function(data, status, e) {
 				alert(e);
 			}
 		});
}
function formDLsubmit(){
	// 判断是否选择照片
	 var file=$("#fileDL");
     if($.trim(file.val())==''){
            alert("请选择照片!");
            return false;
      }
 		var elementIds = ["fileDL"]; // flag为id、name属性名
 		$.ajaxFileUpload({
 			url : getRootPath() + '/uploadPictureDL.do',
 			type : 'post',
 			data:{
 				dl_name:$("#dlname").val(),
 				dl_title:$("#dltitle").val(),
 				dl_lj:$("#dllj").val(),
 				dl_description:$("#dldescriptionst").val()
 			},
 			secureuri : false, // 一般设置为false
 			fileElementId : 'fileDL', // 上传文件的id、name属性名
 			dataType : 'text', // 返回值类型，一般设置为json、application/json
 			elementIds : elementIds, // 传递参数到服务器
 			success : function(data, status) {
 				if(status=="success"){
	 				alert(data);
	 				$('#myModalDL').modal('hide');
	 				findBbsRecommend();
 				}else{
 					alert("上传失败");
 				}
 			},
 			error : function(data, status, e) {
 				alert(e);
 			}
 		});
}

