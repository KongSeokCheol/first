<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Every G</title>
<link href="CSS/Main2.css" rel="stylesheet" type="text/css">
<script>
function Check(){
	alert("준비중입니다.")
}
</script>
</head>
<body>
<header class="Top-logo">
        <div id="logo-search-wrap">
           <a href="index3.jsp"> 
             <img id="logo-img" alt="logo" src="images/logo.png"></a></div>
        <div>      
    <form id="search" action="/search/result" method="GET">
            <input type="text" id="searchWord" name="searchWord" placeholder="검색어를 입력하세요"
                    maxlength="255" size="255">
                 
            <input class="searchButton" type="button" name="searchButton" value="검색" onclick="javascript:Check();">
    </form>
       </div>
       <div class="MemberList">
             <a class="adminLink" href="<%=request.getContextPath() %>/Platform/MemberListList.do"> 회원목록</a></li>
       </div>
</header>
<nav id="menu-line">
<div id="gmenu-box">
<ul>
<!-- 관리자 권한 접근<a href="<%=request.getContextPath() %>/member/memberList.do">회원 목록가기</a> -->
<!-- 플랫폼<a href="<%=request.getContextPath() %>/Platform/PlatformWrite.do">게시판 공지사항</a> -->
<li><a class="gmenuLink" href="<%=request.getContextPath() %>/Platform/Platform/news.do">뉴스</a></li>
<li><a class="gmenuLink" href="<%=request.getContextPath() %>/Platform/PlatformList.do">플랫폼</a></li>
<li><a class="gmenuLink" href="<%=request.getContextPath() %>/Platform/ReviewList.do"> 리뷰</a></li>
<li><a class="gmenuLink" href="<%=request.getContextPath() %>/Platform/Pnc.do"> PC/노트북/CONSOLE</a></li>
<li><a class="gmenuLink" href="<%=request.getContextPath() %>/Platform/Pnc.do"> 포인트마켓</a></li>
<li><a class="gmenuLink" href="<%=request.getContextPath() %>/Platform/PlatformList.do"> Youtube</a></li>
</ul>
</div>
</nav>
<section class="content-center">
<article>
</article>
</section>
<h1>git test1</h1>
<aside class="side_menu">
  <div id="account" class="eg_login">
<% 
if (session.getAttribute("midx") != null){
	out.println("Lv.01 :"+session.getAttribute("memberNick")+"&nbsp"+"&nbsp"+"&nbsp"+"&nbsp"+"&nbsp"+"&nbsp"+"&nbsp"+"&nbsp");
    out.println("<a href='"+request.getContextPath()+"/member/memberLogout.do'>로그아웃</a>");
}

%>
<div class="sub_Area">
<div class="MyPage_box"><a href="javascript:alert('준비중입니다.');">마이페이지</a></div>
<div class="alram_box"><a href="javascript:alert('준비중입니다.');">알림</a></div>
</div>
</div>

<div class="game_ranking">
<div class="ranking_title-box">
<h2 class="title_name">Every G 게임순위</h2>
</div>
<ul class="ranking_list">
<li><span class="rank_num">1</span><span class="rank_subject">리그오브레전드</span><span class="rise_fall">&nbsp;&nbsp;-</span></li>
<li><span class="rank_num">2</span><span class="rank_subject">피파온라인4</span><span class="rise_fall">&nbsp;&nbsp;-</span></li>
<li><span class="rank_num">3</span><span class="rank_subject">로스트아크</span><span class="rise_fall">&nbsp;&nbsp;-</span></li>
<li><span class="rank_num">4</span><span class="rank_subject">서든어택</span><span class="rise_fall">&nbsp;&nbsp;-</span></li>
<li><span class="rank_num">5</span><span class="rank_subject">배틀그라운드</span ><span class="rise_fall">&nbsp;&nbsp;-</span></li>
<li><span class="rank_num">6</span><span class="rank_subject">오버워치</span><span class="rise_fall">&nbsp;&nbsp;-</span></li>
<li><span class="rank_num">7</span><span class="rank_subject">메이플스토리</span><span class="rise_fall">&nbsp;&nbsp;-</span></li>
<li><span class="rank_num">8</span><span class="rank_subject">스타크래프트</span><span class="rise_fall">&nbsp;&nbsp;-</span></li>
<li><span class="rank_num">9</span><span class="rank_subject">발로란트</span><span class="rise_fall">&nbsp;&nbsp;-</span></li>
<li><span class="rank_num">10</span><span class="rank_subject">오버워치</span><span class="rise_fall">&nbsp;&nbsp;-</span></li>
</ul>
</div>
</aside>
</body>
</html>