<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>글 삭제</title>
	<link rel="stylesheet" type="text/css" href="./css/bbs.css" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="./js/board.js"></script>
</head>

<body>
 <div id="bbswrite_wrap">
  <h2 class="bbswrite_title">게시판 삭제폼</h2>
  <form method="post" action="board_delete_ok.do">
   <input type="hidden" name="board_num" value="${board.board_num}">
   <input type="hidden" name="page" value="${page}">
   <table id="bbswrite_t">
    <tr>
     <th>비밀번호</th>
     <td>
      <input type="password" name="board_pass" id="board_pass" size="14"
      		class="input_box" required="required"/>
     </td>
    </tr>
   </table>
   <div id="bbswrite_menu">
    	<input type="submit" value="삭제" class="input_button" />
    	<input type="reset" value="취소" class="input_button"
    			onclick="$('#board_name').focus();" />
   </div>
  </form>
 </div>
</body>
</html>