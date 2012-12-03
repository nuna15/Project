<%@page import="dto.UserDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link
	href="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/css/bootstrap.css"
	rel="stylesheet">
<link href="stylesheets/Mainpage_Layout.css" rel="stylesheet"
	type="text/css">
<link href="stylesheets/mypage/mypage.css" rel="stylesheet"
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
				<h1>&lt; MY PAGE &gt;</h1>
				<br /> <br />

				<div class="section_2" id="left">
					<!--결제내역-->
					<h1>내 정보</h1>
					<br />
					<table>
						<tr>
							<th>고객명</th>
							<!-- 							<td>장규성</td> -->
							<td>${user.name}</td>
						</tr>
						<tr>
							<th>회원등급</th>
							<td>VIP 등급</td>
						</tr>
						<tr>
							<th>총 주문금액</th>
							<td>355,000 원</td>
						</tr>
						<tr>
							<th>사용가능 적립금</th>
							<td>95,000 point</td>
						</tr>
						<tr>
							<th>사용된 적립금</th>
							<td>5,000 point</td>
						</tr>
					</table>
					<a href="UserManageController?action=modify"><button onclick="location.href('UserManageController?action=modify')">수정하러가기</button></a><br />
				</div>

				<div class="section_2" id="right">
					<!--결제내역-->
					<h1>나의 예매정보</h1>
					<div id="board">
						<div class="row_title">
							<div class="number">번호</div>
							<div class="title">공연명</div>
							<div class="date">예매일</div>
							<div class="class">좌석</div>
							<div class="status">상태</div>
						</div>
						<div class="row">
							<div class="number">1</div>
							<div class="title">늑대소년</div>
							<div class="date">2012-09-25</div>
							<div class="class">A-29</div>
							<div class="status">예약완료</div>
						</div>
						<div class="row">
							<div class="number">3</div>
							<div class="title">광해</div>
							<div class="date">2012-11-05</div>
							<div class="class">C-20</div>
							<div class="status">결제대기</div>
						</div>
						<div class="row">
							<div class="number">4</div>
							<div class="title">광해</div>
							<div class="date">2012-11-05</div>
							<div class="class">C-20</div>
							<div class="status">결제대기</div>
						</div>
						<div class="row">
							<div class="number">5</div>
							<div class="title">광해</div>
							<div class="date">2012-11-05</div>
							<div class="class">C-20</div>
							<div class="status">결제대기</div>
						</div>
						<div class="row">
							<div class="number">6</div>
							<div class="title">광해</div>
							<div class="date">2012-11-05</div>
							<div class="class">C-20</div>
							<div class="status">결제대기</div>
						</div>
					</div>
					<a href="UserManageController?action=myReservationHistoryPage"><button onclick="location.href('UserManageController?action=myReservationHistoryPage')">자세히보기</button></a><br />

				</div>

				<div class="section_2" id="bot_left">
					<!--결제내역-->
					<h1>나의 문의내역</h1>
				</div>
				<div class="section_2" id="bot_right">
					<!--결제내역-->
					<h1>나의 관심영화</h1>
				</div>

			</div>
		</div>

		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>