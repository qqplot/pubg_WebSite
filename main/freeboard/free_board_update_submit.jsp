<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판 - 글 수정완료</title>
</head>
<body>
<jsp:useBean id="FBjdbc" class="pubg.util.FreeBoardJDBC" scope="page"/>

<%
	request.setCharacterEncoding("UTF-8");
	int regno = Integer.parseInt(request.getParameter("regno"));
	String f_title = request.getParameter("f_title");
	String f_text = request.getParameter("f_text");
	
	FBjdbc.updateFBoardText(f_title, f_text, regno);
%>

<script type="text/javascript">
	alert("수정이 완료되었습니다. ");
	document.location.href="../mainPost.jsp?menu=freeboard";
</script>
</body>
</html>