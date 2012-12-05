<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<link href="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/css/bootstrap.css" rel="stylesheet">
<link href="stylesheets/Mainpage_Layout.css" rel="stylesheet" type="text/css">
<link href="stylesheets/main/Mainpage.css" rel="stylesheet"	type="text/css">
<script src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap.js"></script>
<script src="slide/js/jquery-1.3.1.min.js"></script>
<script src="slide/js/jquery.easing.1.3.js"></script>
<script src="javascript/allscript.js"></script>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
  html { height: 100% }
  body { height: 100%; margin: 0px; padding: 0px }
  #map_canvas { height: 100% }
</style>
<script type="text/javascript"
    src="https://maps.google.com/maps/api/js?sensor=false">
</script>

<script type="text/javascript">
  function initialize() {
    var myLatlng = new google.maps.LatLng(37.655208485476614,126.77231580018997);
    var myOptions = {
      zoom: 12,
      center: myLatlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    
    var marker = new google.maps.Marker({
        position: myLatlng, 
        map: map,
        title:"일산 웨스턴 돔"
    });   
  }
</script>
</head>
<body onload="initialize()">
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
			<div class="section_1" id="concert">
				<a href="ConcertManageController?action=index"><h1>공연정보</h1></a>
				<div class='slide'>
					<div class='qitem'>
						<a href="ConcertManageController?action=index"><img src="slide/1.jpg" alt="Test 1"
							width="126" height="126" /></a> <span class="caption">
							<h4>광해</h4>
							<p>예매율 : 13.9%</p>
							<p>배우 : 이병헌, 한효주</p>
							<p>상영시간 : 131분</p>
							<p>개봉일2012.09.13</p>
						</span>
					</div>
					<div class='qitem'>
						<a href="ConcertManageController?action=index"><img src="slide/2.jpg" alt="Test 1"
							width="126" height="126" /></a> <span class="caption">
							<h4>007 스카이폴</h4>
							<p>예매율 : 13.9%</p>
							<p>배우 : 이병헌, 한효주</p>
							<p>상영시간 : 131분</p>
							<p>개봉일2012.09.13</p>
						</span>
					</div>
					<div class='clear'></div>
					<div class='qitem'>
						<a href="ConcertManageController?action=index"><img src="slide/3.jpg" alt="Test 1"
							width="126" height="126" /></a> <span class="caption">
							<h4>아르고</h4>
							<p>예매율 : 13.9%</p>
							<p>배우 : 이병헌, 한효주</p>
							<p>상영시간 : 131분</p>
							<p>개봉일2012.09.13</p>
						</span>
					</div>
					<div class='qitem'>
						<a href="ConcertManageController?action=index"><img src="slide/4.jpg" alt="Test 1"
							width="126" height="126" /></a> <span class="caption">
							<h4>용의자X</h4>
							<p>예매율 : 13.9%</p>
							<p>배우 : 이병헌, 한효주</p>
							<p>상영시간 : 131분</p>
							<p>개봉일2012.09.13</p>
						</span>
					</div>
				</div>
			</div>

			<div class="section_2" id="reserve">
				<a href="ReservationManageController?action=index"><h1>예매</h1></a>
				<ul>			
						<%
							if (request.getSession() != null) {
								if(request.getSession().getAttribute("userid") != null) {
						%>
							<li>영화예매<a href="ReservationManageController?action=index"><button onclick="location.href('ReservationManageController?action=index')">예매하러가기</button></a><br />	
						<%
							}else if(request.getSession().getAttribute("userid") == null) {
						%>
							<li>영화예매<a href=""><button onclick="location.href('#')">예매하러가기</button></a><br />
						<%
							}else {
						%>
							<li>영화예매<a href=""><button onclick="location.href('#')">예매하러가기</button></a><br />
						<%
							}
						}
						%>
						<p class='box'>사이트 상단의 예매하기 메뉴를 누르시거나 본 내용 상단의 예매하기를 누르시면 인터넷
							예매가 가능합니다.</p>
					</li>
					<li>예매 가능 시간 <br />
						<p class='box'>인터넷으로 예매가 가능한 시간은 해당 공연 상영 1시간 전까지 이며 이후 예매를
							원하실 경우에는 영화관 현장에 직접 가셔서 예매를 하셔야합니다.</p>
					</li>
					<li>예매확인/취소 <a href="UserManageController?action=myReservationHistoryPage"><button
								onclick="location.href('UserManageController?action=myReservationHistoryPage')">예매확인/취소</button></a><br />
						<p class='box'>
							- 예매 취소 및 환불 가능 시간은 해당 공영 상영 20분 전까지입니다.<br /> - 관람권으로 교환한 입장권은
							현금환불 및 취소가 되지 않습니다.
						</p>
					</li>
				</ul>
			</div>

			<div class="section_3" id="review">
				<a href="ReviewManageController?action=index"><h1>리뷰</h1></a>

				<a href="review_detail01.jsp">
					<p class="review_detail">
						<img title="용의자X"
							src="http://image.maxmovie.com/movieinfo/image/poster/movie/Max2012suspectxkr_ver3.jpg"
							width="60px"> [기자] 원작 본연의 재미 위에 진한 감성을 더하다[네티즌]
						&lt;용의자X&gt; 류승범의 연기와 원작의 힘![네티즌] 한 여자를 진심으로 사랑한 한 남자의 이야기[네티즌] 한
						여자를 진심으로 사랑한 한 관객평점8.82
					</p>
				</a>
				<hr />

				<a href="review_detail02.jsp">
					<p class="review_detail">
						<img title="용의자X"
							src="http://image.maxmovie.com/movieinfo/image/poster/movie/Max2012argo_ver2.jpg"
							width="60px"> [기자] 원작 본연의 재미 위에 진한 감성을 더하다[네티즌]
						&lt;용의자X&gt; 류승범의 연기와 원작의 힘![네티즌] 한 여자를 진심으로 사랑한 한 남자의 이야기[네티즌] 한
						여자를 진심으로 사랑한 한 관객평점8.82
					</p>
				</a>
				<hr />

				<a href="review_detail03.jsp">
					<p class="review_detail">
						<img title="용의자X"
							src="http://image.maxmovie.com/movieinfo/image/poster/movie/Maxchosunking_ver2.jpg"
							width="60px"> [기자] 원작 본연의 재미 위에 진한 감성을 더하다[네티즌]
						&lt;용의자X&gt; 류승범의 연기와 원작의 힘![네티즌] 한 여자를 진심으로 사랑한 한 남자의 이야기[네티즌] 한
						여자를 진심으로 사랑한 한 관객평점8.82
					</p>
				</a>
			</div>

			<div class="section_4" id="membership">
				<div id="map_canvas" style="width:100%; height:100%"></div>
			</div>
		</div>
		
		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>

