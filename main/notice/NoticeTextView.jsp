<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 글 입니다.</title>
<%
         
  String index = (String)request.getAttribute("count1");
if(index ==null){
 
	index = "0";
}
	String title = (String)session.getAttribute("title"+index);
	String date = (String)session.getAttribute("date"+index);
	String text = (String)session.getAttribute("text"+index);

	System.out.print(index);
%>

<!-- noticeBorder.css Import -->
 <link rel="stylesheet" type="text/css" href="css/noticeBorder.css">
</head>
<body>



 <div class='noticeBorder'>
         <div class='noticeTitle' align="center">
         
     <table border="1">

       <tr id="border_title_background">  
        <td width="100%"> 제목:<%=title %> </td>
       </tr> 
       <tr id="border_title_background">  
        <td width="953px"> 등록일:<%=date %></td>       
       </tr>

    
    <tr>
      <td width="950px" height="200px">  게시글 :<%=text %> <td>
    <tr>
    
    <tr>
      <td width="950px" height="500px"> 컨텐츠:<td>
    <tr>
    
    
    <tr>
      <td><a href="./main/notice/NoticeBorderList.jsp"> 목록으로...</a><td>
      
    <tr>
                  
   </table>        
             
         </div>  
         
           
 
 
 </div>


<div class='footer'>          

     @CopyRight
</div>

</body>
</html>