<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="board.BoardDBBean"%>
<%@ page import="board.BoardDataBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="color.jsp"%>

<%!int pageSize = 10;//���������� ǥ���� ���� �� 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");//��¥������ ǥ����������%>

<%
	String pageNum = request.getParameter("pageNum");//ȭ�鿡 ǥ���� ��������ȣ
	int count = 0;//��ü���� ��
	int number = 0;//������������ ǥ���� ���ڵ��
	int currentPage = Integer.parseInt(pageNum);//pageNum�������� ���ڷ� �Ľ�
	if (pageNum == null) {//��������ȣ�� ������
		pageNum = "1";//1�������� ������ ȭ�鿡 ǥ��
	}

	List articleList = null;//�۸���� ����
	BoardDBBean dbPro = BoardDBBean.getInstance();
	count = dbPro.getArticleCount();//��ü�ۼ� ��
	if (count == (currentPage - 1) * pageSize) {
		currentPage -= 1;
		String listPage = "list.jsp?pageNum=" + currentPage;
		response.sendRedirect(listPage);
	}

	int startRow = (currentPage - 1) * pageSize + 1;//���� ������������ ���۱۹�ȣ
	int endRow = currentPage * pageSize;//���� ������������ �������۹�ȣ
	if (count > 0) {//���̺� ����� ���� ������
		articleList = dbPro.getArticles(startRow, pageSize);//���̺� �۸���� ������
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
<title>�Խ���</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="<%=bodyback_c%>">
	<center>
		<b>�۸��(��ü ��:<%=count%>)
		</b>
		<table width="700">
			<tr>
				<td align="right" bgcolor="<%=value_c%>"><a
					href="writeForm.jsp">�۾���</a></td>
		</table>

		<%
			if (count == 0) {
		%>
		<table width="700" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">�Խ��ǿ� ����� ���� �����ϴ�.</td>
		</table>

		<%
			} else {
		%>
		<table border="1" width="700" cellpadding="0" cellspacing="0"
			align="center">
			<tr height="30" bgcolor="<%=value_c%>">
				<td align="center" width="50">�� ȣ</td>
				<td align="center" width="250">�� ��</td>
				<td align="center" width="100">�ۼ���</td>
				<td align="center" width="150">�ۼ���</td>
				<td align="center" width="50">�� ȸ</td>
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
		<a href="list.jsp?pageNum=<%=startPage - 10%>">[����]</a>
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
		<a href="list.jsp?pageNum=<%=startPage + 10%>">[����]</a>
		<%
			}
			}
		%>
	</center>
</body>
</html>