<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>

	<h1>회원정보 입력하기</h1>
	<hr />
	<form method="post" action="signup.jsp" name="userInfo" onsubmit="return checkValue()">
		<p>
			아이디: <input type="text" name="user_id" maxlength="30"/>
			<br /> 
			비밀번호: <input type="password" name="password" maxlength="30"/><br /> 
			비밀번호 확인: <input type="password" name="passwordcheck" maxlength="30"/><br /> 
			주소: <input type="text" name="address" maxlength="100"/><br /> 
			이메일: <input type="text" name="email" maxlength="30"/><br />
		</p>
		<p>
		<input id="btn_stop" type="submit" value="가입하기" /> 
		<input type="button" value="돌아가기" onclick="window.open('index.html','_self')" />
		</p>
	</form>
	
	<script type="text/javascript">
		function checkValue(){
			var form = document.userInfo;
			
			if(!form.user_id.value || form.user_id.value.trim().length == 0){
				alert("아이디를 입력하세요.");
				form.user_id.value = "";
				form.user_id.focus();
			}
			if(!form.password.value || form.password.value.trim().length == 0){
				alert("비밀번호를 입력하세요.");
				form.password.value ="";
				form.password.focus();
				return false;
			}			
			if(form.password.value != form.passwordcheck.value){
				alert("비밀번호를 동일하게 입력하세요.");
				form.passwordcheck.value="";
				form.passwordcheck.focus();
				return false;
			}
			if(!form.address.value){
				alert("주소를 입력하세요.");
				form.address.value = "";
				form.address.focus();
				return false;
			}
			if(!form.email.value){
				alert("이메일을 입력하세요.");
				form.email.value = "";
				form.email.focus();
				return false;
			}
		} // checkValue()
		
		
	</script>



</body>
</html>