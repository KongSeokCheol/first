<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#ResultImg {
  position : absolute;
  right : 400px;
  top : 120px;
}
#MainMove {
    position : absolute;
    right : 925px;
    bottom : 300px;
    font-size : 20px;
    height : 50px;
	width : 100px;
	margin : 12px 10px 0px 10px;
	padding : 12px 10px 0px 10px;
	background : #A2F5E6;
	border : #A2F5E6;
	border-radius : 5px;
	font-weight : bold;
	font-size : 25px;
	color : white;	
}
a {
	text-decoration : none;
	color : inherit;
}
</style>
<meta charset="UTF-8">
<title>회원가입 완료</title>
</head>
<body>
<div id="ResultImg">
<img src="../images/joinOK.png">
</div>
<div>
<a href ="<%=request.getContextPath()%>/index.jsp" id="MainMove">메인이동</a>
</div>
</body>
</html>