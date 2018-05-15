<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.sql.*"%>
<%@ page import="pubg.util.FreeBoardBeanz"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판 - 글 수정</title>
</head>
<body>
	<jsp:useBean id="FBbean" class="pubg.util.FreeBoardBeanz" scope="page" />
	<jsp:useBean id="FBjdbc" class="pubg.util.FreeBoardJDBC" scope="page" />
	<%
		int regno = Integer.parseInt(request.getParameter("regno"));
		Vector<FreeBoardBeanz> vt = FBjdbc.getFBoardText(regno);
				
		FreeBoardBeanz regBean = (FreeBoardBeanz) vt.elementAt(0);
	%>
	
	<script type="text/javascript">
	
	function move_check() {
		if (confirm("수정하시겠습니까?"))
			return true;
		else
			return false;
		}//move_check()
	
	</script>
	
	<h1>글 수정</h1>
	<form name="updtForm" method="post" action="free_board_update_submit.jsp" onsubmit="return move_check();">
	<input type="hidden" name="regno" value='<%=regBean.getRegno()%>'/><!-- 글번호값 넘겨주기 위해 생성 -->
	<table border="1">
		<tr>
			<th>글번호</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<tr>
			<td><%=regBean.getRegno() %></td>
			<td><%=regBean.getUser_id()%></td>
			<td><%=regBean.getF_date()%></td>
		</tr>
		<tr>
			<th>글제목</th>
			<td colspan="2"><textarea name="f_title" cols="39" rows="1"><%=regBean.getF_title() %></textarea></td>
		</tr>
		<tr>
			<td colspan="3"><textarea name="f_text" cols="47" rows="4"><%=regBean.getF_text()%></textarea></td>
		</tr>
	</table>
	<p>
		<input type="submit" value="수정"/>
		<input type="reset" value="초기화"/>
		<button type="button" onclick="window.history.back();">뒤로가기</button> 
	</p>
</form>
</body>
</html>