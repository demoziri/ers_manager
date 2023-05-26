<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 회원가입</title>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title></title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
  <!-- 제이쿼리 불러오기 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
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
	top:22px;
	right:95px;
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


  <div class="hero-content flex-col lg:flex-row-reverse" style="width: 500px; margin:auto; display:flex; align-items:center; height:85vh;">
    <div class="">
      
        <div class="" style="background:#084B8A; height:80px; text-align:center;">
	    	<h2 class="login-1 item-center justify-center card-title" style="color:white; line-height:100px;">회원가입</h2>
	  	</div>
	  
	
	
	  	
      <div class="" style="background:#fff; width:500px; height:620px; border-radius: 0px 0px 20px 20px; padding-top:20px;">
			<form id="joinManager" novalidate="novalidate" action="dojoin" method="post" style="margin-left:20px;">
				<!-- id -->
				<div class="form-group position-relative">
				<label for="inputID">아이디</label><span class="position-absolute r-0 text-success d-none c-dccc" id="idCheck_OK">사용가능</span><span class="position-absolute r-0 d-none c-red" id="idCheck_NO">사용불가</span>
				<input type="text" name="manid" class="form-control form-in" id="inputID" placeholder="ID를 입력 후 중복 확인을 해 주세요" maxlength="20" onkeyPress="id_check_oneKey();" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, &#39;&#39;);" style="width:300px; font-size:13px;" data-name="ID">
				<button type="button" class="btn_1 btn-dccc btn-original position-absolute t-32-r-0" onclick="idCheck_go()">ID 중복확인</button>
				<span id="inputID-error" class="error invalid-feedback">아이디중복확인 해주세요!</span>
				</div>
				<!-- password -->
				<div class="form-group">
				<label for="inputPassword">비밀번호</label>
				<input type="password" name="pwd" class="form-control" id="inputPassword" placeholder="비밀번호를 8자 이상 20자 이하로 입력해주세요" maxlength="20" onchange="javascript:pw_length_check()" data-name="비밀번호" style="width:300px; font-size:13px;">
				<span id="inputPassword-error" class="error invalid-feedback">비밀번호를 8자 이상 20자 이하로 입력해주세요!</span>
				</div>
										
				<!-- password check -->
				<div class="form-group">
				<label for="inputPasswordCK">비밀번호 확인</label>
				<input type="password" name="pwdCK" class="form-control" id="inputPasswordCK" placeholder="비밀번호를 다시 입력해주세요" maxlength="20" onchange="javascript:pw_check()" data-name="비밀번호 확인" style="width:300px; font-size:13px;">
				<span id="inputPasswordCK-error" class="error invalid-feedback">비밀번호가 일치하지 않습니다!</span>
				</div>
										
				<!-- 이름 -->
				<div class="form-group">
				<label for="inputName">이름</label>
				<input type="text" name="name" class="form-control" id="inputName" placeholder="이름을 입력해주세요" maxlength="6" onchange="name_check()" data-name="성명" style="width:300px; font-size:13px;">
				<span id="inputName-error" class="error invalid-feedback">이름을 입력해주세요!</span>
				</div>
				
				<!-- 주소 -->
				<div class="form-group">
				<label for="inputName">주소</label>
				<input type="text" name="address" class="form-control" id="inputName" placeholder="주소을 입력해주세요" maxlength="50" onchange="address_check()" data-name="주소" style="width:300px; font-size:13px;">
				<span id="inputName-error" class="error invalid-feedback">주소를 입력해주세요!</span>
				</div>
										
				<!-- 생년월일 -->
				<div class="form-group">
				<label for="inputBirth">생년월일</label>
				<input type="text" name="birth" class="form-control" id="inputBirth" placeholder="생년월일을 6자리로 입력해주세요 ex)970101" maxlength="6" onchange="birth_check()" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, &#39;&#39;);" onkeyPress="javascript:CheckInputNum();" data-name="생년월일" style="width:300px; font-size:13px;">
				<span id="inputBirth-error" class="error invalid-feedback">생년월일을 6자리로 올바르게 입력해 주세요!</span>
				</div>
										
				<!-- PHONE -->
				<div class="form-group">
				<label for="inputPhone">전화번호</label>
				<input type="text" name="phone" class="form-control" id="inputPhone" placeholder="전화번호를 -제외하고 숫자만 입력해주세요 ex)01012345678" maxlength="11" onchange="phone_check()" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, &#39;&#39;);" onkeyPress="javascript:CheckInputNum();" data-name="전화번호" style="width:300px; font-size:13px;">
				<span id="inputPhone-error" class="error invalid-feedback">전화번호를 11자리로 입력해주세요!</span>
				</div>
										
				<!-- email -->
				<div class="form-group position-relative">
				<label for="inputEmail">이메일</label>
				<input type="email" name="email" class="form-control" id="inputEmail" placeholder="EMAIL을 입력해주세요 ex)abc123@naver.com" onchange="email_check()" data-name="이메일" style="width:300px; font-size:13px;">
				<button type="button" class="btn_1 btn-dccc btn-original position-absolute t-32-r-0" onclick="email_confirm()">EMAIL 확인</button>							
				<span id="inputEmail-error" class="error invalid-feedback" >이메일 형식에 맞게 입력해주세요!</span>
				</div>
										
				<div class="col-sm-6 p-0 ml-auto mb-4 d-none" id="divEmail">
					<input type="text" name="email_ck" placeholder="Email 인증번호 입력" class="d-inline-block form-control" style="width:150px; font-size:13px;">
					<button type="button" class="btn_1 btn-dccc btn-original d-inline-block" style=""onkeyPress="javascript:CheckInputNum();" onclick="email_number_check()">확인</button>
				</div>
										
				<div class="text-right mt-5" style="text-align:center;">
					<button type="button" class="btn bg-gradient-secondary"style="height:40px; background:#585858; border-radius:5px; border:0; cursor:pointer; background:#F2F2F2; border:1px solid #848484;" onclick="history.back();">뒤로가기</button>&nbsp;
					<button type="button" class="btn btn-dccc btn-original" onclick="join_go()" style="height:40px; background:#585858; border-radius:5px; border:0; color:white; cursor:pointer; background:#084B8A;">회원가입</button>
				</div>
			</form>
    
    
  </div>
</div>
</div>

<script>	
checkedID = "";
nowEmail = "";
checkEmail = "";
function id_check_oneKey(){
	if($('input[name="id"]').val()!= checkedID) {
		$('input[name="id"]').addClass('is-invalid');
		}
	}
	
function email_confirm(){
	/* email = $('input[name="email"]').va(); */
	email = $('input[name="email"]');
	if(!email.val().match('@')){
		alert("이메일를 올바르게 입력해주세요!");
		email.focus();
		email.addClass('is-invalid');
		return;
	}else{
		email.removeClass('is-invalid');
	}
		
	alert("인증번호가 발송되었습니다. mail을 확인해 주세요.");
	$('div#divEmail').removeClass('d-none');
	$.ajax({
		url:'sendMail',
		method:'get',
		data:'email='+email.val(),
		success:function(data){
			checkEmail = data.trim();
		},
		error:function(error){
			alert(error.status);
		}
	})
}
	
function idCheck_go(){
	id = $('input[name="manid"]');
		
	if(!id.val()){
		alert("아이디를 입력해주세요.");
		id.focus();
		return;
	}
		
	$.ajax({
		url:'idCheck',
		method:'get',
		async: false,
		data:"manid="+id.val().trim(),
		success:function(data){
			if(data == 1){
				alert("중복된 아이디입니다.");
				id.addClass('is-invalid');
				$('span#idCheck_OK').addClass('d-none');
				$('span#idCheck_NO').removeClass('d-none');
				checkedID="";
			}else{
				alert("사용가능한 아이디 입니다.");
				id.removeClass('is-invalid');
				$('span#idCheck_NO').addClass('d-none');
				$('span#idCheck_OK').removeClass('d-none');
				checkedID=id.val().trim();
				$('input[name="pwd"]').focus();
			}
		},
		error:function(error){
			alert(error.status);
		}
	})
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
	
function name_check(){
	name = $('input[name="name"]');
		
	if(!name.val() || name.val()==''){
		alert("이름을 입력해주세요!");
		name.focus();
		name.addClass('is-invalid');
	}else{
		name.removeClass('is-invalid');
	}
}
	
function birth_check(){
	birth = $('input[name="birth"]');
	if(birth.val().length != 6){
		alert("생년월일을 올바르게 입력해주세요!");
		birth.focus();
		birth.addClass('is-invalid');
	}else{
		birth.removeClass('is-invalid');
	}
}
function phone_check(){
	phone = $('input[name="phone"]');
	if(phone.val().length != 11){
		alert("전화번호를 올바르게 입력해주세요!");
		phone.focus();
		phone.addClass('is-invalid');
	}else{
		phone.removeClass('is-invalid');
	}
}

function address_check(){
	address = $('input[name="address"]');
	if(address.val().length < 5){
		alert("주소를 올바르게 입력해주세요!");
		address.focus();
		address.addClass('is-invalid');
	}else{
		address.removeClass('is-invalid');
	}
}
	
function email_check(){
	email = $('input[name="email"]');
	if(!email.val().match('@')){
		alert("이메일를 올바르게 입력해주세요!");
		email.focus();
		email.addClass('is-invalid');
	}else{
		email.removeClass('is-invalid');
	}
}

	
function email_number_check(){
	email_ck = $('input[name="email_ck"]');
	if(email_ck.val().trim() != checkEmail.trim()){
		alert("잘못된 인증번호 입니다.");
	}else{
		alert("인증에 성공하였습니다.");
		nowEmail = $('input[name="email"]').val();
	}
	
}
	
function join_go(){
	if($('input[name="manid"]').val()!=checkedID){
		alert("아이디는 중복 확인이 필요합니다.");
		$('input[name="manid"]').focus();
		return;
	}
	isRight = true;
	$("form#joinManager").find("input.form-control").each(function(index, item){
	        
	if ($(this).val().trim() == '' && $(this).attr("name") != 'email_ck') {
	     alert($(this).attr("data-name")+"을 입력하세요!");
	     $(this).focus();
	     isRight = false;
	     return false;
	}
	});
	if (!isRight) {
	    return false;}
	    
	email_check = $('input[name="email"]');
	if(nowEmail.trim() != email_check.val().trim()){
	    alert("이메일 인증이 필요합니다");
	    return;
	  }
	    
	    
	if('input[name="email_ck"]' != null ) {
		alert("회원가입이 완료되었습니다.");
		$("form#joinManager").submit();
	}
	}
	
	
</script>



</body>
