<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, java.sql.*"%>
<%@ page import="pubg.util.FreeBoardBeanz"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판</title>
	<script type="text/javascript">
		var btn_stop = document.getElementById("btn_stop");
		
		function goBack() {
		    window.history.back();
		}
		
		function move_check() {
				if (confirm("정말로 삭제하시겠습니까?"))
					return true;
				else
					return false;
		}//move_check()
		// btn_stop.onclick = move_check;
	</script>

</head>
<body>
	<jsp:useBean id="FBbean" class="pubg.util.FreeBoardBeanz" scope="page" />
	<jsp:useBean id="FBjdbc" class="pubg.util.FreeBoardJDBC" scope="page" />
	<%
		int regno = Integer.parseInt(request.getParameter("regno"));
		Vector<FreeBoardBeanz> vt = FBjdbc.getFBoardText(regno);
				
		FreeBoardBeanz regBean = (FreeBoardBeanz) vt.elementAt(0);
	%>
	<form name="delForm" method="get" action="free_board_delete.jsp">
	<table border="1">
		<tr>
			<th>글번호(regno)</th>
			<th>작성자(user_id)</th>
			<th>작성일(f_date)</th>
		</tr>
		<tr>
			<td><%=regBean.getRegno()%></td>
			<td><%=regBean.getUser_id()%></td>
			<td><%=regBean.getF_date()%></td>
		</tr>
		<tr>
			<th>글제목(f_title)</th>
			<td colspan="2"><%=regBean.getF_title()%></td>
		</tr>
		<tr>
			<td colspan="3"><%=regBean.getF_text()%></td>
		</tr>
	</table>
	<p>
		<%-- 함수 수정(확인기능추가) --%>
		<button type="button" onclick="goBack();">뒤로가기</button> 
		<input id="btn_stop" type="submit" value ="삭제" name='<%=regBean.getRegno() %>' onclick="move_check();"/>
	</p>
</form>
</body>
</html>