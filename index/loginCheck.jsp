<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pubg.util.JoinCheck" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Log Check</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		// Get Variables for Request
		String user_id = request.getParameter("user_id");
		String password = request.getParameter("password");
		
		JoinCheck jc = new JoinCheck();
 		
		if( jc.check_login(user_id, password) ){
 			session.setMaxInactiveInterval(15 * 60); // 15분동안 세션 유지
			session.setAttribute("user_id", user_id);
			out.print("<script type=\"text/javascript\">");
			out.print("alert('환영합니다!');");
			out.print("location.href='../main/main.jsp';");
			out.print("</script>");
		} else{
			out.print("<script>");
			out.print("alert(\"로그인 실패! 아이디와 비밀번호를 다시 확인해주세요!\");");
			out.print("window.open('index.html', '_self');");
			out.print("</script>");
		} // outer if ~ else	
	%>			
	

</body>
</html>