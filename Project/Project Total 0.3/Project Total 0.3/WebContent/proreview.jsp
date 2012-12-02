<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전문가리뷰</title>
<link href="stylesheets/bootstrap.css" rel="stylesheet">
<link href="stylesheets/Mainpage_Layout.css" rel="stylesheet"
	type="text/css">
<link href="stylesheets/review/proreview.css" rel="stylesheet"
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
						<li><a href="ReservationManageController?action=index">예약 </a></li>
						<li><a href="ReviewManageController?action=index">리뷰</a></li>
						<li><a href="membership.jsp">멤버십</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div id="content">
			<!-- 실직적으로 보여질 정보들-->
			<div class="section_3" id="reviewlist">
				<!-- 리뷰 리스트-->
				<div class="container">
					<p class="title">전문가 20자평</p>
					<ul>
						<li><img
							src="http://image.cine21.com/resize/cine21/poster/2012/1009/09_29_33__50736fedefd56[X131,188].jpg"
							alt="아르고 이미지">
							<p class="minititle">[ 비 지 터 ]</p>
							<p>감독:토마스 맥카시 | 출연: 리차드 젠킨스, 하지 슬레이먼</p>

							<div id="board">
								<div class="row">
									<div class="number">박평식</div>
									<div class="title">마음도 열고 시대도 두드려요</div>
									<div class="regid">평점 : 6/10</div>
								</div>
								<div class="row">
									<div class="number">이동진</div>
									<div class="title">리처드 젠킨스스의 조용한 카리스마</div>
									<div class="regid">평점 : 7/10</div>
								</div>
								<div class="row">
									<div class="number">이용철</div>
									<div class="title">밍밍한 올바름</div>
									<div class="regid">평점 : 6/10</div>
								</div>
							</div></li>
						<li><br/><img
							src="http://image.cine21.com/resize/cine21/poster/2012/1012/13_24_21__50779b75ce7db[X131,188].jpg"
							alt="아르고 이미지">
							<p class="minititle">[ 0 0 7 스 카 이 폴 ]</p>
							<p>감독:샘 멘더스 | 출연: 다니엘 크레이그, 하비에르 바르뎀</p>

							<div id="board">
								<div class="row">
									<div class="number">김종철</div>
									<div class="title">James Bond forever</div>
									<div class="regid">평점 : 6/10</div>
								</div>
								<div class="row">
									<div class="number">박평식</div>
									<div class="title">시리즈 최고의 앙상블과 박진감, 폭발력</div>
									<div class="regid">평점 : 7/10</div>
								</div>
								<div class="row">
									<div class="number">주성철</div>
									<div class="title">시리즈 사상 최고령 본드걸 M</div>
									<div class="regid">평점 : 6/10</div>
								</div>
								<div class="row">
									<div class="number">김혜리</div>
									<div class="title">과연 이렇게까지 시리즈의 국적을 새삼 강조할 필요가?</div>
									<div class="regid">평점 : 6/10</div>
								</div>
								<div class="row">
									<div class="number">이동진</div>
									<div class="title">올해의 블록버스터</div>
									<div class="regid">평점 : 6/10</div>
								</div>
							</div><br/></li>
						<li><br/><img
							src="http://image.cine21.com/resize/cine21/poster/2012/1015/08_56_19__507b51235ea57[X131,188].jpg"
							alt="아르고 이미지">
							<p class="minititle">[ 늑 대 소 년 ]</p>
							<p>감독:조성희 | 출연: 송중기, 박보영</p>

							<div id="board">
								<div class="row">
									<div class="number">김혜리</div>
									<div class="title">가을동화 같은 ‘너도 펫’</div>
									<div class="regid">평점 : 6/10</div>
								</div>
								<div class="row">
									<div class="number">이용철</div>
									<div class="title">근대의 정상성이라는 괴물에 맞서다</div>
									<div class="regid">평점 : 7/10</div>
								</div>
								<div class="row">
									<div class="number">이화정</div>
									<div class="title">동화책을 한장한장 넘기는 기분</div>
									<div class="regid">평점 : 6/10</div>
								</div>
								<div class="row">
									<div class="number">김성훈</div>
									<div class="title">늑대소년 말고는 전부 전형적인 동화</div>
									<div class="regid">평점 : 6/10</div>
								</div>
								<div class="row">
									<div class="number">박평식</div>
									<div class="title">초를 치는 들러리들</div>
									<div class="regid">평점 : 6/10</div>
								</div>
								<div class="row">
									<div class="number">이화정</div>
									<div class="title">동화책을 한장한장 넘기는 기분</div>
									<div class="regid">평점 : 6/10</div>
								</div>
							</div>
						</li>
						<li><br/><img
							src="http://image.cine21.com/resize/cine21/poster/2012/1011/08_46_37__507608ddee731[X131,188].jpg"
							alt="아르고 이미지">
							<p class="minititle">[ 내 가 살 인 범 이 다 1]</p>
							<p>감독:정병길 | 출연: 정재영, 박시후</p>
			
							<div id="board">
								<div class="row">
									<div class="number">박평식</div>
									<div class="title">마음도 열고 시대도 두드려요</div>
									<div class="regid">평점 : 6/10</div>
								</div>
								<div class="row">
									<div class="number">이동진</div>
									<div class="title">리처드 젠킨스스의 조용한 카리스마</div>
									<div class="regid">평점 : 7/10</div>
								</div>
								<div class="row">
									<div class="number">이용철</div>
									<div class="title">밍밍한 올바름</div>
									<div class="regid">평점 : 6/10</div>
								</div>
							</div>
						</li>
					</ul>
				</div>

				<div class='paging'>
					<a href="#">Prev</a> <a href="#">1</a> <strong>2</strong> <a
						href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">Next</a>
				</div>
			</div>
		</div>
		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>