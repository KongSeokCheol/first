<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
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
   <td class="subject">
        ${pv.subject }
   </td>
   <td class="writeday">
        ${pv.writeday }
   </td>
</tr>

<tr class="top">
   <td class="writer">
        ${pv.writer }
   </td> 
   <td class="view">
        조회수${pv.view_count }
   </td>
</tr>

<tr class="middle">
   <td class ="Content">
        ${pv.content }<br>
   </td>
</tr>

<tr class="bottom">
<td class="file">첨부파일&nbsp;&nbsp;&nbsp;

<c:choose>
<c:when test="${pv.filename != null }">
<c:otherwise>
없음
</c:otherwise> 
</c:when>
</c:choose>


<img src="${pageContext.request.contextPath}/images/${pv.filename}">
<a href="${pageContext.request.contextPath}/Platform/fileDownload.do?filename=${pv.filename}"></a>
</td>
</tr>

<tr>
</tr>
<tr>
<td colspan=2 style="text-align:center;">
<a class="modify_btn" href="${pageContext.request.contextPath}/Platform/PlatformModify.do?bidx=${pv.bidx}">[수정]</a>
<a class="delete_btn" href="${pageContext.request.contextPath}/Platform/PlatformDelete.do?bidx=${pv.bidx}">[삭제]</a>
<a class="reply_btn" href="${pageContext.request.contextPath}/Platform/PlatformReply.do?bidx=${pv.bidx}&originbidx=${pv.originbidx }&depth=${pv.depth }&${pv.level_}">[답변]</a>
<a class="platformList_btn" href="${pageContext.request.contextPath}/Platform/PlatformList.do">[목록]</a>
</td>
</tr>
</table>
</article>
</body>
</html>