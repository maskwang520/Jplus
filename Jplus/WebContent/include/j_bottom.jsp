<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- BEGIN FOOTER -->
<div class="footer">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-sm-4 space-mobile">
				<!-- BEGIN ABOUT -->
				<h2>关于</h2>
				<p class="margin-bottom-30">本站点最终版权及解释权归Jplus工作实验室官方所有.</p>
				<p>
					本站历史访问量：<font color="yellow">${nowaccess }</font>
				</p>
				<div class="clearfix"></div>



				<h2>成员风貌</h2>
				<!-- 800*800 -->
				<div class="blog-photo-stream margin-bottom-30">
					<ul class="list-unstyled">
						<li><div class="mix-inner">
										<div class="mix-details">
											<a class="mix-preview fancybox-button" href="${pageContext.request.contextPath}/style/images/images_good/chitry.jpg"
												title="Chitry" data-rel="fancybox-button"><img
									src="${pageContext.request.contextPath}/style/images/images_good/chitry.jpg"
									alt=""></a>
										</div>
									</div>
							</li>
							<li><div class="mix-inner">
										<div class="mix-details">
											<a class="mix-preview fancybox-button" href="${pageContext.request.contextPath}/style/images/images_good/hktry.jpg"
												title="Hktry" data-rel="fancybox-button"><img
									src="${pageContext.request.contextPath}/style/images/images_good/hktry.jpg"
									alt=""></a>
										</div>
									</div></li>
							<li><div class="mix-inner">
										<div class="mix-details">
											<a class="mix-preview fancybox-button" href="${pageContext.request.contextPath}/style/images/images_good/sythen.jpg"
												title="Sythen" data-rel="fancybox-button"><img
									src="${pageContext.request.contextPath}/style/images/images_good/sythen.jpg"
									alt=""></a>
										</div>
									</div>
									</li>
							<li><div class="mix-inner">
										<div class="mix-details">
											<a class="mix-preview fancybox-button" href="${pageContext.request.contextPath}/style/images/images_good/maskwang.jpg"
												title="Maskwang" data-rel="fancybox-button"><img
									src="${pageContext.request.contextPath}/style/images/images_good/maskwang.jpg"
									alt=""></a>
										</div>
									</div>
									</li>
							<li><div class="mix-inner">
										<div class="mix-details">
											<a class="mix-preview fancybox-button" href="${pageContext.request.contextPath}/style/images/images_good/zhouying.jpg"
												title="Zhouying" data-rel="fancybox-button"><img
									src="${pageContext.request.contextPath}/style/images/images_good/zhouying.jpg"
									alt=""></a>
										</div>
									</div></li>
							<li><div class="mix-inner">
										<div class="mix-details">
											<a class="mix-preview fancybox-button" href="${pageContext.request.contextPath}/style/images/images_good/0.gif"
												title="ZhangLei" data-rel="fancybox-button"><img
									src="${pageContext.request.contextPath}/style/images/images_good/0.gif"
									alt=""></a>
										</div>
									</div></li>
							<li><div class="mix-inner">
										<div class="mix-details">
											<a class="mix-preview fancybox-button" href="${pageContext.request.contextPath}/style/images/images_good/1.gif"
												title="Startfct" data-rel="fancybox-button"><img
									src="${pageContext.request.contextPath}/style/images/images_good/1.gif"
									alt=""></a>
										</div>
									</div></li>
							<li><div class="mix-inner">
										<div class="mix-details">
											<a class="mix-preview fancybox-button" href="${pageContext.request.contextPath}/style/images/images_good/2.gif"
												title="LiDong" data-rel="fancybox-button"><img
									src="${pageContext.request.contextPath}/style/images/images_good/2.gif"
									alt=""></a>
										</div>
									</div></li>
					</ul>
				</div>
				<!-- END BLOG PHOTOS STREAM -->
			</div>
			<div class="col-md-4 col-sm-4 space-mobile">
				<!-- BEGIN CONTACTS -->
				<h2>联系我们</h2>
				<address class="margin-bottom-40">
					Jplus, Inc. <br /> 湖北省黄石市黄石港区磁湖路 <br /> Magnetic Lake Road,
					Huangshi City, Huangshi City, Hubei Province, China <br />
					官方公开QQ群：<a target="_blank"
						href="http://shang.qq.com/wpa/qunwpa?idkey=e0e19bf5185f1cff69966e414aeaad463e5f019bcccb6c46d4525449734f898f"><img
						border="0" src="http://pub.idqqimg.com/wpa/images/group.png"
						alt="Jplus_交流" title="Jplus_交流"></a><br /> Email: <a
						href="mailto:chitry@outlook.com">chitry@outlook.com</a>
				</address>
				<!-- END CONTACTS -->

				<!-- BEGIN SUBSCRIBE -->
				<h2>搜索全站</h2>
				<p>找不到你想要的资源？搜索全站资源</p>
				<form action="#" class="form-subscribe">
					<div class="input-group input-large">
						<input class="form-control" type="text"> <span
							class="input-group-btn">
							<button class="btn theme-btn" type="button">全站搜</button>
						</span>
					</div>
				</form>

				<!-- END SUBSCRIBE -->
			</div>
			<div class="col-md-4 col-sm-4">
				<!-- BEGIN TWITTER BLOCK -->
				<h2>友情链接</h2>
				<c:forEach var="list" items="${fllist}">
					<dl class="dl-horizontal f-twitter">
						<dt>
							<i class="fa fa-twitter"></i>
						</dt>
						<dd>
							<a href="${list.flUrl }">${list.flName }</a>
							${list.flDescriptions } <span>go</span>
						</dd>
					</dl>
				</c:forEach>
				<dl class="dl-horizontal f-twitter">
					<dt>
						<i class="fa fa-twitter"></i>
					</dt>
					<dd>
						<a target="_blank"
							href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=D2xnZnt9diE2O09_fiFsYGI"
							style="text-decoration: none;"> 友链申请</a>
					</dd>
				</dl>

				<!-- END TWITTER BLOCK -->
			</div>
		</div>
	</div>
</div>
<!-- END FOOTER -->

<!-- BEGIN COPYRIGHT -->
<div class="copyright">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-sm-8">
				<p>
					<span class="margin-right-10">2015 © Copyright Jplus实验室官方.</span> <a
						href="${pageContext.request.contextPath }/manage/login/login_sys.jsp">系统后台</a>
					| <a
						href="${pageContext.request.contextPath }/manage/login/login_mem.jsp">成员后台</a>
				</p>
			</div>
			<div class="col-md-4 col-sm-4">
				<ul class="social-footer">
					<li><a href="#"><i class="fa fa-facebook"></i></a></li>
					<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
					<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
					<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
					<li><a href="#"><i class="fa fa-twitter"></i></a></li>
					<li><a href="#"><i class="fa fa-skype"></i></a></li>
					<li><a href="#"><i class="fa fa-github"></i></a></li>
					<li><a href="#"><i class="fa fa-youtube"></i></a></li>
					<li><a href="#"><i class="fa fa-dropbox"></i></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- END COPYRIGHT -->