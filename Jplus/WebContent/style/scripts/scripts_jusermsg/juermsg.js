var ok1=false;
var ok2=false;
var ok3=false;
var ok4=false;
var ok5=false;
$(document).ready(function(){
	$("#certificate").blur(function (){
		var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
		if(reg.test($("#certificate").val())==false){
		 $(".certify").text("Tip: 证件号格式有误!");
		   
		}
		else{
			ok1=true;
			$(".certify").text("");
			 
		}
	});
	
	 $('#qrwsxx').click(function(){
		    if(ok1&&ok2&&ok3&&ok4){
		        $("#tab_3form").submit();
		    }else{
		        return false;
		    }
		});
	
	 $('#submitrz').click(function(){
		    if($('#photo1').val().length!=0){
		        $("#formrz").submit();
		    }else{
		    	$("#uploadphoto").text("你还没上传照片");
		        return false;
		    }
		});
	
	$("#age").blur(function (){
		var reg = new RegExp("^[0-9]*$");
		if($("#age").val().length==0||reg.test($("#age").val())==false){
		 $(".age").text("Tip: 年龄格式不对正确!");
		    
		}
		else{
			ok2=true;
			$(".age").text("");
		}
	});
});

function checkqqnull(){
	var qq=$("#qq").val();
	if(qq.length==0){
		 $(".qq").text("Tip: qq格式不正确!");
		  
	}
	else{
		ok3=true;
		$(".qq").text("");
	}
}

function checkrealnamenull(){
	var realname=$("#realname").val();
	if(realname.length==0){
		 $(".realname").text("Tip: 真实姓名不能为空!");
		  
	}
	else{
		ok5=true;
		$(".realname").text("");
	}
}

function checktelephone(){
	 var reg=/^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
	 var telephone=$("#telephone").val();
	 if(telephone.length==0||reg.test(telephone)==false){
		 $(".telephone1").text("Tip: 电话号码格式不对!");
		   
	}
	else{
		ok4=true;
		$(".telephone1").text("");
	}
	 
	
}
