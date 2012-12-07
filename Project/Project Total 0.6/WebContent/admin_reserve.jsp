<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>취소율 예매율</title>
<link
	href="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/css/bootstrap.css"
	rel="stylesheet">
<link href="stylesheets/Mainpage_Layout.css" rel="stylesheet"
	type="text/css">
<link href="stylesheets/admin/admin_reserve.css" rel="stylesheet"
	type="text/css">
<script
	src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap.js"></script>
<!--Load the AJAX API-->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
	// Load the Visualization API and the piechart package.
	google.load('visualization', '1.0', {
		'packages' : [ 'corechart' ]
	});
	// Set a callback to run when the Google Visualization API is loaded.
	google.setOnLoadCallback(drawChart);
	// Callback that creates and populates a data table,
	// instantiates the pie chart, passes in the data and
	// draws it.
	function drawChart() {
		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'howmuch');
		data.addColumn('number', 'number');
		data.addRows([ [ '기막힌스캔들', 5 ], [ '러브액츄얼리', 5 ], [ '삼봉이발소', 2 ],
				[ '기막힌스캔들', 4 ], [ '골때리는그녀', 2 ] ]);
		// Set chart options
		var options = {
			'title' : '공연 예매율',
			'width' : 300,
			'height' : 250
		};
		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.PieChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);
	}
</script>
<script type='text/javascript' src='https://www.google.com/jsapi'></script>
<script type='text/javascript'>
	google.load('visualization', '1', {
		packages : [ 'gauge' ]
	});
	google.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'Label', 'Value' ], 
				[ '옥탑방고양이', 10 ], 
				[ '기막힌 스캔들', 50 ],
				[ '삼봉이발소', 55 ],
				[ '기막힌 스캔들', 50 ],
				[ '삼봉이발소', 55 ],
				[ '삼봉이발소', 68 ] ]);

		var options = {

			width : 300,
			height : 300,
			redFrom : 90,
			redTo : 100,
			yellowFrom : 75,
			yellowTo : 90,
			minorTicks : 5
		};

		var chart = new google.visualization.Gauge(document
				.getElementById('chat_div'));
		chart.draw(data, options);
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
						<li><a href="AdminManageController?action=status">사용현황</a></li>
						<li class="active"><a
							href="AdminManageController?action=reserve">예매/취소율 </a></li>
						<li><a href="AdminManageController?action=master">권한 관리</a></li>
						<li><a href="ConcertManageController?action=register">공연추가 / 수정</a></li>
						<li></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="content">
			<!-- 실직적으로 보여질 정보들-->
			<div class="name">예매율/취소율</div>
			<div class="section_1" id="reserve">

				<!--Div that will hold the pie chart-->
				<div class="section_1_left">
					<div id="chart_div"></div>
				</div>
				<div class="section_1_right">
					취소율
					<div id="chat_div"></div>
				</div>
			</div>
		</div>
		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>