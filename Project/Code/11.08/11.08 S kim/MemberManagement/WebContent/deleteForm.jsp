<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ include file="/color.jsp"%>
<html>
<head>
<title>ȸ��Ż��</title>
<link href="style.css" rel="stylesheet" type="text/css">

<script language="javascript">
     <!--
       function begin(){
         document.myform.passwd.focus();
       }

       function checkIt(){
		  if(!document.myform.passwd.value){
           alert("��й�ȣ�� �Է����� �����̽��ϴ�.");
           document.myform.passwd.focus();
           return false;
         }
	   }   
     -->
   </script>
</head>
<BODY onload="begin()" bgcolor="<%=bodyback_c%>">
	<form name="myform" action="deletePro.jsp" method="post"
		onSubmit="return checkIt()">
		<TABLE cellSpacing=1 cellPadding=1 width="260" border=1 align="center">

			<TR height="30">
				<TD colspan="2" align="middle" bgcolor="<%=title_c%>"><font
					size="+1"><b>ȸ�� Ż��</b></font></TD>
			</TR>

			<TR height="30">
				<TD width="110" bgcolor="<%=value_c%>" align=center>��й�ȣ</TD>
				<TD width="150" align=center><INPUT type=password name="passwd"
					size="15" maxlength="12"></TD>
			</TR>
			<TR height="30">
				<TD colspan="2" align="middle" bgcolor="<%=value_c%>"><INPUT
					type=submit value="ȸ��Ż��"> <input type="button" value="��  ��"
					onclick="javascript:window.location='main.jsp'"></TD>
			</TR>
		</TABLE>
	</form>
</BODY>
</HTML>
