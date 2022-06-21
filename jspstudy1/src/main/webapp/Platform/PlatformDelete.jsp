<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link href="../CSS/PlatformDelete.css" rel="stylesheet" type="text/css">
<script>
  function check(){
  //	alert("테스트");
  	
  	var fm = document.frm;
  	
  	if (fm.bidx.value ==""){
  		alert("bidx가 없습니다.");
  		fm.bidx.focus();
  		return;
  	}
  	    fm.action = "${pageContext.request.contextPath}/Platform/PlatformDeleteAction.do";
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
<h1>게시판 글삭제</h1>
<article id="platformDelete">
<form name="frm">
<table id=Delete>
<input type="hidden" name="bidx" value="${bidx }">
<tr>
<td id="font">삭제하시겠습니까?</td>
</tr>
<tr>
<td>
<input type="button" name="btn" value="확인" onclick="check();">
<input type="button" name="cancel" value="취소" onclick="location.href='${pageContext.request.contextPath }/Platform/PlatformContent.do?bidx=${bidx}'">
</td>
</tr>
</table>
</form>
</article>
</body>
</html>