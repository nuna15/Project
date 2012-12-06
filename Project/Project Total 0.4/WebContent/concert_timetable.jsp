<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연시간페이지</title>
<link href="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/css/bootstrap.css" rel="stylesheet">
<link href="stylesheets/Mainpage_Layout.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker();
	});
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
						<li><a href="ReservationManageController?action=index">예약 </a></li>
						<li><a href="ReviewManageController?action=index">리뷰</a></li>
						<li><a href="membership.jsp">멤버십</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="content">
			<!-- 실직적으로 보여질 정보들-->
			<div id="information"
				style="width: 800px; padding-top: 50px; margin: 0 auto; border: 1px solid #B0B0B0;">
				<center>
					<img
						src="http://www.yawooricinema.com/images/sub_03/title_img_01.jpg">
				</center>
				<center>
					<p>
						Date: <input type="text" id="datepicker" value="11/14/2012" />
					</p>
				</center>
				<hr />

				<div>
					<table border="1" width="800px">
						<tr>
							<th width="400px;" height="50px">공연명</th>
							<th>등급</th>
							<th>상영시간</th>
						</tr>
						<tr>
							<td><img
								src="http://www.mecenatticket.com/story/dataroom/product_img/1325052970/gi02.jpg"
								style="width: 150px; height: 150px; float: left;"> <b><p>
										기막힌스캔들</p></b>
								<p>상영시간 : 120분</p>
								<p>개봉일 : 2012-09-27</p>
								<P>배우 : 김태우, 예지원</p></td>
							<td>전체관람가</td>
							<td>
								<p>11:35 ~ 13:17</p>
								<p>15:50 ~ 17:32</p>
								<p>19:35 ~ 21:30</p>
							</td>
						</tr>
						<tr>
							<td><img
								src="http://www.mecenatticket.com/story/dataroom/product_img/1348116827/12.jpg"
								style="width: 150px; height: 150px; float: left;"> <b><p>
										러브액츄얼리</p></b>
								<p>상영시간 : 120분</p>
								<p>개봉일 : 2012-09-27</p>
								<P>배우 : 김태우, 예지원</p></td>
							<td>전체관람가</td>
							<td>
								<p>11:35 ~ 13:17</p>
								<p>15:50 ~ 17:32</p>
							</td>
						</tr>
						<tr>
							<td><img
								src="http://www.mecenatticket.com/story/dataroom/product_img/1334127752/12.jpg"
								style="width: 150px; height: 150px; float: left;"> <b><p>
										삼봉이발소</p></b>
								<p>상영시간 : 120분</p>
								<p>개봉일 : 2012-09-27</p>
								<P>배우 : 김태우, 예지원</p></td>
							<td>전체관람가</td>
							<td>
								<p>11:35 ~ 13:17</p>
								<p>15:50 ~ 17:32</p>
								<p>19:35 ~ 21:30</p>
							</td>
						</tr>
						<tr>
							<td><img
								src="http://www.mecenatticket.com/story/dataroom/product_img/1348040938/2.jpg"
								style="width: 150px; height: 150px; float: left;"> <b><p>
										골때리는 그녀</p></b>
								<p>상영시간 : 120분</p>
								<p>개봉일 : 2012-09-27</p>
								<P>배우 : 김태우, 예지원</p></td>
							<td>전체관람가</td>
							<td>
								<p>11:35 ~ 13:17</p>
								<p>15:50 ~ 17:32</p>
							</td>
						</tr>
					</table>
				</div>

			</div>
		</div>

		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>