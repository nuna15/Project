<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
	<%
		try {
			if (session.getAttribute("userid") != null) {
				session.invalidate();
			}
		} catch (Exception e) {
		} finally {
	%>
	<script language=javascript>
		window.location.href = 'login.jsp'
	</script>
	<%
		}
	%>

</body>
</html>
