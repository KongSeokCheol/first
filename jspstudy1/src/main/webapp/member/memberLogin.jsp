<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<HTML>
 <HEAD>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <TITLE> 로그인 </TITLE> 
  <link href="../CSS/Login.css" rel="stylesheet" type="text/css">
  <script>
  function check(){
  	//alert("테스트");
  	
  	var fm = document.frm;
  	
  	if (fm.memberId.value ==""){
  		alert("아이디를 입력하세요");
  		fm.memberId.focus();
  		return;
  	}else if (fm.memberPwd.value ==""){
  		alert("비밀번호를 입력하세요");
  		fm.memberPwd.focus();
  		return;
  	}  		
        // 가상경로를 사용해서 페이지 이동시킨다
		fm.action = "<%=request.getContextPath()%>/member/memberLoginAction.do";
		fm.method = "post";
		fm.submit();

   return;
  }
  </script>

 </HEAD>
 <BODY>
<div id="logo-login-wrap">
           <a href="../index.jsp"> 
             <img id="logo2-img" alt="logo" src="../images/Logo2.png"></a>
        </div>
<div id="userInfo">
<form name="frm"> 
<p class="id_Wrap">
<input type="text" name="memberId" size="40" autocomplete="off" placeholder="아이디">
</p>
<p class="passWord_Wrap">
<input type="password" name="memberPwd" size="40" autocomplete="off" placeholder="비밀번호">
</p>
<div class="submit">
<input type="button" name ="btn" value="로그인" onclick="check();"> 
</div>
<div class="sub_area">
 <div class="Id_Pwd_box">
    <a href="<%=request.getContextPath() %>/member/memberJoin.do" class="link_Id/Pwd_find">아이디/비밀번호찾기</a>
  </div>
  <div class="link_join_box">
<a href="<%=request.getContextPath() %>/member/memberJoin.do" class="link_join">회원가입</a></div>
</div>
 </form>
 </div>
 </BODY>
</HTML>
