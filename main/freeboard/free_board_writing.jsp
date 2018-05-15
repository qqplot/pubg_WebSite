<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>free_board_writing</title>
</head>
<body>
<h1>글쓰기</h1>
<form method="post" action="free_board_writing_submit.jsp">


<p>
<%-- 작성자를 세션에서 받아오는 걸로 수정 완료 --%>
작성자 : <input type="text" name="user_id"  value=<%=session.getAttribute("user_id") %> size="20"/><br/>
제목 : <textarea name="f_title" cols="50" rows="1">최대 50자</textarea><br/>
내용 : <textarea name="f_text" cols="40" rows="5">최대 200자</textarea>
</p>
<p>
<input type="submit" value="작성"/>
<input type="reset" value="다시쓰기"/>
<button type="button" onclick="window.history.back();">목록으로</button>
</p>
</form>

</body>
</html>