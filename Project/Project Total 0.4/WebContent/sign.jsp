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
<link href="stylesheets/reservation/sign.css" rel="stylesheet">
</head>
<body>
	<div class="wrap">
		<form class="form-horizontal">
			<div class="control-group">
				<label class="control-label" for="inputText">결제ID</label>
				<div class="controls">
					<input type="text" id="inputText">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputText">결제 공연명</label>
				<div class="controls">
					<input type="text" id="inputText">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputText">결제 매수</label>
				<div class="controls">
					<input type="text" id="inputText">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputText">결제 금액</label>
				<div class="controls">
					<input type="text" id="inputText">
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn">결제</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn">취소</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>