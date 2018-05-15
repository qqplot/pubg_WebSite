<%@page import="pubg.util.QnASQL"%>
<%@page import="pubg.util.QnABean"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>업데이트 체크</title>
</head>
<body>
	<%
		String index = request.getParameter("count");

		String text = request.getParameter("text");
		String title = request.getParameter("title");
		String date = request.getParameter("date");
		String email = request.getParameter("email");

		String id = (String) session.getAttribute("id" + index);

		QnABean qnABean = new QnABean();
		QnASQL qnASQL = new QnASQL();

		System.out.printf("id = %s , title = %s , email = %s ,date = %s text = %s", id, title, email, date, text);

		qnABean.setUser_id(id); //아이디 설정 
		qnABean.setQ_title(title);
		qnABean.setQ_text(text);
		qnABean.setEmail(email);
		qnABean.setQ_date(date);

		qnASQL.updateID(qnABean);
	%>



	<script>
		alert("정상적으로 업데이트 되었습니다.");
		location.href = "./QnABorderList.jsp"
	</script>
</body>
</html>