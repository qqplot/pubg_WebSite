<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="pubg.util.JoinCheck"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign up</title>

</head>
<body>
	
	<%
		request.setCharacterEncoding("utf-8");
		
		// Get Variables for Request
		String user_id = request.getParameter("user_id");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		
		JoinCheck jc = new JoinCheck();
		
		if(jc.check_value("user_id", user_id)){
			out.print("<script type='text/javascript'>");
			out.print("alert('아이디가 중복됩니다. 다시 입력하세요.');");
			out.print("location.href='joinForm.jsp'; ");
			out.print("</script>");
		} else if(jc.check_value("email", email)){
			out.print("<script type='text/javascript'>");
			out.print("alert('이메일이 중복됩니다. 다시 입력해주세요.');");
			out.print("location.href='joinForm.jsp';");
			out.print("</script>");
		} else {
			if(jc.insert_sql(user_id, password, address, email)){
				out.print("<script type='text/javascript'>");
				out.print("alert('회원가입이 완료되었습니다. 로그인을 해주세요.'); ");
				out.print("location.href='index.html'; ");
				out.print("</script>");
			} else {
				out.print("<script type='text/javascript'>");
				out.print("alert('회원가입이 실패했습니다. 다시 회원정보를 입력하세요.');");
				out.print("location.href='joinForm.jsp';");
				out.print("</script>");
			}
		} // outer if ~ else	 
	%>			
		
	
</body>
</html>