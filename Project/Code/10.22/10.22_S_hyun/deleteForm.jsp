<%@ page contentType="text/html;charset=euc-kr"%>
<%@ include file="/color.jsp"%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>
<html>
<head>
<title>�Խ���</title>
<link href="style.css" rel="stylesheet" type="text/css">

<script language="JavaScript">
<!--
	function deleteSave() {
		if (document.delForm.passwd.value == '') {
			alert("��й�ȣ�� �Է��Ͻʽÿ�.");
			document.delForm.passwd.focus();
			return false;
		}
	}
// -->
</script>
</head>

<body bgcolor="<%=bodyback_c%>">
	<center>
		<b>�ۻ���</b> <br>
		<form method="POST" name="delForm"
			action="deletePro.jsp?pageNum=<%=pageNum%>"
			onsubmit="return deleteSave()">
			<table border="1" align="center" cellspacing="0" cellpadding="0"
				width="360">
				<tr height="30">
					<td align=center bgcolor="<%=value_c%>"><b>��й�ȣ�� �Է��� �ּ���.</b></td>
				</tr>
				<tr height="30">
					<td align=center>��й�ȣ : <input type="password" name="passwd"
						size="8" maxlength="12"> <input type="hidden" name="num"
						value="<%=num%>"></td>
				</tr>
				<tr height="30">
					<td align=center bgcolor="<%=value_c%>"><input type="submit"
						value="�ۻ���"> <input type="button" value="�۸��"
						onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
					</td>
				</tr>
			</table>
		</form>
</body>
</html>
