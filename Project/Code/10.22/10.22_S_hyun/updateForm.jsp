<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="board.BoardDBBean"%>
<%@ page import="board.BoardDataBean"%>
<%@ include file="/color.jsp"%>
<html>
<head>
<title>�Խ���</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	try {
		BoardDBBean dbPro = BoardDBBean.getInstance();
		BoardDataBean article = dbPro.updateGetArticle(num);
%>

<body bgcolor="<%=bodyback_c%>">
	<center>
		<b>�ۼ���</b> <br>
		<form method="post" name="writeform"
			action="updatePro.jsp?pageNum=<%=pageNum%>"
			onsubmit="return writeSave()">
			<table width="400" border="1" cellspacing="0" cellpadding="0"
				bgcolor="<%=bodyback_c%>" align="center">
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">�� ��</td>
					<td align="left" width="330"><input type="text" size="10"
						maxlength="10" name="writer" value="<%=article.getWriter()%>">
						<input type="hidden" name="num" value="<%=article.getNum()%>"></td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">�� ��</td>
					<td align="left" width="330"><input type="text" size="40"
						maxlength="50" name="subject" value="<%=article.getSubject()%>"></td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">Email</td>
					<td align="left" width="330"><input type="text" size="40"
						maxlength="30" name="email" value="<%=article.getEmail()%>"></td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">�� ��</td>
					<td align="left" width="330"><textarea name="content"
							rows="13" cols="40"><%=article.getContent()%></textarea></td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">��й�ȣ</td>
					<td align="left" width="330"><input type="password" size="8"
						maxlength="12" name="passwd"></td>
				</tr>
				<tr>
					<td colspan=2 bgcolor="<%=value_c%>" align="center"><input
						type="submit" value="�ۼ���"> <input type="reset"
						value="�ٽ��ۼ�"> <input type="button" value="��Ϻ���"
						onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
					</td>
				</tr>
			</table>
		</form>
		<%
			} catch (Exception e) {
			}
		%>
	
</body>
</html>
