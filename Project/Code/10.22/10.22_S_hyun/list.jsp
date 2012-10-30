<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="board.BoardDBBean"%>
<%@ page import="board.BoardDataBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="color.jsp"%>

<%!int pageSize = 10;//한페이지에 표시할 글의 수 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");//날짜데이터 표시형식지정%>

<%
	String pageNum = request.getParameter("pageNum");//화면에 표시할 페이지번호
	int count = 0;//전체글의 수
	int number = 0;//현재페이지에 표시할 레코드수
	int currentPage = Integer.parseInt(pageNum);//pageNum변수값을 숫자로 파싱
	if (pageNum == null) {//페이지번호가 없으면
		pageNum = "1";//1페이지의 내용이 화면에 표시
	}

	List articleList = null;//글목록을 저장
	BoardDBBean dbPro = BoardDBBean.getInstance();
	count = dbPro.getArticleCount();//전체글수 얻어냄
	if (count == (currentPage - 1) * pageSize) {
		currentPage -= 1;
		String listPage = "list.jsp?pageNum=" + currentPage;
		response.sendRedirect(listPage);
	}

	int startRow = (currentPage - 1) * pageSize + 1;//현재 페이지에서의 시작글번호
	int endRow = currentPage * pageSize;//현재 페이지에서의 마지막글번호
	if (count > 0) {//테이블에 저장된 글이 있으면
		articleList = dbPro.getArticles(startRow, pageSize);//테이블에 글목록을 가져옴
	}

	if (articleList.isEmpty()) {
		out.println("a");
		currentPage -= 1;
		response.sendRedirect("list.jsp?pageNum=currentPage");
	}
	number = count - (currentPage - 1) * pageSize;
%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="<%=bodyback_c%>">
	<center>
		<b>글목록(전체 글:<%=count%>)
		</b>
		<table width="700">
			<tr>
				<td align="right" bgcolor="<%=value_c%>"><a
					href="writeForm.jsp">글쓰기</a></td>
		</table>

		<%
			if (count == 0) {
		%>
		<table width="700" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">게시판에 저장된 글이 없습니다.</td>
		</table>

		<%
			} else {
		%>
		<table border="1" width="700" cellpadding="0" cellspacing="0"
			align="center">
			<tr height="30" bgcolor="<%=value_c%>">
				<td align="center" width="50">번 호</td>
				<td align="center" width="250">제 목</td>
				<td align="center" width="100">작성자</td>
				<td align="center" width="150">작성일</td>
				<td align="center" width="50">조 회</td>
				<td align="center" width="100">IP</td>
			</tr>
			<%
				for (int i = 0; i < articleList.size(); i++) {
						BoardDataBean article = (BoardDataBean) articleList.get(i);
			%>
			<tr height="30">
				<td align="center" width="50"><%=number--%></td>
				<td width="250">
					<%
						int wid = 0;
								if (article.getRe_level() > 0) {
									wid = 5 * (article.getRe_level());
					%> <img src="images/level.gif" width="<%=wid%>" height="16">
					<img src="images/re.gif"> <%
 	} else {
 %> <img src="images/level.gif" width="<%=wid%>" height="16"> <%
 	}
 %> <a
					href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
						<%=article.getSubject()%></a> <%
 	if (article.getReadcount() >= 20) {
 %> <img src="images/hot.gif" border="0" height="16"> <%
 	}
 %>
				</td>
				<td align="center" width="100"><a
					href="mailto:<%=article.getEmail()%>"><%=article.getWriter()%></a></td>
				<td align="center" width="150"><%=sdf.format(article.getReg_date())%></td>
				<td align="center" width="50"><%=article.getReadcount()%></td>
				<td align="center" width="100"><%=article.getIp()%></td>
			</tr>
			<%
				}
			%>
		</table>
		<%
			}
		%>

		<%
			if (count > 0) {
				int pageCount = count / pageSize
						+ (count % pageSize == 0 ? 0 : 1);
				int startPage = 1;

				if (currentPage % 10 != 0) {
					startPage = (int) (currentPage / 10) * 10 + 1;
				} else {
					startPage = ((int) (currentPage / 10) - 1) * 10 + 1;
				}

				int pageBlock = 10;
				int endPage = startPage + pageBlock - 1;
				if (endPage > pageCount)
					endPage = pageCount;

				if (startPage > 10) {
		%>
		<a href="list.jsp?pageNum=<%=startPage - 10%>">[이전]</a>
		<%
			}
				for (int i = startPage; i <= endPage; i++) {
		%>
		<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]
		</a>
		<%
			}
				if (endPage < pageCount) {
		%>
		<a href="list.jsp?pageNum=<%=startPage + 10%>">[다음]</a>
		<%
			}
			}
		%>
	</center>
</body>
</html>