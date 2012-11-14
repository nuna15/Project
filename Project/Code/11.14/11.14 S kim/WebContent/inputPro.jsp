<%@page import="java.util.Calendar"%>
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
	Date currentDate = new Date(System.currentTimeMillis());
	
	// ÆÄ½Ì
	member.setDate(currentDate);
	logon.LogonDBBean manager = logon.LogonDBBean.getInstance();
	manager.insertMember(member);

	response.sendRedirect("loginForm.jsp");
%>