<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 정보수정</title>
<link
	href="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/css/bootstrap.css"
	rel="stylesheet">
<link href="stylesheets/Mainpage_Layout.css" rel="stylesheet"
	type="text/css">
<link href="stylesheets/mypage/mypage_modify.css" rel="stylesheet"
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
						<li><a href="ReservationManageController?action=index">예약</a></li>
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
				<div id="modify">
					<center>
						<form class="well" action="UserManageController" method="post">
							<h2>- 회원정보 수정 -</h2>
							<table align="center" class="modi">
								<tr>
									<th>* ID</th>
									<td>${user.userid}</td>
								</tr>
								<tr>
									<th>* Password</th>
									<td><input type="password" name="password" maxlength="10" /></td>
								</tr>
								<tr>
									<th>* Password 확인</th>
									<td><input type="password" name="password" maxlength="10" />
									</td>
								</tr>
								<tr>
									<th>* 이름</th>
									<td><text readonly class="read">${user.name}</text></td>
								</tr>
								<tr>
									<th>* 주민등록 번호</th>
									<td><text readonly class="read">${user.ssn1} -
										*******</text></td>
								</tr>
								<tr>
									<th>* facebook 아이디&nbsp;</th>
									<td><input type="text" name="facebookid" maxlength="30" />
									</td>
								</tr>
							</table>
							<div class="submit">
								<a href="UserManageController?action=login"><input type="submit" value="수정하기" /></a> 
								<input type="reset" value="취소" />
							</div>
							<input type="hidden" name="action" value="modify"></input>
						</form>
					</center>
				</div>
			</div>
		</div>

		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>