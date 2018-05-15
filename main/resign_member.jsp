<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="pubg.util.JoinCheck"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Resign</title>
</head>
<body>
	
	<%
		request.setCharacterEncoding("utf-8");
		
		// Get Variables for Request
		String user_id = request.getParameter("user_id");
		String password = request.getParameter("password");
		
		JoinCheck jc = new JoinCheck();
		
		if(!jc.check_value("user_id", user_id)){
			out.print("<script>");
			out.print("alert('찾는 아이디가 없습니다. 다시 입력하세요.');");
			out.print("location.href='resign_member.html'; ");
			out.print("</script>");
		} else {
			if(jc.delete_sql(user_id, password)){
				out.print("<script>");
				out.print("alert('탈퇴가 완료되었습니다. 지금까지 활동에 감사드립니다.'); ");
				out.print("location.href='../index/index.html'; ");
				out.print("</script>");
			} else {
				out.print("<script>");
				out.print("alert('탈퇴에 실패했습니다. 비밀번호를 다시 입력하세요.');");
				out.print("location.href='resign_member.html';");
				out.print("</script>");
			}
		} // outer if ~ else	
	%>			
		
	
</body>
</html>