<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="jspstudy.domain.*" %>   
<%@ page import = "java.util.*" %> 
<%
	//select 쿼리를 사용하기 위해서 function에서 메소드를 만든다
	//memberSelectAll 메소드 호출한다
	//MemberDao md = new MemberDao();
//	ArrayList<MemberVo> alist = md.memberSelectAll() ;
//	out.println(alist.get(0).getMembername()+"<br>");

    ArrayList<MemberVo> alist=(ArrayList<MemberVo>)request.getAttribute("alist");
	
%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<link href="../CSS/Top-logo.css" rel="stylesheet" type="text/css">
</head>
<body>
<div style="float:right;">
<% 
if (session.getAttribute("memberNick") == "관리자"){
	out.println("회원아이디:"+session.getAttribute("memberId")+"<br>");
	out.println("회원닉네임:"+session.getAttribute("memberNick")+"<br>");
	out.println("회원이름:"+session.getAttribute("memberName")+"<br>");
	out.println("<a href='"+request.getContextPath()+"/member/memberLogout.do'>로그아웃</a>");
}

%>
</div>
<header class="Top-logo">
        <div id="logo-search-wrap">
           <a href="../index2.jsp"> 
             <img id="logo-img" alt="logo" src="../images/Logo2.png"></a>
        </div>
</header>
<center><h1>회원목록 리스트</h1></center>
<br>
<table border=1 style="width:1000px" align="center">
<tr style="color:green;">
<th>번호</th>
<th>회원닉네임</th>
<th>회원이름</th>
<th>회원연락처</th>
<th>회원이메일</th>
<th>가입일</th>
</tr>

<% for (MemberVo mv : alist) {%>
<tr>
<td><%=mv.getMidx() %></td>
<td><%=mv.getMemberNick() %></td>
<td><%=mv.getMemberName() %></td>
<td><%=mv.getMemberPhone() %></td>
<td><%=mv.getMemberEmail() %></td>
<td><%=mv.getWriteday() %></td>
</tr>
<% } %>

</table>
</body>
</html>