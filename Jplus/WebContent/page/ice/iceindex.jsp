<%
/**
 * Jplus在线 冰河技术交流论坛通信控制入口
 *
 * @author Chitry
 * @time 2015.08.09
 */
%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Jplus在线 - 冰河技术交流论坛</title>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<script type="text/javascript">
	function loadBBS(){
		setTimeout(gotoBBS(),5000);
	}
	function gotoBBS(){
		location.href="http://localhost:8088/ice";
	}
</script>
</head>
<body onload="loadBBS();">

	<!--全站通用顶部-->
	 <div style="position:relative;">
		<%@ include file="/include/j_top.jsp"%>
	</div> 

	<!-- 正文部分开始 -->
	<div >
		
		正在进入冰河技术交流论坛，请稍后...

	</div>
	<!-- 正文部分结束 -->



	<!--全站通用底部-->
	 <div style="position:relative;    top:1000px;">
		<%@ include file="/include/j_bottom.jsp"%>
	</div> 

</body>
</html>
