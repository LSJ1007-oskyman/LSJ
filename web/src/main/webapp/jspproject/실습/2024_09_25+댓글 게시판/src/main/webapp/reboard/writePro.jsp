<%@page import="reboard.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="board" class="reboard.BoardDataBean"/>
<jsp:setProperty property="*" name="board"/>

<%
	String ip =request.getRemoteAddr();
	board.setIp(ip);
	
	BoardDBBean dao = new BoardDBBean();
	int result = dao.insert(board);
	
	if(result ==1){
%>
		<script>
			alert("글쓰기 성공");
			location.href="list.jsp";
		</script>
<%		
	}else{
%>

		<script>
			alert("글쓰기 실패");
			history.go(-1);
		</script>
<%		
	}
%>