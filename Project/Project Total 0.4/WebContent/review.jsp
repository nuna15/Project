<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 페이지</title>
<link
	href="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/css/bootstrap.css"
	rel="stylesheet">
<link href="stylesheets/Mainpage_Layout.css" rel="stylesheet"
	type="text/css">
<link href="stylesheets/review/review.css" rel="stylesheet"
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
						<li class="active"><a
							href="ReviewManageController?action=index">리뷰</a></li>
						<li><a href="membership.jsp">멤버십</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div id="content">
			<!-- 실직적으로 보여질 정보들-->
			<div class="review">
				<a href="review_input.jsp"><input type="submit" value="글쓰기"></a>
			</div>
			<div class="section_1" id="hotreview">
				<!--인기리뷰-->
				<p class="title">BEST REIVIEW</p>
				<a href="review_detail01.jsp"> <img
					src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000076/76585/76585100354_727.jpg"
					alt="위험한관계이미지">
					<p class="subtitle">위험한 관계 - 위험하지 않은 사랑은 없다.</p> <span>
						사교계에서 이름 난 두 사람, 세이판(장동건)과 모지에위(장백지)는 내기를 한다. 두 사람은 모두 갖고 싶은 것 가져야
						하고 하고 싶은 건 해야 직성이 풀리는 성격이다. 모지에위는 자신을 배신한 남자에게 복수하기 위해 세이판에게 부탁을
						한다. 때 묻지 않은 어린 소녀 베이베이를 탐해 달라는, 이것부터가 상당히 위험한 게임이다. 모지에위는 이른 나이에
						남편을 잃고 험한 세상을 홀로 살아가면서 ...</span></a>

			</div>

			<div class="section_2">
				<!--리뷰 1,2,3의 묶음-->
				<div class="section_2_left" id="review1">
					<!--리뷰1-->
					<a href="review_detail02.jsp">
						<p class="minititle">[퍼스트 포지션]</p> <br />
						<p>
							<b>내 어릴적 꿈은 뭐였지?</b>
						</p> ﻿
						<p>토슈즈 냄새도 못맡아본 내가 영화를 , 그것도 발레에 관한 다큐를 보러간건 순전히 ...</p> <img
						src="http://img.cgv.co.kr/Community/Contents/2012/1031/퍼스트포지션.jpg"
						width="200px" align="center" alt="퍼스트포지션 이미지">
					</a>

				</div>
				<div class="section_2_middle" id="review2">
					<!--리뷰2-->
					<a href="review_detail03.jsp">
						<p class="minititle">[회사원]</p> <br />
						<p>
							<b>남자친구와 본 소지섭!</b>
						</p> ﻿
						<p>오랜만에 소지섭 출현으로 기대를 크게 했는데, 주연배우만 맘에들고, 스토리는 너무...</p> <img
						src="http://img.cgv.co.kr/Community/Contents/2012/1031/회사원.jpg"
						width="200px" align="center" alt="회사원 이미지">
					</a>
				</div>
				<div class="section_2_right" id="review3">
					<!--리뷰3-->
					<a href="review_detail04.jsp">
						<p class="minititle">[비정한 도시]</p> <br />
						<p>
							<b>영화관에서 혼자 본 영화!</b>
						</p> ﻿
						<p>영화관에서 혼자 본 건 이번이 처음이다. 췌장암에 걸린 여자는 어찌됐든 돈 해결이 되었는...</p> <img
						src="http://img.cgv.co.kr/Community/Contents/2012/1031/비정한도시.jpg"
						width="200px" align="center" alt="비정한도시 이미지">
					</a>
				</div>
			</div>

			<div class="section_3" id="reviewlist">
				<!-- 리뷰 리스트-->
				<p class="title">REVIEW</p>
				<ul>
					<c:forEach var="review" items="${reviews}">
						<li><a href="#"> <img
								src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000076/76602/76602100880_727.jpg"
								width="180px" height="120px" alt="아르고 이미지">
								<p class="minititle">${review.reviewName}</p>
								${review.contents}<br /> <span> 10:23:39 | 조회수 740
									| 추천수 3</span>
						</a></li>
					</c:forEach>
				</ul>
				<!--
					<li><a href="#"> <img
							src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000076/76602/76602100880_727.jpg"
							width="180px" height="120px" alt="아르고 이미지"> <!--  <p class="minititle">[ 아 르 고 ]</p> 워낙 미국에서 oscar buzz가 심했고, 몇주 전에
							타임에서 벤 에플렉 기사를 읽었던터라 기대감이 굉장히 높았다. 그런 만큼 실망하면 어쩌나 하면서 봤지만, 존 굿먼,
							앨런 아킨, 브라이언 크팬쇼... <br /><span> 10:23:39 | 조회수 740 | 추천수
								3</span>
					</a></li>
					<li><a href="#"> <img
							src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000076/76430/76430100405_727.jpg"
							width="180px" height="120px" alt="007스카이풀 이미지">
							<p class="minititle">[ 0 0 7 스 카 이 폴 ]</p> 007 스카이풀 듣던대로 스킬이 크고
							역시 기대했던만큼 좋으네요. 좋은 영화잘봤어용ㅋㅋㅋ<br /> <span>10:23:39 | 조회수
								740 | 추천수 3</span></a></li>
					<li><a href="#"> <img
							src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000076/76583/76583100930_727.jpg"
							width="180px" height="120px" alt="용의자x 이미지">
							<p class="minititle">[ 용 의 자 X ]</p> 내용도 면에선 조금느슨하지만 주연배우들의 연기는
							출중하다고 봄 마지막장면 부분이 슬프고 가슴아픈사연들이 기억에남네요.<br /> <span>10:23:39
								| 조회수 740 | 추천수 3</span></a></li>
					<li><a href="#"> <img
							src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000076/76584/7658499923_727.jpg"
							width="180px" height="120px" alt="늑대소년 이미지">
							<p class="minititle">[ 늑 대 소 년]</p> 늑대소년.. 혈액형 판독불가, 체온46도, 골격과
							근육이 코끼리와 비슷한 소년 소년은 소녀덕분에 세상에 나올수 있었습니다. 아무것도 알지 못하던 소년.. 소녀의 가족
							덕분에 사람이 느끼는 감정, 글, 말 등 여러가지를 배울 수 있었습니다. ... <br /> <span>10:23:39
								| 조회수 740 | 추천수 3</span></a></li>
					<li><a href="#"> <img
							src="http://img.cgv.co.kr/Community/Review/2012/1101/s2.jpg"
							width="180px" height="120px" alt="파라노말액티비티 이미지">
							<p class="minititle">[ 파 라 노 말 액 티 비 티 ]</p> 2009년, 15,000달러의 작은
							제작비로 만들어진 '파라노말 액티비티'는 미국에서만 1억불이 넘은 수익을 기록하며 흥행에 대성공을 거둔다.. 계속되는
							시리즈의 연이은 성공으로 1편에 대한 열광적인 호응이 일회성 해프닝이... <br /> <span>10:23:39
								| 조회수 740 | 추천수 3</span></a></li>
				</ul>
				-->
			</div>

			<div class='paging'>
				<a href="#">Prev</a> <strong>1</strong> <a href="#">2</a> <a
					href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">Next</a>
			</div>
		</div>

		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>