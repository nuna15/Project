<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 페이지</title>
<link href="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/css/bootstrap.css" rel="stylesheet">
<link href="stylesheets/Mainpage_Layout.css" rel="stylesheet" type="text/css">
<link href="stylesheets/FAQ/1_1question.css" rel="stylesheet" type="text/css">
<script src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap.js"></script>
</head>

<body>
	<div id="wrap">
		<jsp:include page="share/header.jsp"></jsp:include>

		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<ul class="nav">
						<li><a href="ConcertManageController?action=index">공연</a></li>
						<li><a href="ReservationManageController?action=index">예약 </a></li>
						<li><a href="ReviewManageController?action=index">리뷰</a></li>
						<li><a href="membership.jsp">멤버십</a></li>
					</ul>
				</div>
			</div>
		</div>
		
		<!--전체 크기 -->
		<div class="contenet">
			<div class="up_section_1">
				<div class="left_up_section_1">
					<a href="FAQ.jsp">FAQ</a>
				</div>
				<div class="right_up_section_1">
					<a href="1_1question.jsp">1:1문의</a>
				</div>
			</div>
			<div class="down_section_1">
				<center>
					<form class="well" action="ConcertManageController" method="post">
						<div class="report">
							문의 제목 : <input type="text" name="questionTitle" class="title"></input><br />
							문의 내용 :
							<textarea class="textbox" name="questionContent"></textarea>
							<br />
						</div>
						<div class="bottom">
							<input type="submit" value="문의하기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="submit" value="취소">
						</div>
					</form>
				</center>
			</div>
		</div>

		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>