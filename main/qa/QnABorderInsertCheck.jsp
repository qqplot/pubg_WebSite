<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="pubg.util.QnASQL"%>
<%@page import="pubg.util.QnABean"%>

<%
	String title = request.getParameter("q_title");
	String date = request.getParameter("q_date");
	String text = request.getParameter("q_text");
	String email = request.getParameter("q_email");
	String userID = (String) session.getAttribute("user");

	QnASQL qnASQL = new QnASQL();
	QnABean qnABean = new QnABean();
	qnABean.setEmail(email);
	qnABean.setQ_text(text);
	qnABean.setQ_title(title);
	qnABean.setQ_date(date);
	qnABean.setUser_id(userID);

	System.out.printf("%s", title);
	
	
	qnASQL.insert(qnABean);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script>
		alert("정상적으로 입력이 되었습니다.");
		location.href = "../mainPost.jsp?menu=qa"
	</script>


</body>
</html>