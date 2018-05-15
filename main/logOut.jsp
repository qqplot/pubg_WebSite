<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Log Out</title>
</head>
<body>

<%
	session.setMaxInactiveInterval(0);
	out.print("<script>");
	out.print("alert('로그아웃이 되었습니다.');");
	out.print("location.href='../index/index.html'; ");
	out.print("</script>");
%>

</body>
</html>