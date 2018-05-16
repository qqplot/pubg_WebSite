<%@page import="pubg.util.QnABean"%>
<%@page import="pubg.util.QnASQL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>삭제하기</title>
</head>
<body>

	<script>
		function form_submit() {
			document.id.action = "NoticeBorderInsertCheck.jsp";
			document.id.submit();
		}
	</script>
	<%
		String index = request.getParameter("count");
		int regno = (Integer) session.getAttribute("regno" + index);
		System.out.printf("id = %s", regno);

		QnASQL qnASQL = new QnASQL();
		QnABean qnABean = new QnABean();

		qnABean.setRegno(regno); //아이디 설정

		System.out.printf("regno = %d", regno);
		qnASQL.deleteID(qnABean);
	%>



	<script>
		alert("정상적으로 삭제 되었습니다.");
		location.href = "../mainPost.jsp?menu=qa";
	</script>
</body>
</html>