<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jspstudy.domain.PlatformVo" %>  
<%
	PlatformVo pv = (PlatformVo)request.getAttribute("pv");
%>        
<!DOCTYPE html>
<html>
<head>
<link href="../CSS/PlatformContent.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>게시글 상세보기</title>
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
<table id="ContentDetail">
<tr class="top">
<td class="subject"><%=pv.getSubject() %></td>
<td class="writeday"><%=pv.getWriteday() %></td>
</tr>
<tr class="top">
<td class="writer"><%=pv.getWriter() %>
</td>
<td class="view">조회수<%=pv.getView_count() %></td>
</tr>
<tr class="middle">
<td class ="Content">
<%=pv.getContent() %>
<br>
</td>
</tr>
<tr class="bottom">
<td class="file">첨부파일&nbsp;&nbsp;&nbsp;
<% 
if (pv.getFilename() != null){ 
	
}else{
	out.println("없음");
%>
<img src="<%=request.getContextPath()%>/images/<%=pv.getFilename()%>">
<a href="<%=request.getContextPath()%>/Platform/fileDownload.do?filename=<%=pv.getFilename()%>"></a>
</td>
</tr>
<% } %>
<tr>
</tr>
<tr>
<td colspan=2 style="text-align:center;">
<input type="button" name="modify" value="수정" onclick="location.href='<%=request.getContextPath()%>/Platform/PlatformModify.do?bidx=<%=pv.getBidx()%>'">
<input type="button" name="delete" value="삭제" onclick="location.href='<%=request.getContextPath()%>/Platform/PlatformDelete.do?bidx=<%=pv.getBidx()%>'">
<input type="button" name="reply" value="답변" onclick="location.href='<%=request.getContextPath()%>/Platform/PlatformReply.do?bidx=<%=pv.getBidx()%>&originbidx=<%=pv.getOriginbidx()%>&depth=<%=pv.getDepth()%>&level_=<%=pv.getLevel_()%>'">
<input type="button" name="list" value="목록" onclick="location.href='<%=request.getContextPath()%>/Platform/PlatformList.do'">
</td>
</tr>
</table>
</article>
</body>
</html>