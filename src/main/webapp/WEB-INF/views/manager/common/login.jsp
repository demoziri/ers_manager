<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원로그인</title>
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
	    	<h2 class="login-1 item-center justify-center card-title" style="color:white; line-height:100px;">직원로그인</h2>
	  	</div>
	  
	  <form action="doLogin" method="post">
	      <div class="" style="background:#fff; width:450px; height:320px; border-radius: 0px 0px 20px 20px; padding-top:50px;">
	        <div class="form-control">
	       	  <div style="text-align:center; width:350px; margin:0 auto;">
		          <label class="label" style="margin-top:20px;">
		            <div class="label-text" style="text-align:left;">아이디</div>
		          </label>
		          <input name="id" type="text" placeholder="ID" class="input input-bordered" style="outline:none; border:1px solid #BDBDBD; border-radius:10px; height:40px; width:350px; "/>
	          </div>
	        </div>
	        
	        
	       
	        <div class="form-control">
	        	<div style="text-align:center; width:350px; margin:0 auto;">
		          <label class="label">
		            <div class="label-text" style="text-align:left; margin-top:20px;">비밀번호</div>
				  </label>
		          <input name="pwd" type="password" placeholder="password" class="input input-bordered" style="outline:none;border:1px solid #BDBDBD; border-radius:10px; height:40px; width:350px;"/>
	   	
	          	<br>
	          <div style="text-align:left;">
	            <a href="/ers/manager/join" class="mt-2 label-text-alt link link-info link-hover" style="">회원가입</a><br/>
	            <a href="/ers/manager/findid" class="mt-1 label-text-alt link link-info link-hover" style="">아이디찾기</a><br/>
	            <a href="/ers/manager/findpw" class="mt-1 label-text-alt link link-info link-hover" style="">비밀번호찾기</a>
	        	</div>
	        </div>
        
        <div class="form-control mt-1" style="text-align:center; margin:10px 10px 0 0;">
          <button type="submit"class="btn bg-amber-500" style="margin:auto; width:350px; background:#FE9A2E; border:1px solid black; height:50px; border-radius:10px; color:white; font-size:16px; font-weight:bold;">로그인</button>
        </div>
        </form>
      </div>
    </div>
  </div>
</div>


<script>

if (${param.error} == 1){
	alert("아이디가 일치하지 않습니다.")
	location.href = "login";
}else if(${param.error} == 2){
	alert("비밀번호가 일치하지 않습니다.")
	location.href = "login";
}

</script>

</body>
</html>