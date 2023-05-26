<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 ID 찾기</title>
</head>

<body>
<style>
.btn-outline-dccc{
	color:black;
	font-weight:700;
}

.btn-outline-dccc:hover{
	color:var(--sig-color);
	font-weight:900;
}

.footer-bg{
	background-color:var(--sig-color);
	margin-bottom: -15px;
}

.font-black{
	color:black;
}

.font-black:hover{
	color:inherit;
}
.font-dccc{
	color:var(--sig-color);
}
.font-dccc:hover{
	color:var(--sig-color);
	font-weight: bold;
}
.sub-footer{
	margin-top:0.5px;
}
.sub-footer-content{
	padding:0 1rem;
	color:#869099;
}

.main-content-header{
	background-color:#dfdfdf;
	height:2rem;
	line-height:2rem;
}

.aside-naming{
	border-bottom:1px solid black;
	margin-bottom:5px;
	font-size: 1.2rem;
    font-weight: bold;
}

.login-header{
	display:flex;
	margin:0 auto;
  	width:auto;
  	max-width:var(--wrap-max-width);
}

.grow-1{
	flex-grow:1;
}
.w-5rem{
	width:5rem;
}

.btn-white{
	color:white;
}
.btn-white:hover{
	color:#6c757d;
}
.btn-dccc{
	background-color:var(--sig-color);
	color:white;
}
.btn-original:hover{
	background-color:var(--sig-color);
	color:white;
}
.wrap-m-w{
	max-width:var(--wrap-max-width);
}

.user-admin-select-box{
	width: 100%;
    margin-bottom: 10px;
}

.m-50-a-50-a{
	margin: 50px auto 50px auto;
}
.border-dccc-opacity{
	border:1px solid rgba(169, 210, 180, 0.3);
}
.main-center-content-main{
	font-weight: bolder;
}
.login-header-font{
	color:var(--sig-color);
	font-weight: bolder;
	font-size: 1.5rem;
}
.width-500{
	width:500px;
}
.r-0{
	right:35px;
	top:25px;
}
.t-32-r-0{
	top:21px;
	right:45px;
}

.c-red{
	color:red;
	font-weight: bold;
}
.c-dccc{
	color:var(--sig-color);
	font-weight: bold;
}
.ml-minus-40{
	margin-left:-40px;
}
.p-1_25{
	padding: 0 1.25rem;
}
.aside_menu{
	padding-left:0;
}
.aside_menu>div,.aside_menu>button{
	width:calc(100% - 1.25rem);
}
.admin_mode{
	color: white;
    line-height: 37px;
    width: 240px;
    text-align: center;
    font-weight: bolder;
}
body{
	background-image: url(/resources/images/background.png);
	background-size:cover;
	font-size:13px;
}

login-1 {
	color:white;
}
a{
	text-decoration:none;
	color:#01A9DB;
	font-size:12px;
}
.btn_1{
	background:#585858;
	color:#fff;
	border-radius:5px;
	height:30px;
	border:none;
}
.btn_1:hover{
	background:#6E6E6E;
	border:none;
}
.form-group{
	margin-bottom:5px;
}
</style>


<div style="margin-left:20px;">
	<span style="font-size:50px; font-weight:bold; color:white;">ERS</span>
	<span style="font-size:25px; font-weight:bold; color:white;">응급안전안심서비스</span>
</div>


  <div class="hero-content flex-col lg:flex-row-reverse" style="width: 450px; margin:auto; display:flex; align-items:center; height:85vh;">
    <div class="">
      
        <div class="" style="background:#084B8A; height:80px; text-align:center;">
	    	<h2 class="login-1 item-center justify-center card-title" style="color:white; line-height:100px;">비밀번호 재설정</h2>
	  	</div>
	  <div class="" style="background:#fff; width:450px; height:400px; border-radius: 0px 0px 20px 20px; padding-top:50px;"> 	
		
		<form id="managerResetPw" action="doresetpw" method="post" style="margin-left:20px;" novalidate="novalidate">
	      	<!-- password -->
			<div class="form-group">
			<label for="inputPassword">비밀번호</label>
			<input type="password" name="pwd" class="form-control" id="inputPassword" placeholder="비밀번호를 8자 이상 20자 이하로 입력해주세요" maxlength="20" onchange="javascript:pw_length_check()" data-name="비밀번호" style="width:300px; font-size:13px;">
			<input type="hidden" name="manid" value="${param.id}" />
			<span id="inputPassword-error" class="error invalid-feedback">비밀번호를 8자 이상 20자 이하로 입력해주세요!</span>
			</div>
		</form>
											
					<!-- password check -->
			<div class="form-group">
			<label for="inputPasswordCK">비밀번호 확인</label>
			<input type="password" name="pwdCK" class="form-control" id="inputPasswordCK" placeholder="비밀번호를 다시 입력해주세요" maxlength="20" onchange="javascript:pw_check()" data-name="비밀번호 확인" style="width:300px; font-size:13px;">
			<span id="inputPasswordCK-error" class="error invalid-feedback">비밀번호가 일치하지 않습니다!</span>
			</div>
	      <div style="text-align:center; margin-top:40px;">
	      		<button style="height:40px; background:#585858; border-radius:5px; border:0; cursor:pointer; background:#F2F2F2; border:1px solid #848484;">뒤로가기</button>
				<button style="height:40px; background:#585858; border-radius:5px; border:0; color:white; cursor:pointer; background:#084B8A;" onclick="reset_go();" >변경하기</button>
	      </div>
    </div>

    </div>
  </div>
  
  
<script>
checkedID = "";
nowEmail = "";
checkEmail = "";
function isSame() {
	 
	 if(document.getElementById('pw').value!='' && document.getElementById('pwCheck').value!='') {
	        if(document.getElementById('pw').value==document.getElementById('pwCheck').value) {
	            document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
	            document.getElementById('same').style.color='blue';
	        }
	        else {
	            document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
	            document.getElementById('same').style.color='red';
	        }
	    }
	
}
function pw_length_check(){
	pw = $('input[name="pwd"]');
		
	if(pw.val().length < 8 || pw.val().length > 20){
		alert("비밀번호 길이를 확인해주세요!");
		pw.focus();
		pw.addClass('is-invalid');
	}else(pw.removeClass('is-invalid'));
}
	
function pw_check(){
	pw = $('input[name="pwd"]');
	pwCK = $('input[name="pwdCK"]');
		
	if(pwCK.val().length < 8 || pwCK.val().length > 20){
		alert("비밀번호 길이를 확인해주세요!");
		pwCK.focus();
		pwCK.addClass('is-invalid');
	}else(pwCK.removeClass('is-invalid'));
		
	if(pw.val() != pwCK.val()){
		alert("두 비밀번호가 일치하지 않습니다!");
		pwCK.val('');
		pwCK.focus();
		pwCK.addClass('is-invalid');
	}else{
		pwCK.removeClass('is-invalid');
	}
}

function reset_go(){
	if($('input[name="pwd"]').val() == ''){
		alert("새로운 비밀번호를 입력해주세요.");
		$('input[name="pwd"]').focus();
		return;
	}
	if($('input[name="pwdCK"]').val() == ''){
		alert("비밀번호 확인을 입력해주세요.");
		$('input[name="phone"]').focus();
		return;
	}
	isRight = true;
	$("form#managerResetPw").find("input.form-control").each(function(index, item){
	        
	if ($(this).val().trim() == '' && $(this).attr("name") != 'email_ck') {
	     alert($(this).attr("data-name")+"을 입력하세요!");
	     $(this).focus();
	     isRight = false;
	     return false;
		}
	});
	if (!isRight) {
	    return false;}
	
	$("form#managerResetPw").submit();
	}
</script>


</body>
</html>