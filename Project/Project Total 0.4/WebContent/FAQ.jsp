<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 페이지</title>
<link href="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/css/bootstrap.css" rel="stylesheet">
<link href="stylesheets/Mainpage_Layout.css" rel="stylesheet" type="text/css">
<link href="stylesheets/FAQ/FAQ.css" rel="stylesheet" type="text/css">
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
						<li><a href="ConcertManageController?action=index">공연</a></li>
						<li><a href="ReservationManageController?action=index">예약 </a></li>
						<li><a href="ReviewManageController?action=index">리뷰</a></li>
						<li><a href="membership.jsp">멤버십</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="contenet">
			<div class="up_section_1">
				<div class="left_up_section_1">
					<a href="FAQ.jsp">FAQ</a>
				</div>
				<div class="right_up_section_1">
					<a href="1_1question.jsp">1:1문의</a>
				</div>
			</div>
			<div class="down_section_1">
				<div class="faq_section_1">
					<div id="board">
						<div id="title_bar">
							<div class="row_title">
								<colgroup>
									<col width="20%">
									<col width="*">
									<col width="15%">
								</colgroup>
								<div class="category">분류</div>
								<div class="question">질문</div>
								<div class="read">조회수</div>
							</div>
						</div>

						<div id="content">
							<div class="row">
								<div class="category">멤버십</div>
								<div class="question">
									<a href="#">Q아이디 변경이 가능한가요?</a>
								</div>
								<div class="read">47</div>
							</div>
							<div class="row">
								<div class="category">공연예매</div>
								<div class="question">
									<a href="#">Q예매를 한 뒤, 시간대나 좌석변경이 가능한가요?</a>
								</div>
								<div class="read">515</div>
							</div>
							<div class="row">
								<div class="category">홈페이지</div>
								<div class="question">
									<a href="#">Q예매가 되지 않아 선택했던 좌석으로 다시 예매를 하려고 하는데 왜 이미 판매된
										좌석으로 표시되나요?</a>
								</div>
								<div class="read">1</div>
							</div>
							<div class="row">
								<div class="category">기타</div>
								<div class="question">
									<a href="#">Q1:1문의를 남겼는데 답변이 오지 않아요.</a>
								</div>
								<div class="read">11</div>
							</div>
							<div class="row">
								<div class="category">기타</div>
								<div class="question">
									<a href="#">Q멤버십 포인트 적립은 어디서 확인하나요?</a>
								</div>
								<div class="read">55</div>
							</div>
							<div class="row">
								<div class="category">리뷰</div>
								<div class="question">
									<a href="#">Q리뷰게시판은 어떻게 사용하나요?</a>
								</div>
								<div class="read">42</div>
							</div>
							<div class="row">
								<div class="category">공연예매</div>
								<div class="question">
									<a href="#">Q예매를 클릭해도 예매창이 열리지 않아요.</a>
								</div>
								<div class="read">2</div>
							</div>
							<div class="row">
								<div class="category">멤버십</div>
								<div class="question">
									<a href="#">Q개명을 하였는데 어떻게 바꾸어야 하나요?</a>
								</div>
								<div class="read">100</div>
							</div>
							<div class="row">
								<div class="category">기타</div>
								<div class="question">
									<a href="#">Q공연장 내 음식물 반입에 대하여 자세히 알려주세요.</a>
								</div>
								<div class="read">92</div>
							</div>
							<div class="row">
								<div class="category">홈페이지</div>
								<div class="question">
									<a href="#">Q아이디와 비밀번호를 잃어버렸습니다.</a>
								</div>
								<div class="read">223</div>
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class='paging'>
				<a href="#">Prev</a> <a href="#">1</a> <strong>2</strong> <a
					href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">Next</a>
			</div>
		</div>

		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>