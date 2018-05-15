<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 글 입력</title>
<script>
	function form_submit() {
		document.id.action = "NoticeBorderInsertCheck.jsp";
		document.id.submit();
	}
</script>
<!-- 관리자 계정 체크 -------------------------------------------------- -->
<%
	String userID = (String) session.getAttribute("user");

	if (userID.equals("admin_test")) {
%>
<script type="text/javascript">
	alert("admin님 환영합니다.")
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("admin 관리자 만 출입이 가능합니다.")
	location.href = "./NoticeBorderList.jsp"
</script>

<%
	}
%>
<!-- noticeBorder.css Import -->
<link rel="stylesheet" type="text/css" href="../css/noticeBorder.css">
</head>
<body>


	<div class='noticeBorder'>
		<form action="NoticeBorderInsertCheck.jsp" method="post" id='frm'>

			<div class='noticeTitle'>


				<table border="1">

					<tr id="border_title_background">
						<td width="100%">제목:<input type="text" size="100"
							name="title"></td>


					</tr>
					<tr id="border_title_background">
						<td width="953px">날짜:<input type="date" size="100"
							name="no_date">
						</td>
					</tr>


					<tr>
						<td width="950px" height='auto'><input type="file"
							value="파일업로드...">
						<td>
					<tr>
					<tr>
						<td width="950px" height="678px">
							<div>
								<textarea rows="30" cols="120" name="no_text"></textarea>

							</div>
						<td>
					<tr>
					<tr id="border_title_background">
						<td colspan="3" align="right"><input type="button"
							onclick="document.getElementById('frm').submit();" value="입력완료">
						</td>
					</tr>
				</table>

			</div>



		</form>
	</div>


	<div class='footer'>@CopyRight</div>

</body>
</html>