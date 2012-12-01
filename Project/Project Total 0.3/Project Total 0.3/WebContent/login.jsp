<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link href="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/css/bootstrap.css" rel="stylesheet">
<link href="stylesheets/Mainpage_Layout.css" rel="stylesheet" type="text/css">
<link href="stylesheets/login/login.css" rel="stylesheet" type="text/css">
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
						<li><a href="information.jsp">공연</a></li>
						<li><a href="reserve.jsp">예약 </a></li>
						<li><a href="review.jsp">리뷰</a></li>
						<li><a href="membership.jsp">멤버십</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="content">
			<div class="section_1" id="reserve_detail">
				<!--예매상세내역-->
				<div class="container">
					<form class="well" action="UserManageController" method="post">
						<p class="label">로그인</p>
						<br /> <br /> <label>Email</label> <input type="text"
							class="span3" placeholder="Your email here" name="userid">
						<br /> <label>Password</label> <input type="password"
							class="span3" name="password"><br /> <input
							type="checkbox" class="check"> ID 저장 <br />

						<button type="submit" class="btn">로그인</button>
						<a href="register.jsp"><button type="button" class="btn">회원가입</button></a>
						<a href="login.jsp"
							onclick="window.open('IDPW.jsp',width=300,height=350,left=0,top=0)"><button
								type="button" class="btn">아이디/비밀번호 찾기</button></a>
					</form>
				</div>
			</div>
		</div>

		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>