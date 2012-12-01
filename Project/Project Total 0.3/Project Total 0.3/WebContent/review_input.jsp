<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성 페이지</title>
<link href="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/css/bootstrap.css" rel="stylesheet">
<link href="stylesheets/Mainpage_Layout.css" rel="stylesheet" type="text/css">
<link href="stylesheets/review/review_input.css" rel="stylesheet" type="text/css">
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
			<!-- 실직적으로 보여질 정보들-->
			<div class="section_1" id="reserve_detail">
				<!--예매상세내역-->
				<h1>&lt; 리 뷰 작 성 &gt;</h1>
				<center>
					<form class="well" action="ConcertManageController" method="post">
						<div class="report">
							리뷰 제목 : <input type="text" name="reviewName" class="title"></input><br />
							공연 제목 : <input type="text" name="concertName" class="title"></input><br />
							리뷰 내용 :
							<textarea class="textbox" name="reviewContent"></textarea>
							<br /> 사진 첨부 : <input type="file" name="reviewPicture"></input>
						</div>
						<div class="bottom">
							<input type="submit" value="글쓰기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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