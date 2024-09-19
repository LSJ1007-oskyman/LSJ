<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import='javaBean.SimpleBean'%>

<% request.setCharacterEncoding("utf-8");%>



<%
	SimpleBean sb1 = new SimpleBean();
	sb1.setMsg("안녕");

%>

<!-- 자바빈 객체를 생성하는 역할 -->
<jsp:useBean id="sb" class="javaBean.SimpleBean"/>
<%-- <jsp:setProperty property="msg" name="sb"/> --%>
<%-- <jsp:setProperty property="name" name="sb"/> --%>

<!-- 앞쪽에 데이터를 받을때의 변수와 property의 이름값이 반드시 같아야 아래와 같이 가능하다. -->
<jsp:setProperty property="*" name="sb"/>


<html>
	<body>

	<h1>간단한 자바빈 프로그래밍</h1>
	메시지 : <%=sb.getName() %>
	메시지: <jsp:getProperty name="sb" property="name" />
	
	메시지 : <%=sb.getMsg() %>
	메시지: <jsp:getProperty name="sb" property="msg" />

	</body>
</html>