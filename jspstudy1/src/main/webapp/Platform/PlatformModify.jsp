<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jspstudy.domain.PlatformVo" %>    
<%
    PlatformVo pv = (PlatformVo)request.getAttribute("pv");

     if (session.getAttribute("midx") == null){
    	out.println("<script>alert('로그인해주세요');location.href='"+request.getContextPath()+"/member/memberLogin.do'</script>"); 
    }
%>
<%
String bidx = (String)request.getAttribute("bidx"); 
%>
<!DOCTYPE html>
<html>
<head>
<link href="../CSS/PlatformModify.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>글쓰기</title>
<script>
  function check(){
  //	alert("테스트");
  	
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
  		fm.action = "<%=request.getContextPath()%>/Platform/PlatformModifyAction.do";
		fm.method = "post";
		fm.submit();
  }
</script>
</head>
<body>
<header id="Top_logo_bg">
        <div class="logo-wrap">
           <a href="index.jsp" class="logo">Every G</a>
        </div>
        <div>      
        <form id="search" action="/search/result" method="POST">
            <input type="text" class="searchWord" name="searchWord" placeholder="검색어를 입력하세요"
                    maxlength="255" size="255">
            <input class="searchButton" type="button" name="searchButton" value="검색" onclick="javascript:Check();">
       </form>
       </div>
</header>
<nav id="gmenu-line">
<div id="gmenu-box">
<ul id="gmenu-list">
<!-- 관리자 권한 접근<a href="<%=request.getContextPath() %>/member/memberList.do">회원 목록가기</a> -->
<!-- 플랫폼<a href="<%=request.getContextPath() %>/Platform/PlatformWrite.do">게시판 글쓰기</a> -->

<li><a class="gmenuLink" href="<%=request.getContextPath()%>/Platform/Platform/news.do">뉴스</a></li>
<li><a id="on" class="gmenuLink" href="<%=request.getContextPath()%>/Platform/PlatformList.do">플랫폼</a></li>
<li><a class="gmenuLink" href="<%=request.getContextPath()%>/Platform/ReviewList.do"> 리뷰</a></li>
<li><a class="gmenuLink" href="<%=request.getContextPath()%>/Platform/Pnc.do"> PC/노트북/CONSOLE</a></li>
<li><a class="gmenuLink" href="javascript:alert('준비중입니다.');"> 포인트마켓</a></li>
<li><a class="gmenuLink" href="<%=request.getContextPath()%>/Platform/PlatformList.do"> Youtube</a></li>
</ul>
<ul id="gnb">
<li><a class="gnbLink" href="<%=request.getContextPath()%>/Platform/PlatformList.do" target="_self">
<strong>PC</strong></a></li>
<li><a class="gnbnuLink1" href="javascript:alert('준비중입니다.');" target="_self">모바일</a></li>
<li><a class="gnbnuLink2" href="javascript:alert('준비중입니다.');" target="_self">PlatStaytion</a></li>
<li><a class="gnbnuLink3" href="javascript:alert('준비중입니다.');" target="_self">Switch</a></li>
<li><a class="gnbnuLink4" href="javascript:alert('준비중입니다.');" target="_self">XBOX</a></li>
<li><a class="gnbnuLink5" href="javascript:alert('준비중입니다.');" target="_self">AR/VR</a></li>
</ul>
</div>
</nav>
<article id="PlatformContent">
<form name="frm">
<table border-collapse="collapse">
<input type="hidden" name="bidx" value="<%=pv.getBidx() %>">
<tr>
<td>
<br>
제목<br>
<input type="text" name="subject" size="98" value="<%=pv.getSubject() %>"><placeholder="제목을 입력해주세요"></td>
</tr>
<tr>
<td>
    <br>내용<br>
         <textarea name="content" placeholder="내용을 입력해주세요" cols="100" rows="25"><%=pv.getContent() %></textarea>
     </td>
</tr>
<tr>
    <td>
        파일<br>
        <input type="file" name="filename" value="<%=pv.getFilename() %>">
   </td>
   <td>
<tr>
    <td>글쓴이
        <input type="text" name="writer" size="10" value="<%=session.getAttribute("memberNick")%>" readonly="readonly">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" name="btn" value="확인" onclick="check();">
        <input type="reset" name="reset" value="다시작성">
        <input type="button" name="btn2" value="돌아가기" onclick="location.href='<%=request.getContextPath()%>/Platform/PlatformContent.do?bidx=<%=pv.getBidx() %>'">
   </td>
</tr>
</table>
</form>
</article>
</body>
</html>