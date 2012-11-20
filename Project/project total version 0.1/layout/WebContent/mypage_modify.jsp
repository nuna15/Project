<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 정보수정</title>

<link href="stylesheets/mypage/mypage_modify.css" rel="stylesheet" type="text/css">
<link href="stylesheets/Mainpage_Layout.css" rel="stylesheet" type="text/css">
<link href="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/css/bootstrap.css" rel="stylesheet">
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
	<script
		src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/jquery.js"></script>
	<script
		src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-transition.js"></script>
	<script
		src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-alert.js"></script>
	<script
		src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-modal.js"></script>
	<script
		src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-dropdown.js"></script>
	<script
		src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-scrollspy.js"></script>
	<script
		src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-tab.js"></script>
	<script
		src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-tooltip.js"></script>
	<script
		src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-popover.js"></script>
	<script
		src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-button.js"></script>
	<script
		src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-collapse.js"></script>
	<script
		src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-carousel.js"></script>
	<script
		src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-typeahead.js"></script>
</head>
<body>

	<div id="wrap">
		<!--전체 크기 -->

		<div id="header">
			<!-- 이름 , 로그인 회원가입 전체를 이르는 크기-->
			<div id="header_left">
				<!-- 헤더에서 이름 가르키는 크기-->
				<img src="images/logo.jpg">
			</div>
			<div id="header_middle">""</div>
			<div id="header_right">
				<!-- 헤더에서 로그인,회원가입의 크기-->
				<div id="header_right_top">
					<a href="">로그인 &nbsp;</a> <a href="">회원가입</a>
				</div>
			</div>
		</div>

		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<ul class="nav">
						<li><a href>공연</a></li>
						<li><a href>예약 </a></li>
						<li><a href>리뷰</a></li>
						<li><a href>멤버십</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="content"><!-- 실직적으로 보여질 정보들-->
			<div class="section_1" id="reserve_detail"><!--예매상세내역-->
				    	<h1>&lt; MY PAGE &gt;</h1><br/><br/>
				    	<div id="modify">
       					<center><form class="well" action="_" method="post">
				    	<h2>- 회원정보 수정 -</h2>
				    		<table align="center" class="modi">
				    			<tr>
				    				<th>* ID</th>
				    				<td>
                                	<text readonly class="read">wkdrbtjdid</text>
				    				</td>
				    			</tr>
				    			<tr>
				    				<th>* Password</th>
				    				<td>
				    				<input type="password" name="PW" maxlength="10"/>
				    				</td>
				    			</tr>
				    			<tr>
				    				<th>* Password 확인</th>
				    				<td>
				    				<input type="password" name="PWcheck" maxlength="10"/>
				    				</td>
				    			</tr>
				    			<tr>
				    				<th>* 이름</th>
				    				<td>
                                	<text readonly class="read">홍길동</text>
				    				</td>
				    			</tr>	
				    			<tr>
				    				<th>* 주민등록 번호</th>
				    				<td>
                                	<text readonly class="read">951423 - *******</text>
				    				</td>
				    			</tr>	    		
				    			<tr>
				    				<th>* facebook 아이디&nbsp;</th>
				    				<td>
				    				<input type="text" name="FACEBOOKID" maxlength="30"/>
				    				</td>
				    			</tr>
				    		</table>
				    			<div class="submit">
				    			<input type="submit" value="수정하기"/>
				    			<input type="reset" value="취소"/>
				    		</div>
				    	</form></center>
				    </div>
        	</div>
        </div>


	<div id="footer">
		<!-- 하위 항목-->
		<p>사이트소개 | 이용약관 | 개인정보취급방침 | 제휴문의 | 법적고지 | 고객센터</p>
		<p>Copyright © mjuProject. All rights reserved.</p>
	</div>
</body>
</html>