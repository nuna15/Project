<%@ page contentType="text/html;charset=euc-kr"%>
<%@ include file="/color.jsp"%>

<html>
<head>
<title>ȸ����������</title>
<link href="style.css" rel="stylesheet" type="text/css">


<script language="JavaScript">
   <!-- 
    function checkIt() {
        var userinput = eval("document.userinput");
               
        if(!userinput.passwd.value ) {
            alert("��й�ȣ�� �Է��ϼ���");
            return false;
        }
        /*if(userinput.passwd.value != userinput.passwd2.value)
        {
            alert("��й�ȣ�� �����ϰ� �Է��ϼ���");
            return false;
        }*/
       
        if(!userinput.name.value) {
            alert("����� �̸��� �Է��ϼ���");
            return false;
        }
        /*if(!userinput.jumin1.value  || !userinput.jumin2.value )
        {
            alert("�ֹε�Ϲ�ȣ�� �Է��ϼ���");
            return false;
        }*/
    }
-->
</script>

<%
	//������� id���� ���ǼӼ������κ��� ��
	String id = (String) session.getAttribute("memId");
	//42~43: DB�����ϴº� id���� �ش��ϴ� ���ڵ带 ���� �κ�
	logon.LogonDBBean manager = logon.LogonDBBean.getInstance();
	logon.LogonDataBean c = manager.getMember(id);
	//manager.getMember(id)�޼ҵ尡 �����������ü�� ���� 
	try {
%>

<body bgcolor="<%=bodyback_c%>">
	<form method="post" action="modifyPro.jsp" name="userinput"
		onsubmit="return checkIt()">

		<table width="600" border="1" cellspacing="0" cellpadding="3"
			align="center">
			<tr>
				<td colspan="2" height="39" bgcolor="<%=title_c%>" align="center">
					<font size="+1"><b>ȸ�� ��������</b></font>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="normal" align="center">ȸ���� ������ �����մϴ�.</td>
			</tr>
			<tr>
				<td width="200" bgcolor="<%=value_c%>"><b>���̵� �Է�</b></td>
				<td width="400" bgcolor="<%=value_c%>">&nbsp;</td>
			<tr>
			<tr>
				<td width="200">����� ID</td>
				<td width="400"><%=c.getId()%></td>
			</tr>

			<tr>
				<td width="200">��й�ȣ</td>
				<td width="400"><input type="password" name="passwd" size="10"
					maxlength="10" value="<%=c.getPasswd()%>"></td>
			<tr>
			<tr>
				<td width="200" bgcolor="<%=value_c%>"><b>�������� �Է�</b></td>
				<td width="400" bgcolor="<%=value_c%>">&nbsp;</td>
			<tr>
			<tr>
				<td width="200">����� �̸�</td>
				<td width="400"><input type="text" name="name" size="15"
					maxlength="20" value="<%=c.getName()%>"></td>
			</tr>
			<tr>
				<td width="200">�ֹε�Ϲ�ȣ</td>
				<td width="400"><%=c.getJumin1()%>-<%=c.getJumin2()%></td>
			</tr>
			<tr>
				<td width="200">facebook</td>
				<td width="400">
					<%
						if (c.getFacebook() == null) {
					%> <input type="text" name="email" size="40" maxlength="30">
					<%
						} else {
					%> <input type="text" name="email" size="40" maxlength="30"
					value="<%=c.getFacebook()%>"> <%
 	}
 %>
				</td>
			</tr>
			} %>
			</td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="<%=value_c%>"><input
					type="submit" name="modify" value="��   ��"> <input
					type="button" value="��  ��"
					onclick="javascript:window.location='main.jsp'"></td>
			</tr>
		</table>
	</form>
</body>
<%
	} catch (Exception e) {
	}
%>
</html>