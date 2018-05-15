<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="pubg.util.NoticeBean"%>
<%@page import="pubg.util.QnASQL"%>
<%@page import="java.util.Vector"%>
<%@page import="pubg.util.QnABean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	QnASQL asql = new QnASQL();
	Vector<QnABean> vc = asql.SelectAll();

	Iterator<QnABean> it = vc.iterator();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function form_submit() {
		document.id.action = "NoticeBorderInsertCheck.jsp";
		document.id.method = "post";
		document.id.submit();
	}
</script>
<title>QnA 리스트</title>

<!-- noticeBorder.css Import -->
<link rel="stylesheet" type="text/css" href="../css/noticeBorder.css">

</head>
<body>

	<div class='noticeBorder'>
		<div class='noticeTitle'>

			<table border="1">

				<thead align="center">
					<tr bordercolor="">
						<td colspan="4">
							<h1>QnA 리스트</h1>
					<tr>
						<td align="left"><input type="button" value="글 입력"
							onclick="location.href='qa/QnABorderInsert.jsp'"></td>
						<td></td>
						<td align="right" colspan="2"><input type="search"
							id="qSerch" name="mySearch" value="idSerch"> <input
							type="button" value="검색" onclick=""></td>
					</tr>

				</thead>
				<tr id="border_title_background">
					<td width="50px">번호</td>
					<td width="100px">ID</td>
					<td width="680px">제목</td>
					<td width="120px">작성일</td>

				</tr>
				<%
					session.setMaxInactiveInterval(600);

					for (int i = 0; i < vc.size(); i++) {

						QnABean qnABean = vc.get(i);
						session.setAttribute("regno" + i, qnABean.getRegno());
						session.setAttribute("title" + i, qnABean.getQ_title());
						session.setAttribute("date" + i, qnABean.getQ_date());
						session.setAttribute("id" + i, qnABean.getUser_id());
						session.setAttribute("text" + i, qnABean.getQ_text());
						session.setAttribute("email" + i, qnABean.getEmail());
				%>
				<tr>
					<td><%=qnABean.getRegno()%></td>
					<td><%=qnABean.getUser_id()%></td>
					<td><a href="qa/QnATextView.jsp?count=<%=i%>"> <%=qnABean.getQ_title()%></a></td>
					<td><%=qnABean.getQ_date()%></td>

				</tr>

				<%
					}
				%>
				<tr align="center">
					<td width=""></td>
					<td width="" colspan="2">
						<!-- Paging 처리 --> << < 1.2.3.4.5.6.7.8.9 > >>
					</td>
					<td width=""></td>
				</tr>
			</table>

		</div>

	</div>


	<div class='footer'>@CopyRight</div>

</body>
</html>