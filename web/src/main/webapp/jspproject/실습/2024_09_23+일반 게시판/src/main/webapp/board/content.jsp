<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDBBean"%>
<%@page import="board.BoardDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	String nowpage=request.getParameter("page");
	
	BoardDBBean dao = BoardDBBean.getInstance();
	
	//조회수 1 증가 + 상세 정보 구하기
	BoardDataBean board = dao.updateContent(num);
	
	String content = board.getContent().replace("\n","<br>");
	
	SimpleDateFormat sd= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss EEE");
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
</head>
<body>
<table border=1 width=500 align="center">
	<caption>상세페이지</caption>
	<tr>
		<td>번호</td>
		<td><%=board.getNum() %></td>
		<td>조회수</td>
		<td><%=board.getReadcount()%></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><%=board.getWriter() %></td>
		<td>작성일</td>
		<td><%=sd.format(board.getReg_date())%></td>
	</tr>
	<tr>
		<td>제목</td>
		<td colspan=3><%=board.getSubject()%></td>
	<tr>
		<td>내용</td>
		<td colspan=3>
			<pre><%=board.getContent() %></pre>
			<%=content%>
		</td>
	</tr>
	<tr>
		<td colspan=4 align=center>
			<input type="button" value="글수정" onClick="location.href='updateForm.jsp?num=<%=num%>&page=<%=nowpage%>'">
			<input type="button" value="글삭제" onClick="location.href='deleteForm.jsp?num=<%=num%>&page=<%=nowpage%>'">
			<input type="button" value="글목록" onClick="location.href='list.jsp?page=<%=nowpage%>'">
		</td>
	</tr>
</table>
</body>
</html>