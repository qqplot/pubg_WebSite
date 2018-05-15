<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="pubg.util.NoticeSQL"%>
<%@page import="pubg.util.NoticeBean"%>


<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%
	String title = request.getParameter("title");
	String date = request.getParameter("no_date");
	String textarea = request.getParameter("no_text");

	System.out.printf("title: %s ", title);
	NoticeBean noticeBean = new NoticeBean();

	noticeBean.setNo_title("admin");
	noticeBean.setNo_title(title);
	noticeBean.setNo_date(date);
	noticeBean.setNo_text(textarea);

	NoticeSQL noticeSQL = new NoticeSQL();

	noticeSQL.insert(noticeBean);

	session.invalidate();
%>
</head>
<body>


	<script>
		alert("정상적으로 입력이 되었습니다.");
		location.href = "./NoticeBorderList.jsp"
	</script>

</body>
</html>