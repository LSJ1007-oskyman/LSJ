<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="board.BoardDBBean"%>
<%@page import="board.BoardDataBean"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="board" class="board.BoardDataBean"/>
<jsp:setProperty property="*" name="board"/>

<%

	String nowpage = request.getParameter("page");

	BoardDBBean dao = BoardDBBean.getInstance();
	
	BoardDataBean db = dao.getContent(board.getNum());
	
	if(db.getPasswd().equals(board.getPasswd())){
		int result=dao.update(board);
			
		if(result==1){
%>
			<script>
				alert("글수정 성공");
				<%--목록(list.jsp)으로 갈지 상세 페이지(content.jsp)로 갈지 결정해야한다.(파라미터가 다르다)--%>
				<%--location.href="content.jsp?page=<%=nowpage%>";--%>
				location.href="content.jsp?num=<%=board.getNum()%>&page=<%=nowpage%>";
			</script>
<%
		}
	}else{
%>
		<script>
			alert("비밀번호가 일치하지 않습니다.");
			history.go(-1);
		</script>

<%	
	}
%>

