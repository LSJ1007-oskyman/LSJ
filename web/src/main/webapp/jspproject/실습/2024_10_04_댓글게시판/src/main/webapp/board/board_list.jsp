<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="./BoardForm.do">글작성</a><br>
	글갯수 : ${listcount } 개 <br> 
	<table cellpadding="3"  width = "700" align=center border=1>
	<caption>게시판 목록</caption>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>날짜</th>
		<th>조회수</th>
	</tr>
	
	<c:set var="num" value="${listcount-(page-1)*10}"/>
	<c:forEach var="b" items="${boardlist }">
	<tr>
		<td>${num}
			<c:set var="num" value="${num-1}"/>
		</td>
		<td><!-- 댓글 제목 앞에 공백 처리 -->
			<c:if test="${b.board_re_lev>0}">
			<c:forEach var="i" begin="0" end="${b.board_re_lev}">
				&nbsp;
			</c:forEach>
			</c:if>
			<a href="./BoardDetailAction.do?board_num=${b.board_num}&page=${page}">${b.board_subject}</a>
			</td>
		<td>${b.board_name}</td>
		<td>
			<fmt:formatDate value="${b.board_date}" pattern="yyyy년 MM월 dd일 HH:mm:ss EEE"/>
		</td>
		<td>${b.board_readcount}</td>
	</tr>
	</c:forEach>
	</table><br>
	<!-- 페이지 처리 -->
	<div align="center">
		<c:if test="${listcount>0 }">
		<!-- 1page로 이동 -->
		<a href="./BoardListAction.do?page=1" style="text-decoration:none">[&lt;&lt;]</a>
		
		<!-- 이전 블럭으로 이동 -->
		<c:if test="${startPage>10}">
		<a href="./BoardListAction.do?page=${startPage-1}" style="text-decoration:none">[&lt;]</a>
		</c:if>
		
		<!-- 각 블럭을 10개의 페이지 출력 -->
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<c:if test="${i==page }">	<!-- 현재 페이지 -->
				<strong>[${i}]</strong>
			</c:if>
			<c:if test="${i!=page }">	<!-- 현재 페이지가 아닌 경우 -->
				<a href="./BoardListAction.do?page=${i}">[${i}]</a>
			</c:if>
		</c:forEach>
		
		<!-- 다음 블럭으로 이동 -->
		<c:if test="${endPage<pageCount}">
		<a href="./BoardListAction.do?page=${endPage+1}" style="text-decoration:none">[&gt;]</a>
		</c:if>
		
		<!-- 마지막 페이지로 이동 -->
		<a href="./BoardListAction.do?page=${pageCount}" style="text-decoration:none">[&gt;&gt;]</a>
		</c:if>	
	</div>
</body>
</html>