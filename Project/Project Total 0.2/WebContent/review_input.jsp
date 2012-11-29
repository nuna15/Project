<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성 페이지</title>

<link
	href="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/css/bootstrap.css"
	rel="stylesheet">
<link href="stylesheets/Mainpage_Layout.css" rel="stylesheet"
	type="text/css">
<link href="stylesheets/review/review_input.css" rel="stylesheet"
	type="text/css">
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
<script
	src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/jquery.js"></script>
<script
	src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-transition.js"></script>
<script
	src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-alert.js"></script>
<script
	src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-modal.js"></script>
<script
	src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-dropdown.js"></script>
<script
	src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-scrollspy.js"></script>
<script
	src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-tab.js"></script>
<script
	src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-tooltip.js"></script>
<script
	src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-popover.js"></script>
<script
	src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-button.js"></script>
<script
	src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-collapse.js"></script>
<script
	src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-carousel.js"></script>
<script
	src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-typeahead.js"></script>
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
			<!-- 실직적으로 보여질 정보들-->
			<div class="section_1" id="reserve_detail">
				<!--예매상세내역-->
				<h1>&lt; 리 뷰 작 성 &gt;</h1>
				<center>
					<form class="well" action="_" method="post">
						<div class="report">
							리뷰 제목 : <input type="text" name="reviewtitle" class="title"></input><br />
							리뷰 내용 :
							<textarea class="textbox" name="reviewContent"></textarea>
							<br /> 사진 첨부 : <input type="file" name="reviewPicture"></input>
						</div>
						<div class="bottom">
							<input type="submit" value="문의하기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="submit" value="취소">
						</div>
					</form>
				</center>
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