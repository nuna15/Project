<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연시간페이지</title>
<link	href="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/css/bootstrap.css" rel="stylesheet">
<link href="stylesheets/Mainpage_Layout.css" rel="stylesheet"	type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>
<script src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-transition.js"></script>
<script src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-alert.js"></script>
<script src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-modal.js"></script>
<script src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-dropdown.js"></script>
<script src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-scrollspy.js"></script>
<script src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-tab.js"></script>
<script src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-tooltip.js"></script>
<script src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-popover.js"></script>
<script src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-button.js"></script>
<script src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-collapse.js"></script>
<script src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-carousel.js"></script>
<script src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-typeahead.js"></script>

<script>
	$(function() {
		$("#datepicker").datepicker();
	});
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
						<li class="active"><a href="information.jsp">공연</a></li>
						<li><a href="reserve.jsp">예약 </a></li>
						<li><a href="review.jsp">리뷰</a></li>
						<li><a href="membership.jsp">멤버십</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="content">
			<!-- 실직적으로 보여질 정보들-->
			<div id="information"
				style="width: 800px; padding-top: 50px; margin: 0 auto; border: 1px solid #B0B0B0;">
				<center>
					<img
						src="http://www.yawooricinema.com/images/sub_03/title_img_01.jpg">
				</center>
				<center>
					<p>
						Date: <input type="text" id="datepicker" value="11/14/2012" />
					</p>
				</center>
				<hr />

				<div>
					<table border="1" width="800px">
						<tr>
							<th width="400px;" height="50px">공연명</th>
							<th>등급</th>
							<th>상영시간</th>
						</tr>
						<tr>
							<td><img
								src="http://www.mecenatticket.com/story/dataroom/product_img/1325052970/gi02.jpg"
								style="width: 150px; height: 150px; float: left;"> <b><p>
										기막힌스캔들</p></b>
								<p>상영시간 : 120분</p>
								<p>개봉일 : 2012-09-27</p>
								<P>배우 : 김태우, 예지원</p></td>
							<td>전체관람가</td>
							<td>
								<p>11:35 ~ 13:17</p>
								<p>15:50 ~ 17:32</p>
								<p>19:35 ~ 21:30</p>
							</td>
						</tr>
						<tr>
							<td><img
								src="http://www.mecenatticket.com/story/dataroom/product_img/1348116827/12.jpg"
								style="width: 150px; height: 150px; float: left;"> <b><p>
										러브액츄얼리</p></b>
								<p>상영시간 : 120분</p>
								<p>개봉일 : 2012-09-27</p>
								<P>배우 : 김태우, 예지원</p></td>
							<td>전체관람가</td>
							<td>
								<p>11:35 ~ 13:17</p>
								<p>15:50 ~ 17:32</p>
							</td>
						</tr>
						<tr>
							<td><img
								src="http://www.mecenatticket.com/story/dataroom/product_img/1334127752/12.jpg"
								style="width: 150px; height: 150px; float: left;"> <b><p>
										삼봉이발소</p></b>
								<p>상영시간 : 120분</p>
								<p>개봉일 : 2012-09-27</p>
								<P>배우 : 김태우, 예지원</p></td>
							<td>전체관람가</td>
							<td>
								<p>11:35 ~ 13:17</p>
								<p>15:50 ~ 17:32</p>
								<p>19:35 ~ 21:30</p>
							</td>
						</tr>
						<tr>
							<td><img
								src="http://www.mecenatticket.com/story/dataroom/product_img/1348040938/2.jpg"
								style="width: 150px; height: 150px; float: left;"> <b><p>
										골때리는 그녀</p></b>
								<p>상영시간 : 120분</p>
								<p>개봉일 : 2012-09-27</p>
								<P>배우 : 김태우, 예지원</p></td>
							<td>전체관람가</td>
							<td>
								<p>11:35 ~ 13:17</p>
								<p>15:50 ~ 17:32</p>
							</td>
						</tr>
					</table>
				</div>

			</div>
		</div>
		<div id="footer">
			<!-- 하위 항목-->
			<p>사이트소개 | 이용약관 | 개인정보취급방침 | 제휴문의 | 법적고지 | 고객센터</p>
			<p>Copyright © mjuProject. All rights reserved.</p>
		</div>
	</div>
</body>
</html>