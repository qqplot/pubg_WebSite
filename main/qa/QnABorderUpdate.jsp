<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	String index = (String) request.getParameter("count1");

	String title = (String) session.getAttribute("title" + index);
	String date = (String) session.getAttribute("date" + index);
	String id = (String) session.getAttribute("id" + index);
	String text = (String) session.getAttribute("text" + index);
	String email = (String) session.getAttribute("email" + index);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA 글 수정</title>



<!-- noticeBorder.css Import -->
<link rel="stylesheet" type="text/css" href="../css/noticeBorder.css">
</head>
<body>




	<div class='noticeBorder'>
		<form action="QnABordoerUpdateCheck.jsp?count=<%=index%>"
			method="post" id='frm'>

			<div class='noticeTitle'>


				<table border="1">

					<tr id="border_title_background">
						<td width="100%">제목:<input type="text" size="100"
							value="<%=title%>" name="title"></td>

					</tr>
					<tr id="border_title_background">
						<td width="953px">날짜:<input type="text" size="100"
							value="<%=date%>" name="date">
						</td>
					</tr>


					<tr>
						<td id="border_title_background">메일:<input type="email"
							size="100" value="<%=email%>" name="email">
						<td>
					<tr>
					<tr>
						<td width="950px" height='auto'><input type="file"
							value="파일업로드...">
						<td>
					<tr>
					<tr>
						<td width="950px" height="678px">
							<div>
								<textarea rows="30" cols="120" name="text"><%=text%></textarea>
							</div>
						<td>
					<tr>
					<tr id="border_title_background">
						<td colspan="3" align="right"><input type="button"
							value="수정완료" onclick="document.getElementById('frm').submit();">
						</td>
					</tr>
				</table>

			</div>



		</form>
	</div>


	<div class='footer'>@CopyRight</div>

</body>
</html>