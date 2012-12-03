<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공연 시간대별 예매율</title>
<link href="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/css/bootstrap.css" rel="stylesheet">
<link href="stylesheets/Mainpage_Layout.css" rel="stylesheet" type="text/css">
<link href="stylesheets/admin/admin_time_reserve.css" rel="stylesheet" type="text/css">
<script src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap.js"></script>
</head>

<body>
	<div id="wrap">
		<jsp:include page="share/header.jsp"></jsp:include>

		<!--전체 크기 -->
		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<ul class="nav">
						<li class="active"><a href="admin_status.jsp">사용현황</a></li>
						<li><a href="admin_reserve.jsp">예매/취소율 </a></li>
						<li><a href="admin_master.jsp">권한 관리</a></li>
						<li><a href="admin_concert_input.jsp">공연 추가 / 수정</a></li>
						<li></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="content">
			<div class="section_1_left" id="concert1"></div>
			<div class="section_1_right" id="concert2"></div>
			<div class="section_1_left" id="concert3"></div>
			<div class="section_1_right" id="concert4"></div>
		</div>

		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>

</body>
</html>