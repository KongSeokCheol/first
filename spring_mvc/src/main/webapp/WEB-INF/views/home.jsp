<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<body>
<h1>
	Hello world!  
</h1>

<P>  홈 페이지입니다... </P>

<a href="/spring/join.do">회원가입</a>

<%
	String member_id = (String)session.getAttribute("member_id");
	if(member_id != null){
%>
	<p/>
	${member_id}님 회원가입이 정상적으로 이루어졌습니다..
<%
	}
%>
</body>
</html>
