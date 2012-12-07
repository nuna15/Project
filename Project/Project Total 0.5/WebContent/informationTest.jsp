<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연정보</title>
<link
	href="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/css/bootstrap.css"
	rel="stylesheet">
<link href="stylesheets/Mainpage_Layout.css" rel="stylesheet"
	type="text/css">
<link href="stylesheets/concert/information.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
<script
	src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap.js"></script>
<script src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>

<script>
	$(function() {
		$("#information").tabs();
	});

	$(function() {
		for ( var i = 1; i <= 10; i++) {
			(function() {
				var id = i;
				$("button.1_" + id).click(function() { /* button.1 class = show */
					$("div." + id).show("slow");
				});
				$("button.2_" + id).click(function() { /* button.2 class = hide */
					$("div." + id).hide(1000);
				});
			})();
		}
	});
</script>
</head>

<body>

	<div id="wrap">
		<jsp:include page="share/header.jsp"></jsp:include>

		<!--전체 크기 -->
		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<ul class="nav">
						<li class="active"><a
							href="ConcertManageController?action=index">공연</a></li>
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
			<%
				for (int i = 1; i <= 3; i++) {
			%>
			<c:forEach var="list" items="${concerts}" begin="<%=i%>" end="<%=i%>">
				<div class="section_1">
					<!-- 공연사진,평점,리뷰 바로가기, 줄거리-->
					<div class="section_1_left" id="performance">
						<!-- 공연사진,평점,리뷰 바로가기-->
						<img src="images/photo.jpg" alt="기막힌스캔들">
					</div>
					<div class="section_1_right" id="story">
						<!-- 줄거리-->
						<p class="title">
							<b> 공연명 : ${list.concertName} </b>
						</p>
						<p class="schedule">공연일정 : ${list.startTime} ~ ${list.endTime}</p>
						<p>출연 : ${list.actor}</p>
						<div>
							줄거리 :
							<button class='1_<%=i%>'>보기</button>
							<button class='2_<%=i%>'>숨기기</button>
						</div>
						<div class="<%=i%>" style="display: none">${list.content}</div>
					</div>
				</div>
			</c:forEach>
			<%
				}
			%>
			<%
				for (int i = 5; i <= 8; i++) {
			%>

			<c:forEach var="list" items="${concerts}" begin="<%=i%>" end="<%=i%>">
				<div class="4" style="display: none">
					<div class="section_1">
						<div class="section_1_left" id="performance">
							<img src="images/photo3.jpg" alt="삼봉이발소">
						</div>
						<div class="section_1_right" id="story">
							<p class="title">
								<b> 공연명 : ${list.concertName} </b>
							</p>
							<p class="schedule">공연일정 : ${list.startTime} ~
								${list.endTime}</p>
							<p class="grade">관람등급 : 만7세 관람가</p>
							<p>출연 : ${list.actor}</p>
							<div>
								줄거리 :
								<button class='1_<%=i%>'>보기</button>
								<button class='2_<%=i%>'>숨기기</button>
							</div>
							<div class="<%=i%>" style="display: none">${list.content}</div>
						</div>
					</div>
				</div>
			</c:forEach>
			<%
				}
			%>

			<center>
				<div>
					<button class='1_4'>더보기</button>
					<button class='2_4'>숨기기</button>
				</div>
			</center>

		</div>

		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>