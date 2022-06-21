<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>

<body>

<h3>회원정보를 입력해주세요</h3>

<form name="joinForm" action="/spring/joinProcess.do" method="post">
	<input type="email" name="member_id" value="" maxlength="80" placeholder="아이디(이메일)" /><br/>
	<input type="password" name="member_pw"  value="" maxlength="20" placeholder="비밀번호"><br/>            
	<input type="text" name="member_name" maxlength="40" value="" placeholder="이름"><br/>
	<input type="tel" name="member_phone"  value="" autocomplete="off" placeholder="휴대폰 번호"><br/>
	<input type="submit" value="가입하기">
	<input type="reset"  value="취소하기">
</form> 

</body></html>        