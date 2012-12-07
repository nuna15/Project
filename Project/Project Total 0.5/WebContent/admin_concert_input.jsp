<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 공연 등록 페이지</title>
<link
	href="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/css/bootstrap.css"
	rel="stylesheet">
<link href="stylesheets/Mainpage_Layout.css" rel="stylesheet"
	type="text/css">
<link href="stylesheets/admin/admin_concert_input.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<script
	src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap.js"></script>
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script src="javascript/allscript.js"></script>

<style>
/* jquery view style */
label {
	display: inline-block;
	width: 5em;
}
</style>
</head>
<body>
	<div id="wrap">
		<jsp:include page="share/header.jsp"></jsp:include>

		<!--전체 크기 -->
		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<ul class="nav">
						<li><a href="AdminManageController?action=status">사용현황</a></li>
						<li><a href="AdminManageController?action=reserve">예매/취소율
						</a></li>
						<li><a href="AdminManageController?action=master">권한 관리</a></li>
						<li class="active"><a
							href="ConcertManageController?action=register">공연추가 / 수정</a></li>
						<li></lfi>
					</ul>
				</div>
			</div>
		</div>

		<div id="content">
			<!-- 실직적으로 보여질 정보들-->
			<div class="section_1" id="reserve_detail">
				<!--예매상세내역-->
				<h1>&lt; 신규 공연 등록 &gt;</h1>
				<center>
					<form class="well" action="ConcertManageController" method="post"
						enctype="multipart/form-data">
						<div class="report">
							공연 제목&nbsp;&nbsp;&nbsp; : <input type="text" name="concertTitle"
								class="title"></input><br /> 공연 출연자 : <input type="text"
								name="concertActor" class="actor"></input><br /> 공연
							일정&nbsp;&nbsp;&nbsp; : <input type="text" name="concertStartDate"
								id="from" class="front" title="공연시작 날짜(click)"> ~ <input
								type="text" name="concertFinishDate" id="to" class="last"
								title="공연마감 날짜(click) "></input><br /> 공연 시간
							&nbsp;&nbsp;&nbsp;: <input type="checkbox" name="concertTime1"
								value="concertTime1" id="check" />10:00 ~ 12:00 <input
								type="checkbox" name="concertTime2" value="concertTime3" />14:00
							~ 16:00 <input type="checkbox" name="concertTime3"
								value="concertTime4" />16:00 ~ 18:00 <br />공연 줄거리 :
							<textarea class="textbox" name="concertContent"></textarea>
							<br /> 사진 첨부&nbsp;&nbsp;&nbsp; : <input type="file"
								id="concertPicture" name="concertPicture"
								onchange="UploadImg(this);"></input> <input type="hidden"
								name="action" value="register"></input>
						</div>
						<div class="bottom">
							<input type="submit" value="공연 추가">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="submit" value="취소">
						</div>
					</form>
				</center>
			</div>
		</div>

		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>