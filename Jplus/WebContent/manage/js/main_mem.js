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
		email : email,
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
// 联系系统管理员
//联系系统管理员
function findSystemmanage(){
	$('#myModalianxi').modal('show');
}
