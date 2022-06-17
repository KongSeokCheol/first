<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<TITLE> 회원가입 </TITLE> 
<link href="../CSS/Join.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script type="text/javascript">
   $(function Check(){
    
      $('#nickCheck').on('focusout' , function(){
    	  
		  var memberNick = $(this).val(); 
		  var regNick = /^([a-z|A-Z|0-9|가-힣]{2,10})+$/;
		  
       if(memberNick == "") {
		    $('#checkNick').html('닉네임을 입력해주세요.');
		    $('#checkNick').attr('color','red');
       }else if(!regNick.test($(this).val())){
    	    $('#checkNick').html('닉네임은 한글, 영문, 숫자만 가능하며 2-10자리 가능합니다.');
	  		$('#checkNick').attr('color','red');
	  		$('#nickCheck').focus();
       }else if(!regNick.test(this)){
		   $.ajax({
			   url : "<%=request.getContextPath()%>/member/CheckResultNick.do",
			   type : 'POST',
			   data : { "memberNick": memberNick },
			   async : false,
			   success : function(nickCheck){ 
			        if(nickCheck == 1){	
				        $('#checkNick').html('중복된 닉네임입니다.');
				        $('#checkNick').attr('color','red');
				        $('#nickCheck').focus();
			       }else{
					    $('#checkNick').html('사용 가능한 닉네임입니다.');
					    $('#checkNick').attr('color','green'); 	    
			   }
			 },   
			   error : function(){
				  alert("서버요청실패");
			   }
		   });
      };
    });
  	  $('#idCheck').on('focusout' , function(){
   			
		   var memberId = $(this).val();
		   var regId = /^[a-z]+[a-z0-9]{5,19}$/g;
		 if(memberId == "") {
			   $('#checkId').html('아이디를 입력해주세요.');
			   $('#checkId').attr('color','red');
  	     }else if(!regId.test($(this).val())){
 	        $('#checkId').html('아이디는 영문, 숫자만 가능하며 6-19자리 가능합니다.');
	  		$('#checkId').attr('color','red');
	  		$('#idCheck').focus();
         }else if(!regId.test(this)){
	 	   $.ajax({
			   url : "<%=request.getContextPath()%>/member/CheckResultId.do",
			   type : 'POST',
			   data : { "memberId": memberId },
			   async : false,
			   success : function(idCheck){
		            if(idCheck == 1) {
					   $('#checkId').html('중복된 아이디입니다.');
					   $('#checkId').attr('color','red');
					   $('#idCheck').focus();
				   }else{
					   $('#checkId').html('사용할 수 있는 아이디입니다.');
					   $('#checkId').attr('color','green');
				   }
			   },
			   error : function(){
				   alert("서버요청실패");
			    }
		    });
         };
     });
     $('#pwd').on('focusout' , function(){
   			
 		  var memberPwd = $(this).val();
    	  var regPwd = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/;
    		  
 		  if(memberPwd == "") {
			   $('#checkPwd').html('비밀번호를 입력해주세요.');
			   $('#checkPwd').attr('color','red');
 		  }else if(regPwd.test($(this).val())){
			   $('#checkPwd').html('');
 		  }else{
 			   $('#checkPwd').html('비밀번호는 8-16자리, 각각 하나 이상의 대문자, 소문자, 숫자 및 특수 문자(@$!%)를 입력해주세요');
 			   $('#checkPwd').attr('color','red');
 			   $('#pwd').focus();
 		  }
    });
  		 $('#pwd2').on('focusout' , function(){
  			 	 
  		  var memberPwd2 = $(this).val();
  		  
  		  if(memberPwd2 == "") {
 			   $('#checkPwd2').html('비밀번호 확인을 입력해주세요.');
 			   $('#checkPwd2').attr('color','red');
 			   
  		  }else	if($('#pwd2').val() == ($('#pwd').val())){
 	 			   $('#checkPwd2').html('비밀번호가 일치합니다.');
 	 			   $('#checkPwd2').attr('color','green');
  		       }else{
 	  		       $('#checkPwd2').html("비밀번호가 일치하지 않습니다.");
 	  		       $('#checkPwd2').attr('color','red');
 	  		       $('#pwd2').focus();
  	    }
    });
  		 $('#name').on('focusout' , function(){
    			
  	 		  var memberName = $(this).val();
  	    	  var regName = /^([가-힣]{2,})+$/
  	    		  
  	 		  if(memberName == "") {
  				   $('#checkName').html('이름을 입력해주세요.');
  				   $('#checkName').attr('color','red');
  	 		  }else if(regName.test($(this).val())){
  				   $('#checkName').html('');
  	 		  }else{
  	 			   $('#checkName').html('올바른 이름 형식이 아닙니다.');
  	 			   $('#checkName').attr('color','red');
  	 			   $('#name').focus();
  	 		  }
  });
  		 $('#birth').on('focusout' , function(){
 			
 	 		  var memberBirth = $(this).val();
 	    	  var regBirth = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])+$/;
 	    		  
 	 		  if(memberBirth == "") {
 				   $('#checkBirth').html('생년월일을 입력해주세요');
 				   $('#checkBirth').attr('color','red');
 				   
 	 		  }else if(regBirth.test($(this).val())){
 				   $('#checkBirth').html('');
 	 		  }else{
 	 			   $('#checkBirth').html('생년월일 8자리를 입력해주세요');
 	 			   $('#checkBirth').attr('color','red');
 	 			   $('#birth').focus();
 	 		  }    
      });	 
  		$('#gender').on('focusout' , function(){
 			
	 		  var memberGender = $(this).val();
	    		  
	 		  if(memberGender == "genderCheck") {
				   $('#checkGender').html('성별을 선택해주세요');
				   $('#checkGender').attr('color','red');
	 		  }else{
					$('#checkGender').html('');
	 		  }		
    });
  		$('#phone').on('focusout' , function(){
 			
	 		  var memberPhone = $(this).val();
	    	  var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	    		  
	 		  if(memberPhone == "") {
				   $('#checkPhone').html('휴대폰 번호를 입력해주세요');
				   $('#checkPhone').attr('color','red');
				   
	 		  }else if(regPhone.test($(this).val())){
				   $('#checkPhone').html('');
	 		  }else{
	 			   $('#checkPhone').html('올바른 휴대폰 번호 형식이 아닙니다.');
	 			   $('#checkPhone').attr('color','red');
	 			   $('#phone').focus();
	 		  }
    });
  		$('#email').on('focusout' , function(){
 			
	 		  var memberEmail = $(this).val();
	    	  var regPhone = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	    		  
	 		  if(memberEmail == "") {
				   $('#checkEmail').html('이메일을 입력해주세요');
				   $('#checkEmail').attr('color','red');
				   
	 		  }else if(regPhone.test($(this).val())){
				   $('#checkEmail').html('');
	 		  }else{
	 			   $('#checkEmail').html('올바른 이메일 형식이 아닙니다.');
	 			   $('#checkEmail').attr('color','red');
	 			   $('#email').focus();
	 		  }
   });
  		$("#frm").on('submit' , function(){
  			
  			var memberNick = $("#nickCheck").val();
  			var memberId = $("#idCheck").val();
  			var memberPwd = $("#pwd").val();
  			var memberPwd2 = $("#pwd2").val();
  			var memberName = $("#name").val();
  			var memberBirth = $("#birth").val();
  			var memberGender = $("#gender").val();
  			var memberPhone = $("#phone").val();
  			var memberEmail = $("#email").val();
  			
  			if(memberNick == ''){
  				alert("닉네임을 입력해주세요");
  				$("#nickCheck").focus();
  				return false;
  			}else if(memberId == ''){
  				alert("아이디를 입력해주세요");
  				$("#idCheck").focus();
  				return false;
  			}else if(memberPwd == ''){
  				alert("비밀번호를 입력해주세요");
  				$("#pwd").focus();
  				return false;
  			}else if(memberPwd2 == ''){
  				alert("비밀번호 확인을 입력해주세요");
  				$("#pwd2").focus();
  				return false;
  			}else if(memberName == ''){
  				alert("이름을 입력해주세요");
  				$("#name").focus();
  				return false;
  			}else if(memberBirth == ''){
  				alert("생년월일을 입력해주세요");
  				$("#birth").focus();
  				return false;
  			}else if(memberGender == 'genderCheck'){
  				alert("성별을 선택해주세요");
  				return false;
  			}else if(memberPhone == ''){
  				alert("휴대폰 번호를 입력해주세요");
  				$("#phone").focus();
  				return false;
  			}else if(memberEmail == ''){
  				alert("이메일을 입력해주세요");
  				$("#emaild").focus();
  				return false;
  			} 
  		       
  		 });	
    });
</script>
</head>
<body>
<div id="logo-login-wrap">
           <a href="../index.jsp"> 
             <img id="logo2-img" alt="logo" src="../images/Logo2.png"></a>
<h1>회 원 가 입</h1>
</div>
<div id="jon">
<form id="frm" name="join_form" action="<%=request.getContextPath()%>/member/memberJoinAction.do" method="post">
<table style="vertical-align:top"class="join_table" >
	<tr>
	   <td>
	       &nbsp;닉네임<br>
	       <input type="text" id="nickCheck" class="Nick" name="memberNick" value="" maxlength="30" placeholder="2글자 이상 영문 및 한글만 입력가능">
	  </td>
	</tr>
	       
	<tr>   
	    <td>
	        <!-- 닉네임 체크 메시지 출력 -->
	        <font id="checkNick" size ="2"></font>
	   </td>
	</tr>
	<tr>
	    <td>
	        &nbsp;아이디<br>
	        <input type="text" id="idCheck" class="Id" name="memberId"  Maxlength="30" placeholder="아이디">
	   </td>
	</tr>
	<tr>
	    <td>
	        <!-- 아이디 체크 메시지 출력 -->     
	        <font id="checkId" size ="2"></font>
	   </td>
	</tr>
	<tr>
	    <td>
	        &nbsp;비밀번호<br>
	        <input type="password" id="pwd" class="Pwd" name="memberPwd"  size="30" placeholder="비밀번호">
	    </td>
	</tr>
	<tr>
	     <td><!-- 비밀번호 체크 메시지 출력 --> 
	         <font id="checkPwd" size ="2"></font>
	     </td>
	</tr>
	<tr>
	    <td>
	        &nbsp;비밀번호 확인<br> 
	        <input type="password" id="pwd2" class="Pwd2" name="memberPwd2" size="30" placeholder="비밀번호 확인">
	   </td>
	</tr>
	<tr>
	    <td><!-- 비밀번호 Re체크 메시지 출력 -->
	        <font id="checkPwd2" size ="2"></font>
	   </td>
	</tr>
	<tr>
	  <td>
	      &nbsp;이 름<br>
	      <input type="text" id="name" class="Name" name="memberName" size="30" placeholder="이름을 입력해주세요">
	 </td>
	</tr>
	<tr>
	    <td><!-- 이름 체크 메시지 출력 -->
	        <font id="checkName" size ="2"></font>
	   </td>
	</tr>
	<tr>
	    <td>
	        &nbsp;생년월일<br>
	        <input type="text" id="birth" class="Birth" name="memberBirth" maxlength="8" size="30" placeholder="생년월일 8자리 입력해주세요">
	    </td>
	</tr>
	<tr>
	    <td><!--  생년월일 체크 메시지 출력 -->
	        <font id="checkBirth" size ="2"></font>
	   </td>
	</tr>
	<tr>
	    <td>
	        &nbsp;성별<br>
	        <select id="gender" class="Gender" name="memberGender">
	               <option value="genderCheck">성별</option>
	               <option value="M">남성</option>
	               <option value="F">여성</option>
	        </select>
	   </td>
    </tr>
    <tr>
	    <td><!-- 성별 체크 메시지 출력 -->
	        <font id="checkGender" size ="2"></font>
	   </td>
	</tr>
	<tr>
	    <td>
	        &nbsp;휴대폰<br>
	        <input type="text" id="phone" class="Birth" name="memberPhone"  maxlength="11" size="30" placeholder="'-'를 빼고 입력해주세요">
	    </td>
	</tr>
	<tr>
	    <td><!-- 휴대폰 체크 메시지 출력 -->
	        <font id="checkPhone" size ="2"></font>
	   </td>
	</tr>
	<tr>
	    <td>
	        &nbsp;이메일<br>
	        <input type="email" id="email" class="Email" name="memberEmail" size="30" placeholder="example@gmail.com">
	   </td>
	</tr>
	<tr>
	    <td><!-- 이메일 체크 메시지 출력 -->
	        <font id="checkEmail" size ="2"></font>
	   </td>
	</tr>
	<tr>
	    <td><!-- 회원가입 버튼 -->
	         <input type="submit" id="joinBtn" name="join_Btn" class="btn" value="가입하기"> 
	   </td>
	</tr>	
 </table>     
 </form>
 </div>
 </body>
</html>
