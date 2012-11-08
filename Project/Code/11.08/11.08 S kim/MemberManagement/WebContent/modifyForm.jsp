<%@ page contentType="text/html;charset=euc-kr"%>
<%@ include file="/color.jsp"%>

<html>
<head>
<title>회원정보수정</title>
<link href="style.css" rel="stylesheet" type="text/css">


<script language="JavaScript">
   <!-- 
    function checkIt() {
        var userinput = eval("document.userinput");
               
        if(!userinput.passwd.value ) {
            alert("비밀번호를 입력하세요");
            return false;
        }
        /*if(userinput.passwd.value != userinput.passwd2.value)
        {
            alert("비밀번호를 동일하게 입력하세요");
            return false;
        }*/
       
        if(!userinput.name.value) {
            alert("사용자 이름을 입력하세요");
            return false;
        }
        /*if(!userinput.jumin1.value  || !userinput.jumin2.value )
        {
            alert("주민등록번호를 입력하세요");
            return false;
        }*/
    }
-->
</script>

<%
	//사용자의 id값은 세션속성값으로부터 얻어냄
	String id = (String) session.getAttribute("memId");
	//42~43: DB연동하는빈에 id값에 해당하는 레코드를 얻어내는 부분
	logon.LogonDBBean manager = logon.LogonDBBean.getInstance();
	logon.LogonDataBean c = manager.getMember(id);
	//manager.getMember(id)메소드가 데이터저장빈객체를 리턴 
	try {
%>

<body bgcolor="<%=bodyback_c%>">
	<form method="post" action="modifyPro.jsp" name="userinput"
		onsubmit="return checkIt()">

		<table width="600" border="1" cellspacing="0" cellpadding="3"
			align="center">
			<tr>
				<td colspan="2" height="39" bgcolor="<%=title_c%>" align="center">
					<font size="+1"><b>회원 정보수정</b></font>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="normal" align="center">회원의 정보를 수정합니다.</td>
			</tr>
			<tr>
				<td width="200" bgcolor="<%=value_c%>"><b>아이디 입력</b></td>
				<td width="400" bgcolor="<%=value_c%>">&nbsp;</td>
			<tr>
			<tr>
				<td width="200">사용자 ID</td>
				<td width="400"><%=c.getId()%></td>
			</tr>

			<tr>
				<td width="200">비밀번호</td>
				<td width="400"><input type="password" name="passwd" size="10"
					maxlength="10" value="<%=c.getPasswd()%>"></td>
			<tr>
			<tr>
				<td width="200" bgcolor="<%=value_c%>"><b>개인정보 입력</b></td>
				<td width="400" bgcolor="<%=value_c%>">&nbsp;</td>
			<tr>
			<tr>
				<td width="200">사용자 이름</td>
				<td width="400"><input type="text" name="name" size="15"
					maxlength="20" value="<%=c.getName()%>"></td>
			</tr>
			<tr>
				<td width="200">주민등록번호</td>
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
					type="submit" name="modify" value="수   정"> <input
					type="button" value="취  소"
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