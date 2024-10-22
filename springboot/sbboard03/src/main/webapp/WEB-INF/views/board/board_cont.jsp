<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
</head>
<body>
	<table border="1" align="center" width="500">
		<caption><h3>상세페이지</h3></caption>
		<tr>
			<td>제목</td>
			<td>${board.board_subject}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<pre>${board.board_content}</pre>
				${board_content}
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="목록" onClick="location.href='board_list.do?page=${page}'">
				<input type="button" value="댓글" onClick="location.href='board_cont.do?board_num=${board.board_num }&page=${page}&state=reply'">
				<input type="button" value="수정" onClick="location.href='board_cont.do?board_num=${board.board_num }&page=${page}&state=update'">
				<input type="button" value="삭제" onClick="location.href='board_cont.do?board_num=${board.board_num }&page=${page}&state=delete'">
			</td>
		</tr>
	</table>
</body>
</html>