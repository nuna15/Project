<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page import="board.BoardDBBean"%>
<%@ page import="java.sql.Timestamp"%>

<%
	request.setCharacterEncoding("euc-kr");
%>
<%-- BoardDataBean클래스의 객체 article을 생성: 향후 이 객체에 접근시 article.--%>
<jsp:useBean id="article" scope="page" class="board.BoardDataBean">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>

<%
	article.setReg_date(new Timestamp(System.currentTimeMillis()));
	article.setIp(request.getRemoteAddr());

	BoardDBBean dbPro = BoardDBBean.getInstance();
	dbPro.insertArticle(article);//레코드를 추가하는 메소드 호출
	//list.jsp페이지로 리다이렉트
	response.sendRedirect("list.jsp");
%>






