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

<script>
	function joinAgree() {

		var userinput = eval("document.form1");

		if (!userinput.password.value) {//비밀번호를 입력하지 않으면 수행
			alert("비밀번호를 입력하세요");
			return false;
		}
		if (userinput.password.value != userinput.passwordCheck.value) {//비밀번호와 재입력비밀번호가 같지않으면 수행
			alert("비밀번호를 동일하게 입력하세요");
			return false;
		}

		if (!userinput.facebookid.value) {//이름을 입력하지 않으면 수행
			alert("FacebookID를  입력하세요");
			return false;
		}
	}

	function checkPwd() {
		var f1 = document.form1;
		var pw1 = f1.password.value;
		var pw2 = f1.passwordCheck.value;
		if (pw1 != pw2) {
			document.getElementById('checkPwd').style.color = "red";
			document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요.";
		} else if (pw1 == pw2) {
			document.getElementById('checkPwd').style.color = "black";
			document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다.";
		} else if ((pw1 == 'NULL') || (pw2 == 'NULL')) {
			document.getElementById('checkPwd').innerHTML = "암호를 입력하세요.";
		}
	}
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
						<form name="form1" class="well" action="UserManageController"
							method="post" onsubmit="return joinAgree()">
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
									<th>* Password 확인<br /></th>
									<td><input type="password" class="pass"
										name="passwordCheck" maxlength="10" onkeyup="checkPwd()" /></td>
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
								<a href="UserManageController?action=login"><input
									type="submit" value="수정하기" /></a> <input type="reset" value="취소" />
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