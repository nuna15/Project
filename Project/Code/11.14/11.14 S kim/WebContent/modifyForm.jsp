<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>회원 정보 수정</title>
<link href="stylesheets/mypage.css" rel="stylesheet" type="text/css">

<script language="JavaScript">
	function checkIt() {
		var userinput = eval("document.userinput");

		if (!userinput.passwd.value) {
			alert("비밀번호를 입력하세요");
			return false;
		}
		if(userinput.passwd.value != userinput.passwd2.value)
		{
		    alert("비밀번호를 동일하게 입력하세요");
		    return false;
		}

	/*	if (!userinput.name.value) {
			alert("사용자 이름을 입력하세요");
			return false;
		}*/
		if(!userinput.jumin1.value  || !userinput.jumin2.value )
		{
		    alert("주민등록번호를 입력하세요");
		    return false;
		}
	}
</script>
<%
	//사용자의 id값은 세션속성값으로부터 얻어냄
	String id = (String) session.getAttribute("memId");
	System.out.println(id);
	//42~43: DB연동하는빈에 id값에 해당하는 레코드를 얻어내는 부분
	logon.LogonDBBean manager = logon.LogonDBBean.getInstance();
	logon.LogonDataBean c = manager.getMember(id);
	//manager.getMember(id)메소드가 데이터저장빈객체를 리턴 
	try {
%>

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
					<a href="">로그인 &nbsp;</a> <a href="">마이페이지 &nbsp;</a> <a href="">회원가입</a>
				</div>
			</div>
		</div>
		<div id="navbar">
			<!-- 공연 , 예매, 리뷰 , 멤버십 -->
			<ul>
				<li><a href class="selected" id="nomargin">공연</a></li>
				<li><a href>예약 </a></li>
				<li><a href>리뷰</a></li>
				<li><a href>멤버십</a></li>
			</ul>
		</div>
	</div>
	<div id="content">

		<!-- 실직적으로 보여질 정보들-->
		<div class="section_1" id="reserve_detail">
			<!--예매상세내역-->
			<h1>&lt; MY PAGE &gt;</h1>
			<br /> <br />
			<div id="modify">
				<center>
					<form method="post" class="well" action="modifyPro.jsp"
						name="userinput" onsubmit="return checkIt()">
						<h2>- 회원정보 수정 -</h2>
						<table align="center" class="modi">
							<tr>
								<th>* ID</th>
								<td><text readonly class="read"><%=c.getId()%></text></td>
							</tr>
							<tr>
								<th>* Password</th>
								<td><input type="password" name="passwd" maxlength="10" /></td>
							</tr>
							<tr>
								<th>* Password 확인</th>
								<td><input type="password" name="passwdCheck"
									maxlength="10" /></td>
							</tr>
							<tr>
								<th>* 이름</th>
								<td><text readonly class="read" name="name"><%=c.getName()%></text></td>
							</tr>
							<tr>
								<th>* 주민등록 번호</th>
								<td><text readonly class="read"> <%=c.getJumin1()%>
									- <%=c.getJumin2()%></text></td>
							</tr>
							<tr>
								<th>* facebook 아이디&nbsp;</th>
								<td><input type="text" name="facebookid" maxlength="30" />
								</td>
							</tr>
						</table>
						<div class="submit">
							<input type="submit" value="수정하기" name="modify" /> <input
								type="reset" value="취소"
								onclick="javascript:window.location='main.jsp'">
						</div>
					</form>
				</center>
			</div>



			<!-- 마이페이지 퀵메뉴 -->
			<div>
				<table>
					<tr>
						<td><A HREF="#"><img
								src="http://www.styleman.kr/web/qa/mypage_02.gif" width="190px"></A></td>
						<td><A HREF="#"><img
								src="http://www.styleman.kr/web/qa/mypage_03.gif" width="190px"></A></td>
						<td><A HREF="#"><img
								src="http://www.styleman.kr/web/qa/mypage_04.gif" width="190px"></A></td>
						<td><A HREF="#"><img
								src="http://www.styleman.kr/web/qa/mypage_07.gif" width="190px"></A></td>
					</tr>
				</table>
			</div>

		</div>
	</div>

	<div id="footer">
		<!-- 하위 항목-->
		<p>사이트소개 | 이용약관 | 개인정보취급방침 | 제휴문의 | 법적고지 | 고객센터</p>
		<p>Copyright © mjuProject. All rights reserved.</p>
	</div>
	</div>
	<%
		} catch (Exception e) {
		}
	%>

</html>




