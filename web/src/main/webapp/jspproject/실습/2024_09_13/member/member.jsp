<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="member" class="member.MemberDataBean"/>
<jsp:setProperty property="*" name="member"/>

<html>
<head>
<meta charset="UTF-8">
<title>회원가입 확인</title>
</head>
<body>
<table border=1 width=600 align=center>
	<caption>회원 가입폼</caption>
	<tr>
		<th>ID</th>
		<td>
			<%=member.getId()%>
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><%=member.getPasswd()%></td>
	</tr>	
	<tr>
		<th>성명</th>
		<td><%=member.getName()%></td>
	</tr>
	<tr>
		<th>주민번호</th>
		<td><%=member.getJumin1()%>-<%=member.getJumin2()%>
		</td>
	</tr>
	<tr>
		<th>E-Mail</th>
		<td><%=member.getMailid()%>@<%=member.getDomain()%>
		</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><%=member.getTel1() %>-<%=member.getTel2()%>-<%=member.getTel3() %>
		</td>
	</tr>
	<tr>
		<th>핸드폰</th>
		<td><%=member.getPhone1()%>-<%=member.getPhone2()%>-<%=member.getPhone3()%>
		</td>
	</tr>
	<tr>
		<th>우편번호</th>
		<td><%=member.getPost()%>
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td><%=member.getAddress()%>
		</td>
	</tr>
	<tr>
		<th>성별</th>
		<td><%=member.getGender()%>
		</td>
	</tr>
	<tr>
		<th>취미</th>
		<td><% String [] h=member.getHobby();
			   String a="";
				for(String hh : h){
					a+=hh+"-";	
				}
				out.print(a.substring(0,a.length()-1)+"<br>");
			%>
		</td>
	</tr>
	<tr>
		<th>자기소개</th>
		<td><%=member.getIntro()%>
		</td>
	</tr>
	
</table>
</body>
</html>