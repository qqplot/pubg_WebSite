
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="pubg.util.QnABean"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA 글 입니다.</title>

<!-- noticeBorder.css Import -->
<link rel="stylesheet" type="text/css" href="css/noticeBorder.css">
</head>

<body>
	<%
		String index = request.getParameter("count");

		session.setMaxInactiveInterval(600); //index 컬럼 10분유지

		String title = (String) session.getAttribute("title" + index);
		String date = (String) session.getAttribute("date" + index);
		String id = (String) session.getAttribute("id" + index);
		String text = (String) session.getAttribute("text" + index);
		String textreturn = (String) session.getAttribute("return" + index);
	%>



	<div class='noticeBorder'>
		<div class='noticeTitle'>
			<div align="right">
				<input type="button" value="수정"
					onclick="location.href='QnABorderUpdate.jsp?count1=<%=index%>'">

				<input type="button" value="삭제"
					onclick="location.href='QnABordoerDeleteCheck.jsp?count=<%=index%>'">
			</div>
			<table border="1">

				<tr id="border_title_background">
					<td width="100%">제목:<%=title%>
					</td>
				</tr>
				<tr id="border_title_background">
					<td width="953px">등록일:<%=date%>
					</td>
				</tr>


				<tr id="border_title_background">
					<td width="953px">아이디:<%=id%>
					</td>
				</tr>


				<tr>
					<td width="950px" height="200px">게시글 :<%=text%>
					<td>
				<tr>
				<tr>
					<td width="950px" height="500px">답변글 :<%=textreturn%>
					<td>
				<tr>
				<tr>
					<td><a href="QnABorderList.jsp"> 목록으로...</a>
					<td>
				<tr>
			</table>

		</div>




	</div>


	<div class='footer'>@CopyRight</div>

</body>
</html>