<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
	String today = formatter.format(new java.util.Date());
%>

<jsp:useBean id="FBbean" class="pubg.util.FreeBoardBeanz" scope="page"/>
<jsp:useBean id="FBjdbc" class="pubg.util.FreeBoardJDBC" scope="page"/>

<jsp:setProperty property="user_id" name="FBbean"/>
<jsp:setProperty property="f_title" name="FBbean"/>
<jsp:setProperty property="f_text" name="FBbean"/>
<jsp:setProperty property="f_date" name="FBbean" value='<%=today %>'/>

<%
	FBjdbc.insertFBoardText(FBbean.getUser_id(), FBbean.getF_title(), FBbean.getF_text(), FBbean.getF_date());
%>
<script type="text/javascript">
	alert("글 작성이 완료되었습니다. 메인화면으로 이동합니다.");
	document.location.href="../main.jsp";
</script>

</body>
</html>