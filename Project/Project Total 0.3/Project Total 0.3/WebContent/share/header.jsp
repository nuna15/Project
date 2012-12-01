<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<a href="login.jsp">로그인 &nbsp;</a> <a href="register.jsp">회원가입&nbsp;</a> <a href="FAQ.jsp">고객센터</a>
		</div>
	</div>
</div>