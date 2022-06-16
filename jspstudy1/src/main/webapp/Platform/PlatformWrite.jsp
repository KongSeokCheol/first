<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="jspstudy.domain.*" %>
 <% 
 if (session.getAttribute("midx") == null){
	 session.setAttribute("saveUrl", request.getRequestURI());
	 
	out.println("<script>alert('로그인해주세요');location.href='"+request.getContextPath()+"/member/memberLogin.do'</script>"); 
 } 
 %>   
<!DOCTYPE html>
<html>
<head>
<link href="../CSS/PlatformWrite.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>글쓰기</title>
<script>
  function check(){
  	
  	var fm = document.frm;
  	
  	if (fm.subject.value ==""){
  		alert("제목을 입력하세요");
  		fm.subject.focus();
  		return;
  	}else if (fm.content.value ==""){
  		alert("내용을 입력하세요");
  		fm.content.focus();
  		return;
  	}else if (fm.writer.value ==""){
  		alert("작성자를 입력하세요");
  		fm.writer.focus();
  		return;
  	}
  		fm.action = "<%=request.getContextPath()%>/Platform/PlatformWriteAction.do";
		fm.method = "post";
		fm.enctype= "multipart/form-data";
		fm.submit();
	
  }
</script>
</head>
<body>
<header class="Top-logo">
        <div id="logo-search-wrap">
           <a href="../index.jsp"> 
             <img id="logo-img" alt="logo" src="../images/logo.png"></a></div>
        <div>      
        <form id="search" action="/search/result" method="GET">
            <input type="text" id="searchWord" name="searchWord" placeholder="검색어를 입력하세요"
                    maxlength="255" size="255">
            <input class="searchButton" type="button" name="searchButton" value="검색" onclick="location.href='<%=request.getContextPath()%>//'">
       </form>
       </div>
</header>
<nav id="menu-line">
<div id="gmenu-box">
<ul id="gmenu-list">
<!-- 관리자 권한 접근<a href="<%=request.getContextPath() %>/member/memberList.do">회원 목록가기</a> -->
<!-- 플랫폼<a href="<%=request.getContextPath() %>/Platform/PlatformWrite.do">게시판 글쓰기</a> -->

<li><a class="gmenuLink" href="<%=request.getContextPath()%>/Platform/Platform/news.do">뉴스</a></li>
<li><a id="on" class="gmenuLink" href="<%=request.getContextPath()%>/Platform/PlatformList.do">플랫폼</a></li>
<li><a class="gmenuLink" href="<%=request.getContextPath()%>/Platform/ReviewList.do"> 리뷰</a></li>
<li><a class="gmenuLink" href="<%=request.getContextPath()%>/Platform/Pnc.do"> PC/노트북/CONSOLE</a></li>
<li><a class="gmenuLink" href="<%=request.getContextPath()%>/Platform/PlatformList.do"> Youtube</a></li>
</ul>
</div>
<div id="menu-line2">
<ul id="gnb">
<li><a class="gnbLink" href="<%=request.getContextPath()%>/Platform/PlatformList.do" target="_self">
<strong>PC</strong></a></li>
<li><a class="gnbnuLink" href="<%=request.getContextPath()%>/Platform/Platform/news.do" target="_self">모바일</a></li>
<li><a class="gnbnuLink" href="<%=request.getContextPath()%>/Platform/Platform/news.do" target="_self">PlatStaytion</a></li>
<li><a class="gnbnuLink" href="<%=request.getContextPath()%>/Platform/Platform/news.do" target="_self">Switch</a></li>
<li><a class="gnbnuLink" href="<%=request.getContextPath()%>/Platform/Platform/news.do" target="_self">XBOX</a></li>
<li><a class="gnbnuLink" href="<%=request.getContextPath()%>/Platform/Platform/news.do" target="_self">AR/VR</a></li>
</ul>
</div>
</nav>
<article id="PlatformContent">
<table border-collapse="collapse">
<form name="frm">
<tr>
    <td>
        <br>제목<br>
        <input type="text" name="subject" id="Subject" size="98" placeholder="제목을 입력해주세요">
    </td>
</tr>
<tr>
    <td>
        <br>내용<br>
        <textarea name="content" id="Content" placeholder="내용을입력해주세요" cols="70" rows="25"></textarea>
   </td>
</tr>
<tr>
    <td>
        파일<br>
        <input type="file" name="filename">
   </td>
</tr>
<tr>
    <td>글쓴이
        <input type="text" name="writer" size="10" value="<%=session.getAttribute("memberNick")%>" readonly="readonly">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" name="btn" value="확인" onclick="check();">
        <input type="reset" name="reset" value="다시작성">
        <input type="button" name="btn2" value="돌아가기" onclick="location.href='<%=request.getContextPath()%>/Platform/PlatformList.do'">
   </td>
</tr>
</form>
</table>
</article>
</body>
</html>