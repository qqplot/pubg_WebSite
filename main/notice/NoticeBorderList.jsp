<%@page import="pubg.util.NoticeSQL"%>
<%@page import="pubg.util.NoticeBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
NoticeSQL noticeSQL = new NoticeSQL();
Vector<NoticeBean> vc = noticeSQL.SelectAll();


 Iterator<NoticeBean> it =  vc.iterator();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 리스트</title>

<!-- noticeBorder.css Import -->
 <link rel="stylesheet" type="text/css" href="../css/noticeBorder.css">

</head>
<body>



 <div class='noticeBorder'>
         <div class='noticeTitle' >
  
  
   
      
   <table border="1" >
   
   
   
    <thead align="center">
   <tr bordercolor="">
    <td colspan="3">
    <h1>공지사항 리스트 </h1>
    
    <tr>
    <td align="left" > 
    <!-- 관리자만 이용이 가능합니다. -->
    <input type="button" value="글 입력" onclick="location='notice/NoticeBorderInsert.jsp'">
    
     </td>
    
    <td align="right" colspan="2">

    </td>
   </tr>
    
    </thead>
    
       <tr id="border_title_background" >  
        <td width="50px"> 번호 </td>
        <td width="700px"> 제목 </td>
        <td width="130px"> 작성일</td>
       </tr> 
       
       
     <%
     session.setMaxInactiveInterval(600); //공지사항 컬럼 10분간 유지
     for(int i = 0; i< vc.size(); i++){
       NoticeBean noticeBean = vc.get(i);
   	session.setAttribute("title"+i, noticeBean.getNo_title());
   	session.setAttribute("date"+i , noticeBean.getNo_date());
   	session.setAttribute("text"+i , noticeBean.getNo_text());
    	  
    	  %>
    	  <tr>  
        <td width="50px"> <%=noticeBean.getRegno() %> </td>
        <td width="700px"> <a href="NoticeTextView.jsp?count1=<%=i%>"><%=noticeBean.getNo_title() %></a> </td>
        <td width="130px"> <%=noticeBean.getNo_date() %></td>
       </tr> 
   <%
   }
   %>
   
        <tr align="center">  
        <td width="50px"></td>
        <td width="700px"> 
        <!-- Paging 처리 -->
             << < 1.2.3.4.5.6.7.8.9  > >>
        </td>
        <td width="130px"></td>
       </tr> 
   </table>        
             
         </div>  
         
           
 
 
 </div>


<div class='footer'>          

     @CopyRight
</div>

</body>
</html>