<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="board" class="board.BoardDataBean"/>
<jsp:setProperty name="board" property="*"/> 

<html>
<head>
<title>게시판</title>
</head>
<body align=center>
<table border=1 width=500 align=center>
	<caption>확인페이지</caption>
	<tr>
		<th>작성자</th>
		<td><jsp:getProperty name="board" property="writer"/></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><jsp:getProperty name="board" property="passwd"/></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><jsp:getProperty name="board" property="subject"/></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><jsp:getProperty name="board" property="content"/></td>
	</tr>
	
</table>
</body>
</html>