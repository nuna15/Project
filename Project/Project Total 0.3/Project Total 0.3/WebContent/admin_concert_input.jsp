<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 공연 등록 페이지</title>
<link
	href="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/css/bootstrap.css"
	rel="stylesheet">
<link href="stylesheets/Mainpage_Layout.css" rel="stylesheet"
	type="text/css">
<link href="stylesheets/admin/admin_concert_input.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
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
<script>
	$(function() {
		$(document).tooltip();
	});
</script>
<style>
label {
	display: inline-block;
	width: 5em;
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
					<a href="mypage.jsp">마이페이지 &nbsp;</a> <a href="login.jsp">로그아웃</a>
				</div>
			</div>
		</div>
		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<ul class="nav">
						<li><a href="admin_status.jsp">사용현황</a></li>
						<li><a href="admin_reserve.jsp">예매/취소율 </a></li>
						<li><a href="admin_master.jsp">권한 관리</a></li>
						<li class="active"><a href="admin_master.jsp">공연 등록</a></li>
						<li></li>
					</ul>
				</div>
			</div>
		</div>

		<div id="content">
			<!-- 실직적으로 보여질 정보들-->
			<div class="section_1" id="reserve_detail">
				<!--예매상세내역-->
				<h1>&lt; 신규 공연 등록 &gt;</h1>
				<center>
					<form class="well" action="ConcertManageController" method="post">
						<div class="report">
							공연 제목&nbsp;&nbsp;&nbsp; : <input type="text" name="concertTitle"
								class="title"></input><br /> 공연 출연자 : <input type="text" name="concertActor"
								class="actor"></input><br /> 공연 일정&nbsp;&nbsp;&nbsp; : <input
								type="text" name="concertStartDate" id="date"
								title="공연시작 날짜 ex) 20121026"> ~ <input type="text"
								name="concertFinishDate" id="date" class="date"
								title="공연마감 날짜 ex) 20121226"> <input type="text"
								name="concertTime" id="time" title="공연시간 ex) 10:00~12:00">
							</input><br />공연 줄거리 :
							<textarea class="textbox" name="concertContent"></textarea>
							<br /> 사진 첨부&nbsp;&nbsp;&nbsp; : <input type="file"
								name="concertPicture"></input>
						</div>
						<div class="bottom">
							<input type="submit" value="공연 추가">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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