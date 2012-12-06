<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약페이지</title>
<link
	href="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/css/bootstrap.css"
	rel="stylesheet">
<link href="stylesheets/Mainpage_Layout.css" rel="stylesheet"
	type="text/css">
<link href="stylesheets/reservation/reserve.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
<script	
	src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap.js"></script>
<script src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>
<script src="javascript/allscript.js"></script>

<script>
	/* 달력선택 script */
	$(function() {
		$("#datepicker").datepicker();
	});
	/* 계산 임시
	  function calculatePay() {
		  var result = eval(document.mypay.ticketAmountConcert.options.value);
		  document.mypay.reservationCost.value = result*7000;
		  }
	 */
	 /* 최종결제금액 script */
	function calculatePay() {
		var result = document.mypay.ticketAmountConcert.options.value;
		switch (result) {
		case "num0":
			result = 0;
			break;
		case "num1":
			result = 1;
			break;
		case "num2":
			result = 2;
			break;
		case "num3":
			result = 3;
			break;
		case "num4":
			result = 4;
			break;
		case "num5":
			result = 5;
		}

		document.mypay.reservationCost.value = result * 7000;
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
						<li class="active"><a href="ReservationManageController?action=index">예약 </a></li>
						<li><a href="ReviewManageController?action=index">리뷰</a></li>
						<li><a href="membership.jsp">멤버십</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div id="content">
			<form name="mypay" action="ReservationManageController" method="post">
				<div class="section_1" id="reserve">
					<ul>
						<li>
							<h3>티 켓 선 택 / 매 수 선 택</h3> <select name="concertName">
								<option value="Test">기막힌 스캔들</option>
								<option value="concert2">러브액츄얼리</option>
								<option value="concert3">삼봉이발소</option>
						</select><br /> <select size="1" name="ticketAmountConcert"
							onChange="calculatePay()">
								<option value="num0" selected>&nbsp; 매수를 선택하세요 &nbsp;</option>
								<option value="num1">&nbsp; 1 매 &nbsp;</option>
								<option value="num2">&nbsp; 2 매 &nbsp;</option>
								<option value="num3">&nbsp; 3 매 &nbsp;</option>
								<option value="num4">&nbsp; 4 매 &nbsp;</option>
								<option value="num5">&nbsp; 5 매 &nbsp;</option>
						</select><br />
						</li>
						<li>
							<h3>공 연 날 짜 선 택</h3> Date: <input type="text" id="rdate"
							name="concertDate" />
						</li>
					</ul>
					<ul>
						<li>
							<h3>공 연 좌 석 선 택</h3> <select name="ticketAmountSeat">
								<option value="A">A석 - (1~10)</option>
								<option value="B">B석 - (1~10)</option>
								<option value="C">C석 - (1~10)</option>
								<option value="D">D석 - (1~10)</option>
								<option value="E">E석 - (1~10)</option>
								<option value="F">F석 - (1~10)</option>
								<option value="G">G석 - (1~10)</option>
						</select>
							<p>
								<img
									src="http://art.incheon.go.kr/icweb/files/web26/images/002/img_002003001001.jpg"
									alt="공연좌석 이미지">
							</p>
						</li>
						<li>
							<h3>최종 결제 금액 (vat포함)</h3> <input type="text"
							name="reservationCost" size="5" style="text-align: right;" />원 <input
							type="submit" class="submit" name="paybutton" value="예매하기" />
						</li>
					</ul>
				</div>
				<div class="section_2" id="ticket_detail">
					<!--티켓예매 참고사항-->
					<hr />
					<h3>* 티켓예매 참고사항 *</h3>
					<p class="method">예매티켓 수령(입장)방법</p>

					<p>
						관람 당일 공연장 매표소에서 메세나티켓 예매자라 밝히시고 <br /> 예매자 성함(이름)을 얘기하시면 곧바로 티켓을
						받아 입장하실 수 있습니다.<br /> 예매한 티켓내역은 공연사로 실시간 전송되어 공연장 매표소에서 곧바로 확인
						가능합니다.<br />
						<!--
				예매티켓 취소, 변경은 관람 1일전 오후 5시까지만 가능합니다.<br/>
				관람 1일전 오후 5시 이후 예매티켓, 관람당일 예매티켓은 취소, 변경 불가능합니다.<br/><br/>
				</p>
				<p class="method">공연장 좌석배치></p>
				<p>
				공연사 사정에 의해 좌석지정 상황이 조금씩 달라 질 수 있습니다. <br/>
				공연 및 공연장 위치 문의 : 극단 조은무대 02-537-5510 <br/>
				본 공연은 공연사의 사정 또는 기타사유로 인해 공연일정이 변경될 수 있으며 <br/>
				공연일정 변경시 예매금액은 전액 환불하여드립니다. <br/>
				</p>-->
				</div>
				<input type="hidden" name="action" value="register"></input>
			</form>
		</div>

		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>