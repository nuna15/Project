<%@ page contentType="text/html;charset=euc-kr"%>
<%@ include file="/color.jsp"%>
<html>
<head>
<title>ȸ��Ż��</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<%
	String id = (String) session.getAttribute("memId");
	String passwd = request.getParameter("passwd");

	logon.LogonDBBean manager = logon.LogonDBBean.getInstance();
	int check = manager.deleteMember(id, passwd);

	if (check == 1) {
		session.invalidate();
%>
<body bgcolor="<%=bodyback_c%>">
	<form method="post" action="main.jsp" name="userinput">
		<table width="270" border="0" cellspacing="0" cellpadding="5"
			align="center">
			<tr bgcolor="<%=title_c%>">
				<td height="39" align="center"><font size="+1"><b>ȸ��������
							�����Ǿ����ϴ�.</b></font></td>
			</tr>
			<tr bgcolor="<%=value_c%>">
				<td align="center">
					<p>����</p>
					<meta http-equiv="Refresh" content="5;url=main.jsp">
				</td>
			</tr>
			<tr bgcolor="<%=value_c%>">
				<td align="center"><input type="submit" value="Ȯ��"></td>
			</tr>
		</table>
	</form>
	<%
		} else {
	%>
	<script>
		alert("��й�ȣ�� ���� �ʽ��ϴ�.");
		history.go(-1);
	</script>
	<%
		}
	%>

</body>
</html>
