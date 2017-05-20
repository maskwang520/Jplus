<%
/**
 * Jplus在线 首页底部宣传banner视频焦点图
 *
 * @author Chitry
 * @time 2015.08.09
 */
%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- 视频焦点图链向文件 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/scripts/scripts_index_banner/royalslider/royalslider.css"></link>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/scripts/scripts_index_banner/royalslider/minimal-white/rs-minimal-white.css"></link>
	
<!-- 该处只能使用jquery 1.8版本 -->
<%-- <script
	src="<%=request.getContextPath()%>/style/jquery/jquery-1.8.2.min.js"
	type="text/javascript" charset="utf-8"></script>  --%> 
<script
	src="<%=request.getContextPath()%>/style/jquery/jquery.easing-1.3.js"
	type="text/javascript" charset="utf-8"></script>
<script
	src="<%=request.getContextPath()%>/style/scripts/scripts_index_banner/royalslider/jquery.royalslider.custom.min.js"
	type="text/javascript" charset="utf-8"></script>
<script
	src="<%=request.getContextPath()%>/style/scripts/scripts_index_banner/jwplayer/jwplayer.js"
	type="text/javascript"></script>
</head>
<body>
	<!-- 焦点图 -->
		<div class="royalSlider rsMinW">
			<div class="rsContent">
				<a class="rsImg" data-rsVideo="./style/scripts/scripts_index_banner/vedios/jplus.mp4"
					href="<%=request.getContextPath()%>/style/images/images_index_banner/1.jpg"></a>
			</div>
			<div class="rsContent">
				<a class="rsImg" data-rsVideo="./style/scripts/scripts_index_banner/vedios/jplus.mp4"
					href="<%=request.getContextPath()%>/style/images/images_index_banner/2.jpg"></a>
			</div>
			<div class="rsContent">
				<img src="<%=request.getContextPath()%>/style/images/images_index_banner/3.jpg" />
			</div>
		</div>
		<script type="text/javascript">
			var slider = $('.royalSlider').royalSlider({
				keyboardNavEnabled : true,
				navigateByClick : false,
				sliderDrag : false,
				imageScaleMode : 'fill'
			}).data('royalSlider');
			slider.ev
					.on(
							'rsOnCreateVideoElement',
							function(e, url) {
								slider.videoObj = $('<div id="mediaplayer" class="rsVideoObj">Loading the player ...</div>');
								setTimeout(
										function() {
											jwplayer('mediaplayer')
													.setup(
															{
																'flashplayer' : './style/scripts/scripts_index_banner/jwplayer/player.swf',
																'id' : 'playerID',
																'width' : '100%',
																'height' : '100%',
																"autoplay" : true,
																'file' : url,
																'viral.onpause' : false,
																'controlbar.idlehide' : true,
																'stretching' : 'exactfit',
															});
										}, 50);
							});
		</script>
</body>
</html>
