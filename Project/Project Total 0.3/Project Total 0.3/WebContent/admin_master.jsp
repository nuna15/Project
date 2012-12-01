<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>권한 관리</title>
<link href="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/css/bootstrap.css" rel="stylesheet">
<link href="stylesheets/Mainpage_Layout.css" rel="stylesheet" type="text/css">
<link href="stylesheets/admin/admin_master.css" rel="stylesheet" type="text/css">
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
						<li><a href="admin_status.jsp">사용현황</a></li>
						<li><a href="admin_reserve.jsp">예매/취소율 </a></li>
						<li class="active"><a href="admin_master.jsp">권한 관리</a></li>
						<li><a href="admin_concert_input.jsp">공연 추가 / 수정</a></li>
						<li></li>
					</ul>
				</div>
			</div>
		</div>

		<div id="content">
			<!-- 실직적으로 보여질 정보들-->
			<center>
				<div class="down_section_1">
					<div class="faq_section_1">
						<div id="board">
							<div id="title_bar">
								<div class="row_title">
									<div class="row_title_left">
										<div class="range">사용범위</div>
									</div>
									<div class="row_title_right">
										<div class="master">권한</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="left">공연 예매</div>
								<div class="right"></div>
							</div>
							<div class="row">
								<div class="left">공연 예매취소</div>
								<div class="right"></div>
							</div>
							<div class="row">
								<div class="left">FAQ</div>
								<div class="right"></div>
							</div>
							<div class="row">
								<div class="left">1:1 문의</div>
								<div class="right"></div>
							</div>
							<div class="row">
								<div class="left">리뷰 작성</div>
								<div class="right"></div>
							</div>
							<div class="row">
								<div class="left">리뷰 보기</div>
								<div class="right"></div>
							</div>
						</div>
					</div>
				</div>
			</center>
		</div>

		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>