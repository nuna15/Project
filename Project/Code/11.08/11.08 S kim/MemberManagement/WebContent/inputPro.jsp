<%@page import="java.util.Vector"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="com.sun.xml.internal.ws.api.ha.StickyFeature"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page import="java.sql.Timestamp"%>

<%
	request.setCharacterEncoding("euc-kr");
%>

<jsp:useBean id="member" class="logon.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>

<%
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	Timestamp timestamp = new Timestamp(System.currentTimeMillis());
	String date = format.format(timestamp);
	int[] intArray = new int[5];
	int i = 0;
	StringTokenizer tokenizer = new StringTokenizer(date, "-");
	while (tokenizer.hasMoreTokens()) {
		intArray[i] = Integer.parseInt(tokenizer.nextToken());
		i++;
	}
	// ÆÄ½Ì
	member.setDate(new Date(intArray[0], intArray[1], intArray[2]));
	logon.LogonDBBean manager = logon.LogonDBBean.getInstance();
	manager.insertMember(member);

	response.sendRedirect("loginForm.jsp");
%>