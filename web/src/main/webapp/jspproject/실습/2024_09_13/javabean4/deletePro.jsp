<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="register.LogonDataBean" %>
<%@ page import="register.LogonDBBean" %>
<%@include file="color.jsp" %>

<% 
  request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="regBean" class="register.LogonDataBean" />
<jsp:setProperty name="regBean" property="*" />

<%
	LogonDBBean manager = LogonDBBean.getInstance();

	LogonDataBean old = manager.updateForm(regBean.getId());
	
	if(old.getPasswd().equals(regBean.getPasswd())){ // 비번 일치시	
		manager.delete(regBean);	// delete SQL문 실행
		
%>	
	<script>
		alert("회원삭제 성공");
		location.href="list.jsp";
	</script>
	
<% }else{	// 비번 불일치시	%>

	<script>
		alert("비밀번호가 일치하지 않습니다.");
		history.go(-1);
	</script>

<% } %>



