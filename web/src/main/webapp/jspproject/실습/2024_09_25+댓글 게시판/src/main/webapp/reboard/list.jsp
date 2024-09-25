<%@page import="java.text.SimpleDateFormat"%>
<%@page import="reboard.BoardDBBean"%>
<%@page import="reboard.BoardDataBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	//1. 한 화면(페이지)에 출력할 데이터 갯수
	int page_size = 10;

	String pageNum = request.getParameter("page");

	if (pageNum == null) {
		pageNum = "1";
	}

	//2.현재 페이지 번호
	int currentPage = Integer.parseInt(pageNum);

	//3.총 데이터 갯수
	int count = 0;

	BoardDBBean dao = BoardDBBean.getInstance();
	count = dao.getCount();

	//startRow : 각 page에 추출할 데이터의 시작번호
	//endRow : 각 page에 추출할 데이터의 끝번호

	int startRow = (currentPage - 1) * page_size + 1;
	int endRow = currentPage * page_size;

	List<BoardDataBean> list = null;

	if (count > 0) {
		list = dao.getList(startRow, endRow);
	}

	if (count == 0) {
	%>
	작성된 글이 없습니다.
	<%
	} else {
	%>
	<a href="writeForm.jsp">글작성</a> 글갯수 :<%=count%>개
	<table border=1 width=700 align=center>
		<caption>게시판 목록</caption>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>IP주소</th>
		</tr>
		<%
		int number = count - (currentPage - 1) * page_size;
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss EEE");

		for (int i = 0; i < list.size(); i++) {
			BoardDataBean board = list.get(i);
		%>
		<tr>
			<th><%=number--%></th>
			<th>
				<%
				//댓글 제목 앞에 여백 추가
				if (board.getRe_level() > 0) {
					for (int j = 0; j < board.getRe_level(); j++) {
				%> &nbsp;&nbsp; <%
 }
 }
 %> <a href="content.jsp?num=<%=board.getNum()%>&page=<%=currentPage%>"><%=board.getSubject()%></a>
			</th>
			<th><%=board.getWriter()%></th>
			<th><%=sd.format(board.getReg_date())%></th>
			<th><%=board.getReadcount()%></th>
			<th><%=board.getIp()%></th>
		</tr>
		<%
		}
		%>
	</table>
	<br>
	<%
	}
	%>

	<!-- 페이지 링크 -->
	<div align="center">
		<%
		if (count > 0) {
			//pageCount:총페이지수
			int pageCount = count / page_size + ((count % page_size == 0) ? 0 : 1);

			int startPage = ((currentPage - 1) / 10) * 10 + 1;
			int block = 10;
			int endPage = startPage + block - 1;
			if (endPage > pageCount)
				endPage = pageCount;
		%>
		<!-- 1page로 이동 -->
		<a href="list.jsp?page=1" style="text-decoration: none">[첫페이지로]</a>
		<%
		if (startPage > 10) {
		%>
		<a href="list.jsp?page=<%=startPage - 10%>"
			style="text-decoration: none">[이전]</a>
		<%
		}

		for (int i = startPage; i <= endPage; i++) {
		if (i == currentPage) {
		%>
		<strong>[<%=i%>]
		</strong>
		<%
		} else {
		%>
		<a href="list.jsp?page=<%=startPage - 10%>">[<%=i%>]
		</a>
		<%
		}
		}

		if (endPage < pageCount) {
		%>
		<a href="list.jsp?page=<%=startPage + 10%>"
			style="text-decoration: none">[다음]</a>
		<%
		}
		%>
		<a href="list.jsp?page=<%=pageCount%>" style="text-decoration: none">[마지막페이지로]</a>
		<%
		}
		%>
	</div>

</body>
</html>