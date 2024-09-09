<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//3.Calendar 클래스
// 	Calendar c = new Calendar() 오류! ->Calendar클래스는 추상메서드임
	Calendar c = Calendar.getInstance();
	
	int y = c.get(Calendar.YEAR);			//연도
	int m = c.get(Calendar.MONTH)+1;		//월(0~11)
	int d = c.get(Calendar.DATE);			//일
	
	int h1 = c.get(Calendar.HOUR);			//12시간제
	int h2 = c.get(Calendar.HOUR_OF_DAY);	//24시간제
	
	String h = "";
	if(c.get(Calendar.AM_PM)==0){			//AM_PM : 0 (오전)
		h="오전";
	}else{
		h="오후";								//AM_PM : 1 (오후)
	}
	
	int mm = c.get(Calendar.MINUTE); 		//분
	int s = c.get(Calendar.SECOND); 		//초
	int t = c.get(Calendar.DAY_OF_WEEK);	//요일(1~7)
	
	String[] day = {"일요일","월요일","화요일","수요일","목요일","금요일","토요일"};
	
%>

<!-- 12시간제 시간 -->
<%=y %>-<%=m %>-<%=d %> <%=h %><%=h1 %>:<%=mm %>:<%=s %> <%=day[t-1] %>

<br>

<!-- 24시간제 시간 -->
<%=y %>-<%=m %>-<%=d %> <%=h2 %>:<%=mm %>:<%=s %> <%=day[t-1] %>