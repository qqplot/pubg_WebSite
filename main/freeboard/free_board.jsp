<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.sql.*"%>
<%@ page import="pubg.util.FreeBoardBeanz" %>
<%@ page import="pubg.util.FreeBoardJDBC" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판</title>
</head>
<body>

<jsp:useBean id="FBbean" class="pubg.util.FreeBoardBeanz" scope="page"/>
<jsp:useBean id="FBjdbc" class="pubg.util.FreeBoardJDBC" scope="page"/>

<h1>자유게시판 - 글 리스트</h1>
<!-- usebean (jdbc활용 - 글내용(f_text)제외 전부 select) -->
<!-- 글 제목~라인의 바디 클릭시 regno이용한 f_text select -->
<table border="1">
<tr>
	<th width="50">글번호</th>
	<th width="120">작성자</th>
	<th width="300">글제목</th>
	<th>작성일</th>
</tr>
<%
	Vector<FreeBoardBeanz> vt = FBjdbc.getFBoardList();
	for(int i = 0; i < vt.size(); i++){
		FreeBoardBeanz regBean = (FreeBoardBeanz)vt.elementAt(i);
%>
	<tr>
		<td><%=regBean.getRegno() %></td>
		<td><%=regBean.getUser_id() %></td>
		<td>
		<a href="./freeboard/free_board_post.jsp?regno=<%=regBean.getRegno() %>" name="regno">
		<%=regBean.getF_title() %></a>
		</td>
		<td><%=regBean.getF_date() %></td>
	</tr>
<%
	}
%>
</table>
<form method="post" action="./freeboard/free_board_search.jsp">
<p>
<select name="choice">
	<option value="title" selected>제목</option>
</select>
<input type="text" name="search"/>
<input type="submit" value="검색"/>
</p>
</form>
<button type="button" onclick="location='./freeboard/free_board_writing.jsp'">글쓰기</button>
</body>
</html>