<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<link
	href="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/css/bootstrap.css"
	rel="stylesheet">
<script src="slide/js/jquery-1.3.1.min.js"></script>
<script src="slide/js/jquery.easing.1.3.js"></script>
<link href="stylesheets/Mainpage_Layout.css" rel="stylesheet"
	type="text/css">
<link href="stylesheets/main/Mainpage.css" rel="stylesheet"
	type="text/css">

<script>
	/* slide script */
	$(document)
			.ready(
					function() {

						//Custom settings
						var style_in = 'easeOutBounce';
						var style_out = 'jswing';
						var speed_in = 1000;
						var speed_out = 300;

						//Calculation for corners
						var neg = Math.round($('.qitem').width() / 2) * (-1);
						var pos = neg * (-1);
						var out = pos * 2;

						$('.qitem')
								.each(
										function() {

											url = $(this).find('a')
													.attr('href');
											img = $(this).find('img').attr(
													'src');
											alt = $(this).find('img').attr(
													'img');

											$('img', this).remove();
											$(this)
													.append(
															'<div class="topLeft"></div><div class="topRight">div class="topRight"></div><div class="bottomLeft"></div><divass="b___$tag__$tag__________________$tag__$tag_________________$tag__$tag__________________$tag__$tag____________________$tag_________________$tag__$tag__________________$tag__$tag____________________$tag__$tag_________________$tag__$tag__________________$tag__$tag____________________$tag__$tag_____________________$tag_________________$tag__$tag__________________$tag__$tag____________________$tag__$tag_____________________$tag_');
											$(this).children('div').css(
													'background-image',
													'url(' + img + ')');

											$(this).find('div.topLeft').css({
												top : 0,
												left : 0,
												width : pos,
												height : pos
											});
											$(this).find('div.topRight').css({
												top : 0,
												left : pos,
												width : pos,
												height : pos
											});
											$(this).find('div.bottomLeft').css(
													{
														bottom : 0,
														left : 0,
														width : pos,
														height : pos
													});
											$(this).find('div.bottomRight')
													.css({
														bottom : 0,
														left : pos,
														width : pos,
														height : pos
													});

										}).hover(
										function() {

											$(this).find('div.topLeft').stop(
													false, true).animate({
												top : neg,
												left : neg
											}, {
												duration : speed_out,
												easing : style_out
											});
											$(this).find('div.topRight').stop(
													false, true).animate({
												top : neg,
												left : out
											}, {
												duration : speed_out,
												easing : style_out
											});
											$(this).find('div.bottomLeft')
													.stop(false, true)
													.animate({
														bottom : neg,
														left : neg
													}, {
														duration : speed_out,
														easing : style_out
													});
											$(this).find('div.bottomRight')
													.stop(false, true)
													.animate({
														bottom : neg,
														left : out
													}, {
														duration : speed_out,
														easing : style_out
													});

										},

										function() {

											$(this).find('div.topLeft').stop(
													false, true).animate({
												top : 0,
												left : 0
											}, {
												duration : speed_in,
												easing : style_in
											});
											$(this).find('div.topRight
</script>

<style type="text/css">
body {
	padding-top: 20px;
	padding-bottom: 60px;
} /* Custom container */
.container {
	margin: 0 auto;
	max-width: 1000px;
}

.container>hr {
	margin: 60px 0;
} /* Main marketing message and sign up button */
.navbar .navbar-inner {
	padding: 0;
}

.navbar .nav {
	margin: 0;
}

.navbar .nav li {
	display: table-cell;
	width: 1%;
	float: none;
}

.navbar .nav li a {
	font-weight: bold;
	text-align: center;
	border-left: 1px solid rgba(255, 255, 255, .75);
	border-right: 1px solid rgba(0, 0, 0, .1);
}

.navbar .nav
li:first-child a {
	border-left: 0;
	border-radius: 3px 0 0 3px;
}

.navbar
.nav li:last-child a {
	border-right: 0;
	border-radius: 0 3px 3px 0;
}
</style>
</head>
<body>
	<div id="wrap">
		<!--전체 크기 -->
		<div id="header">
			<!-- 이름 , 로그인 회원가입 전체를 이르는 크기-->
			<div id="header_left">
				<!-- 헤더에서 이름 가르키는 크기-->
				<a href="mainpage.jsp"><img src="images/logo.jpg"></a>
			</div>
			<div id="header_middle">""</div>
			<div id="header_right">
				<!-- 헤더에서 로그인,회원가입의 크기-->
				<div id="header_right_top">
					<a href="">로그인 &nbsp;</a> <a href="">회원가입</a>
				</div>
			</div>
		</div>

		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<ul class="nav">
						<li><a href="information.jsp">공연</a></li>
						<li><a href="reserve.jsp">예약 </a></li>
						<li><a href="review.jsp">리뷰</a></li>
						<li><a href="membership.jsp">멤버십</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div id="content">
			<div class="section_1" id="concert">
				<h1>공연정보</h1>
				<div class='slide'>
					<div class='qitem'>
						<a href="#"><img src="slide/1.jpg" alt="Test 1" width="126"
							height="126" /></a> <span class="caption">
							<h4>광해</h4>
							<p>예매율 : 13.9%</p>
							<p>배우 : 이병헌, 한효주</p>
							<p>상영시간 : 131분</p>
							<p>개봉일2012.09.13</p>
						</span>
					</div>
					<div class='qitem'>
						<a href="#"><img src="slide/2.jpg" alt="Test 1" width="126"
							height="126" /></a> <span class="caption">
							<h4>007 스카이폴</h4>
							<p>예매율 : 13.9%</p>
							<p>배우 : 이병헌, 한효주</p>
							<p>상영시간 : 131분</p>
							<p>개봉일2012.09.13</p>
						</span>
					</div>
					<div class='clear'></div>
					<div class='qitem'>
						<a href="#"><img src="slide/3.jpg" alt="Test 1" width="126"
							height="126" /></a> <span class="caption">
							<h4>아르고</h4>
							<p>예매율 : 13.9%</p>
							<p>배우 : 이병헌, 한효주</p>
							<p>상영시간 : 131분</p>
							<p>개봉일2012.09.13</p>
						</span>
					</div>
					<div class='qitem'>
						<a href="#"><img src="slide/4.jpg" alt="Test 1" width="126"
							height="126" /></a> <span class="caption">
							<h4>용의자X</h4>
							<p>예매율 : 13.9%</p>
							<p>배우 : 이병헌, 한효주</p>
							<p>상영시간 : 131분</p>
							<p>개봉일2012.09.13</p>
						</span>
					</div>
				</div>
			</div>

			<div class="section_2" id="reserve">
				<h1>예매</h1>
				<ul>
					<li>영화예매 <a href="#"><button onclick="location.href('#')">예매하러가기</button></a><br />
						<p class='box'>사이트 상단의 예매하기 메뉴를 누르시거나 본 내용 상단의 예매하기를 누르시면 인터넷
							예매가 가능합니다.</p>
					</li>
					<li>예매 가능 시간 <br />
						<p class='box'>인터넷으로 예매가 가능한 시간은 해당 공연 상영 1시간 전까지 이며 이후 예매를
							원하실 경우에는 영화관 현장에 직접 가셔서 예매를 하셔야합니다.</p>
					</li>
					<li>예매확인/취소 <a href="#"><button
								onclick="location.href('#')">예매확인/취소</button></a><br />
						<p class='box'>
							- 예매 취소 및 환불 가능 시간은 해당 공영 상영 20분 전까지입니다.<br /> - 관람권으로 교환한 입장권은
							현금환불 및 취소가 되지 않습니다.
						</p>
					</li>
				</ul>
			</div>

			<div class="section_3" id="review">
				<h1>리뷰</h1>

				<a href="#">
					<p class="review_detail">
						<img title="용의자X"
							src="http://image.maxmovie.com/movieinfo/image/poster/movie/Max2012suspectxkr_ver3.jpg"
							width="60px"> [기자] 원작 본연의 재미 위에 진한 감성을 더하다[네티즌]
						&lt;용의자X&gt; 류승범의 연기와 원작의 힘![네티즌] 한 여자를 진심으로 사랑한 한 남자의 이야기[네티즌] 한
						여자를 진심으로 사랑한 한 관객평점8.82
					</p>
				</a>
				<hr />

				<a href="#">
					<p class="review_detail">
						<img title="용의자X"
							src="http://image.maxmovie.com/movieinfo/image/poster/movie/Max2012argo_ver2.jpg"
							width="60px"> [기자] 원작 본연의 재미 위에 진한 감성을 더하다[네티즌]
						&lt;용의자X&gt; 류승범의 연기와 원작의 힘![네티즌] 한 여자를 진심으로 사랑한 한 남자의 이야기[네티즌] 한
						여자를 진심으로 사랑한 한 관객평점8.82
					</p>
				</a>
				<hr />

				<a href="#">
					<p class="review_detail">
						<img title="용의자X"
							src="http://image.maxmovie.com/movieinfo/image/poster/movie/Maxchosunking_ver2.jpg"
							width="60px"> [기자] 원작 본연의 재미 위에 진한 감성을 더하다[네티즌]
						&lt;용의자X&gt; 류승범의 연기와 원작의 힘![네티즌] 한 여자를 진심으로 사랑한 한 남자의 이야기[네티즌] 한
						여자를 진심으로 사랑한 한 관객평점8.82
					</p>
				</a>
			</div>

			<div class="section_4" id="membership">
				<h1>멤버십</h1>
				<a href="#"> <img src="images/vip_main_img.gif"><br />
				<br /> <img src="images/platinum.jpg"> <img
					src="images/vip.jpg"> <img src="images/gold.jpg">
				</a>
			</div>
		</div>

		<div id="footer">
			<p>사이트소개 | 이용약관 | 개인정보취급방침 | 제휴문의 | 법적고지 | 고객센터</p>
			<p>Copyright © mjuProject. All rights reserved.</p>
		</div>
	</div>
</body>
</html>

