<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 페이지</title>
<link
	href="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/css/bootstrap.css"
	rel="stylesheet">
<link href="stylesheets/Mainpage_Layout.css" rel="stylesheet"
	type="text/css">
<link href="stylesheets/FAQ/FAQ.css" rel="stylesheet" type="text/css">
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
		<div class="contenet">
			<div class="up_section_1">
				<div class="left_up_section_1">
					<a href="FAQ.html">FAQ</a>
				</div>
				<div class="right_up_section_1">
					<a href="oneonone.html">1:1문의</a>
				</div>
			</div>
			<div class="down_section_1">
				<div class="faq_section_1">
					<div id="board">
						<div id="title_bar">
							<div class="row_title">
								<colgroup>
									<col width="20%">
									<col width="*">
									<col width="15%">
								</colgroup>
								<div class="category">분류</div>
								<div class="question">질문</div>
								<div class="read">조회수</div>
							</div>
						</div>

						<div id="content">
							<div class="row">
								<div class="category">멤버십</div>
								<div class="question">
									<a href="#">Q아이디 변경이 가능한가요?</a>
								</div>
								<div class="read">47</div>
							</div>
							<div class="row">
								<div class="category">공연예매</div>
								<div class="question">
									<a href="#">Q예매를 한 뒤, 시간대나 좌석변경이 가능한가요?</a>
								</div>
								<div class="read">515</div>
							</div>
							<div class="row">
								<div class="category">홈페이지</div>
								<div class="question">
									<a href="#">Q예매가 되지 않아 선택했던 좌석으로 다시 예매를 하려고 하는데 왜 이미 판매된
										좌석으로 표시되나요?</a>
								</div>
								<div class="read">1</div>
							</div>
							<div class="row">
								<div class="category">기타</div>
								<div class="question">
									<a href="#">Q1:1문의를 남겼는데 답변이 오지 않아요.</a>
								</div>
								<div class="read">11</div>
							</div>
							<div class="row">
								<div class="category">기타</div>
								<div class="question">
									<a href="#">Q멤버십 포인트 적립은 어디서 확인하나요?</a>
								</div>
								<div class="read">55</div>
							</div>
							<div class="row">
								<div class="category">리뷰</div>
								<div class="question">
									<a href="#">Q리뷰게시판은 어떻게 사용하나요?</a>
								</div>
								<div class="read">42</div>
							</div>
							<div class="row">
								<div class="category">공연예매</div>
								<div class="question">
									<a href="#">Q예매를 클릭해도 예매창이 열리지 않아요.</a>
								</div>
								<div class="read">2</div>
							</div>
							<div class="row">
								<div class="category">멤버십</div>
								<div class="question">
									<a href="#">Q개명을 하였는데 어떻게 바꾸어야 하나요?</a>
								</div>
								<div class="read">100</div>
							</div>
							<div class="row">
								<div class="category">기타</div>
								<div class="question">
									<a href="#">Q공연장 내 음식물 반입에 대하여 자세히 알려주세요.</a>
								</div>
								<div class="read">92</div>
							</div>
							<div class="row">
								<div class="category">홈페이지</div>
								<div class="question">
									<a href="#">Q아이디와 비밀번호를 잃어버렸습니다.</a>
								</div>
								<div class="read">223</div>
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class='paging'>
				<a href="#">Prev</a> <a href="#">1</a> <strong>2</strong> <a
					href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">Next</a>
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