<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버십 페이지</title>
<link href="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/css/bootstrap.css" rel="stylesheet">
<link href="stylesheets/Mainpage_Layout.css" rel="stylesheet" type="text/css">
<link href="stylesheets/membership/membership.css" rel="stylesheet"	type="text/css">
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
						<li class="active"><a href="membership.jsp">멤버십</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div id="content">
			<!-- 실직적으로 보여질 정보들-->
			<div id="top">
				<h1>M J U Membership</h1>
				<ul>
					<li class='section'>
						<p align="center">
							<b> 멤버쉽 기본 혜택 </b>
						</p>
						<ul>
							<li>멤버십 포인트로 평일 영화 무료, 매점 할인 등 혜택 제공</li>
							<li>시사회 등 이벤트 우선 참여 기회</li>
							<li>생일 회원 콤보 2천원 할인권 증정</li>
						</ul>
					</li>
					<li class='section'>
						<p align="center">
							<b> 멤버쉽 가입 방법 </b>
						</p>
						<ol>
							<li>홈페이지 회원 가입 / 카드발급신청<br /> (카드발급 신청 양식 작성)
							</li>
							<li>극장에서 멤버십 카드 수령<br /> (회원가입 및 카드번호 등록)
							</li>
						</ol>
					</li>
				</ul>
			</div>

			<div id="middle">
				<table border="1">
					<tr>
						<th>멤버쉽종류</th>
						<th>할인혜택</th>
						<th>자격조건</th>
					</tr>
					<tr>
						<td><img src="images/vip.jpg"></td>
						<td>
							<ol>
								<li>공연 예매시 20% 할인</li>
								<li>공연 관람 금액 15% 적립</li>
								<li>VIP 좌석 예매 가능</li>
							</ol>
						</td>
						<td>
							<ol>
								<li>총 관람횟수 100회</li>
								<li>누적 결제금액 300,000원</li>
								<li>리뷰 작성 횟수 20회</li>
							</ol>
						</td>
					</tr>
					<tr>
						<td><img src="images/platinum.jpg"></td>
						<td>
							<ol>
								<li>공연 예매시 15% 할인</li>
								<li>공연 관람 금액 10% 적립</li>
								<li>PLATINUM 좌석 예매 가능</li>
							</ol>
						</td>
						<td>
							<ol>
								<li>총 관람횟수 50회</li>
								<li>누적 결제금액 150,000원</li>
								<li>리뷰 작성 횟수 10회</li>
							</ol>
						</td>
					</tr>
					<tr>
						<td><img src="images/gold.jpg"></td>
						<td>
							<ol>
								<li>공연 예매시 10% 할인</li>
								<li>공연 관람 금액 5% 적립</li>
								<li>GOLD 좌석 예매 가능</li>
							</ol>
						</td>
						<td>
							<ol>
								<li>총 관람횟수 25회</li>
								<li>누적 결제금액 50,000원</li>
								<li>리뷰 작성 횟수 2회</li>
							</ol>
						</td>
					</tr>
				</table>
			</div>

			<div id="bottom">
				<h2>- 할인 적용 대상 -</h2>
				<table border="1" class='sale'>
					<tr>
						<th>M E N U</th>
						<th>P O I N T</th>
					</tr>
					<tr>
						<td>탄산음료(중)</td>
						<td>2,500점</td>
					</tr>
					<tr>
						<td>팝콘(중)</td>
						<td>4,000점</td>
					</tr>
					<tr>
						<td>팝콘(대)</td>
						<td>6,000점</td>
					</tr>
					<tr>
						<td>팝콘(중) 음료 콤보</td>
						<td>6,000점</td>
					</tr>
					<tr>
						<td>팝콘(대) 음료 콤보</td>
						<td>8,000점</td>
					</tr>
					<tr>
						<td>평일/주말 관람 1매</td>
						<td>8,000점</td>
					</tr>
				</table>
			</div>
		</div>

		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>