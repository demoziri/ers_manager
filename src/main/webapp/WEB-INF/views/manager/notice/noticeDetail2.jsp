<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../common/head.jspf" %>


<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${pageTitle}</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
  <!-- 제이쿼리 불러오기 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <!-- 제이쿼리 불러오기 -->
 
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<body class="total">

  <div class="wrap">
    <section class="notice">
      <div class="page-title">
        <div class="container">
          <h3>공지사항 상세보기</h3>
        </div>
      </div>

      <!-- board seach area -->

      <!-- board list area -->
      <div id="board-list">
        <div class="container">
          <table class="board-table">

            <tbody>
              <tr>
                <td class="tad-title">제목</td>

                <th class="tah-title" >${noticeDetail.title}</<th>
              </tr>

              <tr>
                <td class="tad-attach">첨부파일</td>
                <th class="tah-attach">응급안전안심서비스 교육내용 가이드 ppt &nbsp;&nbsp;<button class="files-attacher">첨부하기</button></th>
              </tr>
              <tr>
                <td class="tad-content"></td>

                <th class="tah-content"><textarea class="context">${noticeDetail.content}
                  </textarea></th>
              </tr>

            </tbody>

          </table>
          <br />
          <br />
          <br />
          <br />

        </div>
      </div>

    </section>
  </div>
  <div class="wrap">
  
    <div class="buttonposition">
     <section class="buttonarrangement">
      <button class="lists" type="button" id="list" onclick="location.href='list'"><img class="listsicon" src="https://w7.pngwing.com/pngs/656/462/png-transparent-computer-icons-font-awesome-list-icon-angle-text-rectangle-thumbnail.png"></button>
      
      <button class="insert" type="button" id="confirm"></button> <a href="../notice/noticeModifyForm" type="button" >수정하기</a></button>
      
      </div>
    </section>
</div>
    <section class="modal modal-section type-confirm">
    
      <div class="enroll_box">
        <div class="modal-headers">
        

          <img class="question-logo" src="https://cdn-icons-png.flaticon.com/256/8021/8021759.png">

        </div>
        <p class="menu_msg">

        </p>
      </div>
      <div class="enroll_btn">
        <button class="btn blue_btn btn_ok">확인</button>
        <button class="btn gray_btn modal_close">취소</button>
      </div>
    </section>

    <section class="modal modal-section type-alert">
      <div class="modal-headers">

        <img class="question-logo" src="https://cdn-icons-png.flaticon.com/256/8021/8021759.png">

      </div>
      <div class="enroll_box">
        <p class="menu_msg">
        </p>
      </div>
      <div class="enroll_btn">
        <button class="btn blue_btn modal_close">확인</button>

      </div>
</body>
<style>
table {
  border-collapse: collapse;
  border-spacing: 0; 
 
  
  
  
}

tr{
  border: solid gray 1.7px;
}

.tah-contextarea{
  margin:0 auto;
  
  
}

.tad-title{
  font-size:19px;
  background-color:rgb(40,40,40,0.15);
  border: solid gray 1.7px;
  width:150px;
  height:70px;
  
}

.tad-attach{
  font-size:19px;
  background-color:#dfdfdf;
  height:40px;
 border: solid gray 1.7px;
  
}

.tad-content{
  font-size:19px;
  background-color:#dfdfdf;
  border: solid gray 1.7px;
  
}

.tah-title{
  font-size:17px;
   border: solid gray 1.7px;
}

.tah-attach{
  font-size:12px;
  border: solid gray 1.7px;
  text-decoration-style: soild black 2px;
  text-decoration:underline;
  
}

.contexts{
  width:350px 350px;
  font-size:36px;
  

}


section.notice {
  padding: 40px ;
  border: solid gray 1.6px;
  
}

.page-title {
  margin-bottom: 60px;
  
}
.page-title h3 {
  font-size: 30px;
  color: #333333;
  font-weight: 300;
  text-align: left;
  text-decoration:underline;
  
}
.listsicon{
  
 
  height:40px;
  border: solid white 1px;
  cursor: pointer;
 

  width:23px;
  height:23px;
  cursor: pointer;
  background-color:rgb(255,255,10,5);
  
 

 
  
 
}
#board-search .search-window {
  padding: 25px 0;
  background-color: #f9f7f9;
  
}

#board-search .search-window .search-wrap {
  position: relative;
/*   padding-right: 124px; */
  margin: 0 auto;
  width: 80%;
  max-width: 564px;
}
#board-search .search-window .search-wrap input {
  height: 40px;
  width: 100%;
  font-size: 12px;
  padding: 7px 14px;
  border: 1px solid #ccc;
}
#board-search .search-window .search-wrap input:focus {
  border-color: #333;
  outline: 0;
  border-width: 1px;
}
#board-search .search-window .search-wrap .btn {
  position: absolute;
  right: 0;
  top: 0;
  bottom: 0;
  width: 108px;
  padding: 0;
  font-size: 16px;
}

.board-table {
  font-size: 13px;
  width: 100%;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}

.board-table a {
  color: #333;
  display: inline-block;
  line-height: 1.4;
  word-break: break-all;
  vertical-align: middle;
}
.board-table a:hover {
  text-decoration: underline;
}
.board-table th {
  text-align: center;
  border: solid gray 1.7px;
}

.board-table .th-num {
  width: 100px;
  text-align: center;
}

.board-table .th-date {
  width: 200px;
}

.board-table th, .board-table td {
  padding: 12px 0;
}

.board-table tbody td {
  border-top: 1px solid #e7e7e7;
  text-align: center;
}

.board-table tbody th {
  padding-left: 35px;
  padding-right: 10px;
  border-top: 1px solid #e7e7e7;
  text-align: left;
}

.board-table tbody th p{
  display: none;
}

.btn {
  display: inline-block;
  padding: 0 50px;
  font-size: 15px;
  font-weight: 400;
  background: transparent;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
  touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  border: 1px solid transparent;
  text-transform: uppercase;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -ms-transition: all 0.3s;
  -o-transition: all 0.3s;
  transition: all 0.3s;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

/* reset */

* {
  list-style: none;
  text-decoration: none;
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}
.clearfix:after {
  content: '';
  display: block;
  clear: both;
}
.container {
  width: 950px;
  margin: 0 auto;
  white-space: nowrap;
  position:relative;
  
  
}
.blind {
  position: absolute;
  overflow: hidden;
  clip: rect(0 0 0 0);
  margin: -1px;
  width: 1px;
  height: 1px;
}
.attacher{
  background-color:rgb(30,144,255,0.3);
  border: solid 1px;
 
  
}
textarea {
	height: 370px;
	padding: 370px;
    box-sizing: border-box;
    border: solid 2px 1E90FF;
	border-radius: 5px;
    font-size: 18px;
    resize: both;
    font-weight:bold;
    border: solid gray 0.01px;
    color:#e3d5d4;
 
     
  
    
		}

* {
  padding: 0;
  margin: 0;
}
body,
html {
  height: 100%;
  
}
.insert{
  background-color:rgb(30,144,255,5);
  border: black solid 0px ;
  color:white;
  width:160px;
  height:45px;
  border-radius:10px;
  cursor: pointer;
  font-weight:bolder;
  font-size:17px;
  margin:50px 7px;
  margin-left:680px;


}

.cancel{
  background-color:rgb(255,70,80,5);
  border: black solid 0px ;
  color:white;
  width:120px;
  height:45px;
  border-radius:10px;
  cursor: pointer;
  font-weight:bolder;
  font-size:17px;
  margin:50px 5px;
  float:right;
 
}
.modal .btn {
  cursor: pointer;
  border: 2px solid #999999;
  text-align: center;
  border-radius: 9px;
  outline: none;
  font-weight: 950;
  
}
.dimLayer {
  display: block;
  width: 100%;
  background-color: rgba(0, 0, 0, 0.3);
  position: fixed;
  left: 0;
  top: 0;
  margin: 0;
  padding: 0;
  z-index: 9998;
}
.modal {
  width: 300px;
  height: 257px;
  padding: 80px 30px;
  box-sizing: border-box;
  text-align: center;
}
.modal-section {
  width:460px;
  background: #f7f3f4;
  box-sizing: border-box;
  display: none;
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  -moz-transform: translate(-50%, -50%);
  -o-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
  display: none;
  z-index: 9999;
}
.menu_msg {
  font-size: 25px;
  font-weight:bold;
  font-weight: 700;

  
}
.enroll_box p {
  padding-bottom: 40px;
}
.gray_btn {
  width: 150px;
  background:#808080;
  color: white;
  height: 35px;
  line-height: 39px;
  transition: 0.2s;
  font-size: 23px;
  font-weight:bolder;
  margin:0 6px;
  text-align:center;
  
  
}
.blue_btn {
  width: 150px;
  background-color:rgb(30,144,255,5);
  color: #fff;
  height: 35px;
  line-height: 39px;
  transition: 0.2s;
  font-size: 23px;
  border: none;
  border-radius: 11px;
  margin:0 6px;
  text-align:right;
 
  
}
.modal modal-section type-alert{
}
.modal-headers{
  width:250px;
  height:45px;
  background-color:#FFA500;
  border: solid black 2px;
  width:462px;
  position:relative;
  text-align:center;
  border: black solid 1.5px;
  margin-left:-30px;  
  position:absolute;
  margin:-80px -32px;
  
}
.question-logo{
  width:45px;
  height:45px;
  position:absolute;
  margin:0px -25px;
}

.buttonarrangement{
  margin-top:-150px;
  margin-right:300px;
}

.buttonposition{
  
  margin-top:40px;
  text-align:right;
  margin-left:-500px;
 
  
}

.contexts{
  padding:280px;
 
}
.lists{
background-color:rgb(0,0,0,5);
}














  @font-face {
    font-family: 'YiSunShinDotumM';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/YiSunShinDotumM.woff') format('woff');
    font-weight: normal;
    font-style: normal;
  }

  html>body,
  html>body .toastui-editor-contents,
  html>body .ProseMirror,
  html>body .toastui-editor-md-code,
  html>body .toastui-editor-md-code-block {
    font-family: 'YiSunShinDotumM';
    text-underline-position: under;
  }

  .menu>li>a:hover {
    font-weight: bold;
  }

  .menu>li>a {
    font-size: 1.2rem;
  }

  .table th {
    background-color: #D7D7D7;
    width: 100px;
    text-align: center;
    padding: 5px;
  }

  .table td {
    text-align: center;
  }
  
  .modal-table>thead>tr>.th-1{
  	width:30px;
  }
  .modal-table>thead>tr>.th-2{
  	width:30px;
  }
</style>





<script>
$(function () {
	  $(document).on("click", "#confirm", function () {
	    action_popup.confirm("게시글수정으로 이동하시겠습니까?", function (res) {
	      if (res) {
	        action_popup.alert("작업이 완료되었습니다.");
	      }
	    });
	  });

	  $(document).on("click", "#alert", function () {
	    action_popup.alert("작업을 삭제하시겠습니까?");
	  });

	  $(".modal_close").on("click", function () {
	    action_popup.close(this);
	  });
	});

	var action_popup = {
	  timer: 350,
	  confirm: function (txt, callback) {
	    if (txt == null || txt.trim() == "") {
	      console.warn("confirm message is empty.");
	      return;
	    } else if (callback == null || typeof callback != "function") {
	      console.warn("callback is null or not function.");
	      return;
	    } else {
	      $(".type-confirm .btn_ok").on("click", function () {
	        $(this).unbind("click");
	        callback(true);
	        action_popup.close(this);
	      });
	      this.open("type-confirm", txt);
	    }
	  },

	  alert: function (txt) {
	    if (txt == null || txt.trim() == "") {
	      console.warn("confirm message is empty.");
	      return;
	    } else {
	      this.open("type-alert", txt);
	    }
	  },

	  open: function (type, txt) {
	    var popup = $("." + type);
	    popup.find(".menu_msg").text(txt);
	    $("body").append("<div class='dimLayer'></div>");
	    $(".dimLayer").css("height", $(document).height()).attr("target", type);
	    popup.fadeIn(this.timer);
	  },

	  close: function (target) {
	    var modal = $(target).closest(".modal-section");
	    var dimLayer;
	    if (modal.hasClass("type-confirm")) {
	      dimLayer = $(".dimLayer[target=type-confirm]");
	      $(".type-confirm .btn_ok").unbind("click");
	    } else if (modal.hasClass("type-alert")) {
	      dimLayer = $(".dimLayer[target=type-alert]");
	    } else {
	      console.warn("close unknown target.");
	      return;
	    }
	    modal.fadeOut(this.timer);
	    setTimeout(function () {
	      dimLayer != null ? dimLayer.remove() : "";
	    }, this.timer);
	  }
	};

</script>
<%@include file="../common/foot.jspf" %>
</html>