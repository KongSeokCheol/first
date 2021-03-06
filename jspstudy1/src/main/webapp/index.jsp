<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Every G</title>
<link href="CSS/Main.css" rel="stylesheet" type="text/css">
<script>
function Check(){
	alert("준비중입니다.")
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
<li><a class="gmenuLink" href="<%=request.getContextPath() %>/Platform/Platform/news.do">뉴스</a></li>
<li><a class="gmenuLink" href="<%=request.getContextPath() %>/Platform/PlatformList.do">플랫폼</a></li>
<li><a class="gmenuLink" href="<%=request.getContextPath() %>/Platform/ReviewList.do"> 리뷰</a></li>
<li><a class="gmenuLink" href="<%=request.getContextPath() %>/Platform/Pnc.do"> PC/노트북/CONSOLE</a></li>
<li><a class="gmenuLink" href="javascript:alert('준비중입니다.');"> 포인트마켓</a></li>
<li><a class="gmenuLink" href="https://www.youtube.com/c/%EC%98%81%EB%9E%98%EA%B8%B0"> Youtube</a></li>
</ul>
</div>
</nav>
<section class="content-center">
<article>
</article>
</section>
<aside class="side_menu">
  <div id="account" class="eg_login">
    <h2 class="blind">로그인</h2>
    <a href="<%=request.getContextPath() %>/member/memberLogin.do" class="link_login">Every G<i class="ico_Every_G"></i>로그인</a>
  <div class="sub_Area">
  <div class="Id_Pwd_box">
    <a href="javascript:alert('준비중입니다.');" class="link_Id/Pwd_find">아이디/비밀번호찾기</a>
  </div>
  <div class="link_join_box">
<a href="<%=request.getContextPath() %>/member/memberJoin.do" class="link_join">회원가입</a>
</div>
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