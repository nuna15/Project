<%@ page contentType="text/html; charset=euc-kr"%>
<%@ include file="/color.jsp"%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<%
	//답변글의 경우 : 부모글의 글번호, 그룹화번호, 그룹화내의 순서, 들여쓰기<=content.jsp페이지에서 넘어옴
	int num = 0, ref = 1, re_step = 0, re_level = 0;
	try {
		if (request.getParameter("num") != null) {//답변글
			num = Integer.parseInt(request.getParameter("num"));
			ref = Integer.parseInt(request.getParameter("ref"));
			re_step = Integer.parseInt(request.getParameter("re_step"));
			re_level = Integer.parseInt(request
					.getParameter("re_level"));
		}
%>

<body bgcolor="<%=bodyback_c%>">
	<center>
		<b>글쓰기</b> <br>
		<form method="post" name="writeform" action="writePro.jsp"
			onsubmit="return writeSave()">
			<input type="hidden" name="num" value="<%=num%>"> <input
				type="hidden" name="ref" value="<%=ref%>"> <input
				type="hidden" name="re_step" value="<%=re_step%>"> <input
				type="hidden" name="re_level" value="<%=re_level%>">

			<table width="400" border="1" cellspacing="0" cellpadding="0"
				bgcolor="<%=bodyback_c%>" align="center">
				<tr>
					<td align="right" colspan="2" bgcolor="<%=value_c%>"><a
						href="list.jsp"> 글목록</a></td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">이 름</td>
					<td width="330"><input type="text" size="10" maxlength="10"
						name="writer"></td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">제 목</td>
					<td width="330">
						<%
							if (request.getParameter("num") == null) {//제목글
						%> <input type="text" size="40" maxlength="50" name="subject">
					</td>
					<%
						} else {//답변글
					%>
					<input type="text" size="40" maxlength="50" name="subject"
						value="[답변]">
					</td>
					<%
						}
					%>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">Email</td>
					<td width="330"><input type="text" size="40" maxlength="30"
						name="email"></td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">내 용</td>
					<td width="330"><textarea name="content" rows="13" cols="40"></textarea>
					</td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">비밀번호</td>
					<td width="330"><input type="password" size="8" maxlength="12"
						name="passwd"></td>
				</tr>
				<tr>
					<td colspan=2 bgcolor="<%=value_c%>" align="center"><input
						type="submit" value="글쓰기"> <input type="reset"
						value="다시작성"> <input type="button" value="목록보기"
						OnClick="window.location='list.jsp'"></td>
				</tr>
			</table>
			<%
				} catch (Exception e) {
				}
			%>
		</form>
</body>
</html>
