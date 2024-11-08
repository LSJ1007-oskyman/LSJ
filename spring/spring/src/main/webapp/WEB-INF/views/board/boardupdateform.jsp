<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
</head>
<body>
<form method=post action="boardupdate.do">
<input type="hidden" name="no" value="${board.no}">
<input type="hidden" name="page" value="${page}">
<table border=1 width=400 align=center>
	<caption><h3>글수정</h3></caption>
	<tr><th>작성자명</th>
		<td><input type=text name="writer" required="required" value="${board.writer }"></td>
	</tr>
	<tr><th>비밀번호</th>
		<td><input type=password name="passwd" required="required"></td>
	</tr>
	<tr><th>제목</th>
		<td><input type=text name="subject" required="required" value="${board.subject }"></td>
	</tr>
	<tr><th>내용</th>
		<td><textarea cols=40 rows=5 name="content" required="required" >${board.content}</textarea></td>
	</tr>
	<tr><td colspan=2 align=center>
			<input type=submit value="글수정">
			<input type=reset value="취소">
		</td>
	</tr>
</table>
</form>
</body>
</html>