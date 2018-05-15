<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA 글 입력</title>



<!-- noticeBorder.css Import -->
<link rel="stylesheet" type="text/css" href="../css/noticeBorder.css">
</head>
<body>
	<%
		String userID = (String) session.getAttribute("user_id");
	%>




	<div class='noticeBorder'>
		<form action="QnABorderInsertCheck.jsp" method="post" id='fid'>

			<div class='noticeTitle'>


				<table border="1">
					<tr id="border_title_background">
						<td width="100%">아이디:<%=userID%>
						</td>

					</tr>
					<tr id="border_title_background">
						<td width="100%">제목:<input type="text" size="100"
							name="q_title"></td>

					</tr>
					<tr id="border_title_background">
						<td width="953px">날짜:<input type="date" size="100"
							value="예)2017-05-07" name="q_date">
						</td>
					</tr>


					<tr>
						<td id="border_title_background">메일:<input type="email"
							size="100" name="q_email" value="fillrider@gmail.com">
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
								<textarea rows="30" cols="120" name="q_text"></textarea>

							</div>
						<td>
					<tr>
					<tr id="border_title_background">
						<td colspan="3" align="right"><input type="button"
							onclick="document.getElementById('fid').submit();" value="입력완료">
						</td>
					</tr>
				</table>

			</div>



		</form>
	</div>


	<div class='footer'>@CopyRight</div>

</body>
</html>