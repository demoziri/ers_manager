<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 ID 찾기</title>
</head>

<body>
<style>
body{
	background-image: url(/resources/images/background.png);
	background-size:cover;
}

login-1 {
	color:white;
}
a{
	text-decoration:none;
	color:#01A9DB;
	font-size:12px;
}
button{

}
</style>


<div style="margin-left:20px;">
	<span style="font-size:50px; font-weight:bold; color:white;">ERS</span>
	<span style="font-size:25px; font-weight:bold; color:white;">응급안전안심서비스</span>
</div>


  <div class="hero-content flex-col lg:flex-row-reverse" style="width: 450px; margin:auto; display:flex; align-items:center; height:85vh;">
    <div class="">
      
        <div class="" style="background:#084B8A; height:80px; text-align:center;">
	    	<h2 class="login-1 item-center justify-center card-title" style="color:white; line-height:100px;">아이디 찾기</h2>
	  	</div>
	  	
      <div class="" style="background:#fff; width:450px; height:150px; border-radius: 0px 0px 20px 20px; padding-top:50px;">
        <div class="form-control" style="text-align:center; height:50px;">
        	<c:if test="${not empty param.id}">
       	  		<div style=" line-height:50px;">아이디는 ${param.id}입니다.</div>
       	  	</c:if>
       	  	<c:if test="${empty param.id}">
       	  		<div style=" line-height:50px;">정보에 맞는 아이디가 존재하지 않습니다.</div>
       	  	</c:if>
        </div>
        
      
      <div style="text-align:center; margin-top:40px;">
      		<button style="height:40px; background:#585858; border-radius:5px; border:0; cursor:pointer; background:#F2F2F2; border:1px solid #848484;"onclick="history.back();">뒤로가기</button>
			<button style="height:40px; background:#585858; border-radius:5px; border:0; color:white; cursor:pointer; background:#084B8A;" onclick = "location.href = 'login' ">로그인하기</button>
      </div>
    </div>
    
    
  </div>
</div>




</body>
</html>