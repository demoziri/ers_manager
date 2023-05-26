<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&display=swap');
@font-face {
    font-family: 'ChosunBg';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunBg.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}  
body{
	margin:0;
	padding:0;
	font-family: 'Nanum Gothic', sans-serif;
}
.logo{
	margin-left:30px;
	line-height:30px;
	color:white;
	font-size:25px;
	display:inline-block;
}
.nav{
	height:80px;
	background:#4191B3;	
}

.nav-name, .nav-log{
	display:inline-block;
	margin-right:0;
	margin-right:8px;
	margin-top:5px;
}
#current_date{
	font-size:40px;
	font-weight:bold;
	
}
#clock{
	margin-top:30px;
	font-size:75px;
	font-family:'ChosunBg';
}

.bt {
	width:250px;
	height:250px;
	display:inline-block;
	border-radius:50px;
	box-shadow:10px 10px 0px 0px gray;
	font-size:70px;
	text-align:center;
	font-family:'ChosunBg';
	border:0px;
}

.bt_119 {
	background:red;
	line-height:250px;
}
.bt_call {
	background:#04B431;
	display: flex;
    align-items: center;
    text-align:center;
    
}
.bt_p {
	margin-left:50px;
}

.bt_telephone{
	background:#045FB4;
	display: flex;
    align-items: center;
    text-align:center;
}
.info {
	width:500px;
	height:200px;
	background:red;
	border-radius:20px;
	margin-top:30px;
	text-align:center;
	padding-top:5px;
}

.info_box1{
	height:150px;
	background:#045FB4;
}
.info_box2{
	background:#084B8A;
}
h2 {
	color:white;
	font-size:20px;
}
h3 {
	color:white;
	display:inline-block;
	font-size:15px;
}
h4 {
	color:white;
	font-size:15px;
	text-align:left;
	margin-left:20px;
	
}

.sen_div {
	display:flex;
	justify-content:space-around;
	margin-top:30px;
	
}

.bt_sen {
	width:115px;
	height:115px;
	border-radius:15px;
	display: flex;
    align-items: center;
    text-align:center;
    font-size:25px;
    font-family:'ChosunBg';
    border:1px solid #BDBDBD;
}

.bt_sen1{
	background:#FF0000;
}
	
.bt_sen2{
	background:#FF8000;
}
.bt_sen3{
	background:#FFFF00;
}


#modal_119{
  display:none;
  position:relative;
  width:100%;
  height:100%;
  z-index:1;
}

#modal_119 h2 {
  margin:0;   
}

#modal_119 button {
  display:inline-block;
  width:100px;
  margin-left:calc(100% - 100px - 10px);
}

#modal_119 .modal_content {
  width:70%;
  height:500px;
  margin:0 auto;
  padding:5px 5px;
  background:#fff;
  border:2px solid #666;
  border-radius:50px;
}

.modal_red{
	background:red; 
	width:100%; 
	height:100px; 
	margin:auto; 
	margin-top:0px; 
	border-radius:45px 45px 0px 0px;
	position:relative;
}

.modal_blue {
	background:#3759AF; 
	width:100%; 
	height:100px; 
	margin:auto; 
	margin-top:0px; 
	border-radius:45px 45px 0px 0px;
	position:relative;
}

#modal_119 .modal_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
} 

#modal_call{
  display:none;
  position:relative;
  width:100%;
  height:100%;
  z-index:1;
}

#modal_call h2 {
  margin:0;   
}

#modal_call button {
  display:inline-block;
  width:100px;
  margin-left:calc(100% - 100px - 10px);
}

#modal_call .modal_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
}

#modal_telephone{
  display:none;
  position:relative;
  width:100%;
  height:100%;
  z-index:1;
}

#modal_telephone h2 {
  margin:0;   
}

#modal_telephone button {
  display:inline-block;
  width:100px;
  margin-left:calc(100% - 100px - 10px);
}

#modal_telephone .modal_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
}

.bt_cancle {
	background:#424242;
	width:200px;
	height:70px;
	font-size:40px;
	color:white;	
	font-family:'ChosunBg';
	border-radius:15px;
	position:absolute;
	right:250px;
	bottom:20px;
	
}
.content{
  width:70%;
  height:500px;
  margin:0 auto;
  padding:5px 5px;
  background:#fff;
  border:0px;
  border-radius:50px;
}
</style>

<div class="nav" style="position:relative;">
	<div style="text-align:right;" >
		<div class="nav-name">김보건 님</div>
		<div class="nav-log">로그아웃</div>
	</div>
	<div class="logo">응급안심안전서비스</div>
</div>
    			
	<div style="width:900px; text-align:center; display:inline-block; position:absolute; top:120px; left:50px;">
		<div id="current_date"></div>
		<h1 id="clock"></h1>
   		<script src="clock.js"></script>
		
		<div style="display:flex; justify-content:space-around; margin-top:60px;"> 
			<button class="bt bt_119" type="button" id="modal_open_btn_119">119</button>
			<button class="bt bt_call" type="button" id="modal_open_btn_call"><p class="bt_p">응 급<br>호 출</p></button>
			<button class="bt bt_telephone" type="button" id="modal_open_btn_telephone"><p class="bt_p">전 화<br>연 결</p></button>
		</div>
	</div>
	
	<div style="display:inline-block; width:500px; margin-left:50px;position:absolute;right:50px;">
		<div class="info info_box1">
			<h2>센서 수신 정보</h2>
			<h3>활동량감지센서 : 수신 &ensp;</h3><h3>화재감지센서 : 수신&ensp;</h3> <h3>출입문감지센서 : 수신</h3>
		</div>
		<div class="info info_box2">
			<h2>센서 감지 정보</h2>
			<h4>활동량감지센서 : 활동중 / 오후 6 : 17 </h4>
			<h4>화재감지센서 : 미감지 / - </h4>
			<h4>출입문감지센서 : 외출 / 오후 6 : 17 </h4>
		</div>
		<div class="sen_div">
			<div class="bt_sen1 bt_sen">
				<p style="margin-left:30px;">화 재<br>감 지</p>
			</div>
			<div class="bt_sen2 bt_sen">
				<p style="margin-left:25px;">활동량<br>감 지</p>
			</div>
			<div class="bt_sen3 bt_sen">
				<p style="margin-left:25px;">출입문<br>감 지</p>
			</div>
		</div>
	</div>

	<div id="modal_119">
   
    	<div class="modal_content content">
    		<div class="modal_red">
    			<img src="/resources/images/viber.png" style="width:80px; height:80px; margin-left:25px; margin-top:10px;"/>
    			<h1 style="display:inline-block; position:absolute; top:5px; left:115px; font-size:40px; font-family:'ChosunBg';">119 전화 연결</h1>
    		</div>
       		<div style="text-align:center; margin-top:20px;">
				<img src="/resources/images/telephone-call.png" style="width:170px; height:170px;"/>
				<p style="font-size:35px; font-family:'ChosunBg';">연결 중 ...</p>
       		</div>
       		<img src="/resources/images/ambulance.png" style="width:130px; height:110px; margin-left:20px;"/>
       		<button type="button" id="modal_close_btn_119" class="bt_cancle">취 소</button>
    	   
    	   
   		 </div>
   	
    	<div class="modal_layer"></div>
	</div>
	

	<div id="modal_call">
   
    	<div class="modal_content content">
			<div class="modal_red">

    			<img src="/resources/images/danger.png" style="width:80px; height:80px; margin-left:25px; margin-top:10px;"/>
    			<h1 style="display:inline-block; position:absolute; top:5px; left:115px; font-size:40px; font-family:'ChosunBg';">응급 호출 감지</h1>
    		</div>
       		<div style="margin-left:100px; margin-top:90px; position:relative;">
	       	    <p style="font-size:35px; font-weight:bold;">10초 후, 응급요원이 출동하오니</p>
	        	<p style="font-size:28px;">실제상황이 아니라면 취소버튼을 눌러주세요.</p>
	       		<p style="font-size:28px;">10초 내에 취소버튼을 누르면 응급요원이 출동하지 않습니다.</p>
       		</div>
       		
       		<img src="/resources/images/ambulance.png" style="width:130px; height:110px; margin-left:20px;"/>
       		<button type="button" id="modal_close_btn_call" class="bt_cancle">취 소</button>
    	   
    	   
   		 </div>
   	
    	   
    	   <div class="modal_layer"></div>
   	 </div>
    	   
   		
    	<div class="modal_layer"></div>

	<div id="modal_telephone">
   
    	<div class="modal_content content">
    		<div class="modal_blue">
    			<img src="/resources/images/viber.png" style="width:80px; height:80px; margin-left:25px; margin-top:10px;"/>
    			<h1 style="display:inline-block; position:absolute; top:5px; left:115px; font-size:40px; font-family:'ChosunBg';">전화 연결</h1>
    		</div>
       		<div style="text-align:center; margin-top:20px;">
				<img src="/resources/images/telephone.png" style="width:150px; height:150px;"/>
				<p style="font-size:35px; font-family:'ChosunBg';">연결 중 ...</p>
       		</div>
       		
       		<img src="/resources/images/user.png" style="width:110px; height:110px; margin-left:20px; margin-bottom:30px;"/>
       		<button type="button" id="modal_close_btn_telephone" class="bt_cancle"> 취 소 </button>
    	   
    	   
   		 </div>
   	
    	<div class="modal_layer"></div>
	</div>
	
	
	

<script>

date = new Date();
month = date.getMonth() + 1;
day = date.getDate();


clock = document.querySelector("#clock")

function getClock() {
    date = new Date();
    hours = String(date.getHours()).padStart(2, "0");
    minutes = String(date.getMinutes()).padStart(2, "0");
    
    clock.innerText = hours + ":" + minutes;
}

setInterval(getClock, 1000);

weekday = new Array(7);
weekday[0] = "일요일";
weekday[1] = "월요일";
weekday[2] = "화요일";
weekday[3] = "수요일";
weekday[4] = "목요일";
weekday[5] = "금요일";
weekday[6] = "토요일";

wd = weekday[date.getDay()];

document.getElementById("current_date").innerHTML = month + "월 " + day + "일 " + wd;



body = document.querySelector('body');
modal = document.querySelector('.modal_119');
btnOpenPopup = document.querySelector('.btn-open-popup');


document.getElementById("modal_open_btn_119").onclick = function() {
    document.getElementById("modal_119").style.display="block";
}

document.getElementById("modal_close_btn_119").onclick = function() {
    document.getElementById("modal_119").style.display="none";
}

document.getElementById("modal_open_btn_call").onclick = function() {
    document.getElementById("modal_call").style.display="block";
}

document.getElementById("modal_close_btn_call").onclick = function() {
    document.getElementById("modal_call").style.display="none";
}

document.getElementById("modal_open_btn_telephone").onclick = function() {
    document.getElementById("modal_telephone").style.display="block";
}

document.getElementById("modal_close_btn_telephone").onclick = function() {
    document.getElementById("modal_telephone").style.display="none";
}





</script>
</body>
</html>