<%@page import="java.text.SimpleDateFormat"%>
<%@page import="reboard.BoardDataBean"%>
<%@page import="reboard.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	String nowpage = request.getParameter("page");
	
	BoardDBBean dao =BoardDBBean.getInstance();
	
	
	//조회수 1증가 + 상세정보 구하기
	BoardDataBean board = dao.updateContent(num);
	int ref= board.getRef();
	System.out.println(ref);
	int re_level = board.getRe_level();
	int re_step = board.getRe_step();
	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss EEE");
	String content = board.getContent().replace("\n","<br>");
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
			<input type="button" value="댓글" onClick="location.href='replyForm.jsp?num=<%=num%>&page=<%=nowpage%>&ref=<%=ref%>&re_level=<%=re_level%>&re_step=<%=re_step%>'">
			<input type="button" value="글수정" onClick="location.href='updateForm.jsp?num=<%=num%>&page=<%=nowpage%>'">
			<input type="button" value="글삭제" onClick="location.href='deleteForm.jsp?num=<%=num%>&page=<%=nowpage%>'">
			<input type="button" value="글목록" onClick="location.href='list.jsp?page=<%=nowpage%>'">
		</td>
	</tr>
<% 
	if(dao.isReplyExist(board.getNum())>0){
		
	}

%>
	
</table>
</body>
</html>