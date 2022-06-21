<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록</title>
<link href="../CSS/PlatformMain.css" rel="stylesheet" type="text/css">
</head>
<body>
<header id="Top_logo_bg">
        <div class="logo-wrap">
           <a href="../index.jsp" class="logo">Every G</a>
        </div>
        <div>      
        <form id="search" action="/search/result" method="POST">
            <input type="text" class="searchWord" name="searchWord" placeholder="검색어를 입력하세요"
                    maxlength="255" size="255">
            <input class="searchButton" type="button" name="searchButton" value="검색" onclick="javascript:Check();">
       </form>
       </div>
<div id="sessionId">
<% 
if (session.getAttribute("midx") != null){
	out.println("Lv.01 :"+session.getAttribute("memberNick")+"&nbsp"+"&nbsp"+"&nbsp"+"&nbsp"+"&nbsp"+"&nbsp"+"&nbsp"+"&nbsp");
    out.println("<a href='"+request.getContextPath()+"/member/memberLogout.do'>로그아웃</a>");
}

%>
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
<article id="PlatformList">
<table id="writeList">
<tr style="color:#aaaaaa; border-bottom : 1px solid #dcdcdc;
	height : 50px;">
<th class="bidx">글번호</th>
<th class="subject" >제목</th>
<th class="writer">글쓴이</th>
<th class="writeday">작성일</th>
<th class="view">조회수</th>
</tr>
</table>
<table id="writeList2">


<c:forEach var="pv" items="${alist}" >

	
<tr class="bottomLine">

<td class="bidx">
     ${pv.bidx}
</td>

<td class="subject" >

<c:forEach var="i" begin="1" end="${pv.level_}" step="1">
&nbsp;&nbsp;
<c:if test="${ i == pv.level_ }">
ㄴ
</c:if>
</c:forEach>


<a href="${pageContext.request.contextPath}/Platform/PlatformContent.do?bidx=${pv.bidx}">${pv.subject}</a>
</td>
<td class="writer">${pv.writer}</td>
<td class="writeday">${pv.writeday}</td>
<td class="view">${pv.view_count}</td>
</tr>
</c:forEach>

</table>
<table id="page">
<tr style="height:50px;">
<td style="width:200px; text-align:right;">
<c:if test="${pm.prev == true}">
<a href=" ${pageContext.request.contextPath}/Platform/PlatformList.do?page=${pm.startPage-1}&keyword=${pm.scri.keyword }">
         ◀
    </a>
    </c:if>
</td>

<td>
    <c:forEach begin="${pm.startPage }"  end="${pm.endPage }" step="1" var="1">
       <a href="${pageContext.request.contextPath}/Platform/PlatformList.do?page=${i}&keyword=${pm.scri.keyword}">${i}</a>
    </c:forEach>
</td>

<td style="width:200px;text-align:left;">
<c:if test="${pm.next&&pm.endPage >0 }">
<a href="${pageContext.request.contextPath }/Platform/PlatformList.do?page=${pm.EndPage+1 }&keyword=${pm.scri.keyword }">
  ▶
</a>
</c:if>
</td>
</tr>
</table>
<form name="frm" action="${pageContext.request.contextPath }/Platform/PlatformList.do" method="post">
<table id="ListSearch"> 
<tr>
<td style="width:620px;">
<select name="searchType">
<option value="subject">제목</option>
<option value="writer">작성자</option>
</select>
<input type="text" name="keyword" size ="10">
<input type="submit" name="submit" value="검색">
</td>
</tr>
</table>
</form>
<table>
<tr>
<td id="writeBtn_area">
     <a href="${pageContext.request.contextPath}/Platform/PlatformWrite.do" class="write_btn">글작성</a> 
</td>
</tr>
</table>
</article>
</body>
</html>