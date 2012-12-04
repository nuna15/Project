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
<script
	src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap.js"></script>
</head>

<body>
	<div id="wrap">
		<jsp:include page="share/header.jsp"></jsp:include>

		<!--전체 크기 -->
		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<ul class="nav">
						<li><a href="ConcertManageController?action=index">공연</a></li>
						<li><a href="ReservationManageController?action=index">예약
						</a></li>
						<li><a href="ReviewManageController?action=index">리뷰</a></li>
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
					<%
						if (request.getSession() != null) {
							if (request.getSession().getAttribute("userid") != null) {
					%>
					<form class="well" action="ReviewManageController" method="post"
						enctype="multipart/form-data">
						<div class="report">
							리뷰 제목 : <input type="text" name="reviewName" class="title"></input><br />
							공연 제목 : <input type="text" name="concertName" class="title"></input><br />
							리뷰 내용 :
							<textarea class="textbox" name="reviewContent"></textarea>
							<br /> 사진 첨부 : <input type="file" name="imgTitle"></input>
						</div>
						<div class="bottom">
							<input type="submit" value="글쓰기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="submit" value="취소">
						</div>
						<input type="hidden" name="action" value="register"></input>
					</form>
					<%
						} else if (request.getSession().getAttribute("userid") == null) {
					%>

					<script type="text/javascript">
						alert("로그인 후 이용해주세요!");
						location.replace("UserManageController?action=login")
					</script>
					<%
						} else {
					%>

					<script type="text/javascript">
						alert("로그인 후 이용해주세요!");
						location.replace("UserManageController?action=login")
					</script>
					<%
						}
						}
					%>
				</center>
			</div>
		</div>

		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>