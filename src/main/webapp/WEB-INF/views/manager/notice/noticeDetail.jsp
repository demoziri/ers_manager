<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../common/head.jspf" %>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${pageTitle}</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 제이쿼리 불러오기 -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />
<script type="text/javascript" src="cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 제이쿼리 불러오기 -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>


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

												<tbody class="tabletype">
												
														<tr>
														
																<td class="tad-context-nno">번호</td>

																<th class="tah-context-nno">${noticeWrite.nno}</th>

																<td class="tad-context-regDate">등록일자</td>

																<th class="tah-context-regDate">${noticeWrite.regDate}</th>
																
														</tr>
														<tr>
														</tr>



														 
														 
																<td class="tad-context-title">제목</td>

																<th class="tah-context-title">${noticeWrite.title}</th>

																	
														 

												

										
														  <tr>
																<td class="tad-context-name">작성자</td>

																<th class="tah-context-name">${noticeWrite.name}</th>
														  </tr>
											

										
															<tr>		

														  
																<td class="tad-content">내용</td>

																<th class="tah-content">내용을 입력해주세요!</th>

														    </tr>
												

										
												
														<tr>
																<td class="tad-context-attach">첨부파일</td>

																<th class="tah-context-attach"><input type="file" class="attachfiles"></th>
														</tr>

												</tbody>

										</table>
								</div>
						</div>

				</section>
		</div>
		<div class="wrap">
				<section>
						<button class="update" type="button" id="confirm">수정</button>
						<button class="cancel" type="button" id="alert">삭제</button>
				</section>

				<section class="modal modal-section type-confirm">
						<div class="enroll_box">
								<div class="modal-headers">

										<img class="question-logo" src="https://cdn-icons-png.flaticon.com/256/8021/8021759.png">

								</div>
								<p class="menu_msg"></p>
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
								<p class="menu_msg"></p>
						</div>
						<div class="enroll_btn">
								<button class="btn blue_btn modal_close">확인</button>

						</div>

				</section>
</body>
<style>
table {
	border-collapse: collapse;
	border-spacing: 0;
	padding: 84px;
}

tr {
	border: solid gray 1.7px;
}

.tad-title {
	font-size: 19px;
	background-color: rgb(40, 40, 40, 0.15);
	border: solid gray 1.7px;
	width: 122px;
	height: 75px;
}

.tad-attach {
	font-size: 19px;
	background-color: #dfdfdf;
	height: 40px;
	border: solid gray 1.7px;
}

.tad-content {
	font-size: 23px;
	background-color: #dfdfdf;
	height: 345px;
	border: solid gray 1.7px;
	width: 122px;
	text-ailgn: center;
}

.tad-content {
	text-align: center;
}

.tah-title {
	font-size: 17px;
	border: solid gray 1.7px;
}

.tah-attach {
	font-size: 17px;
	border: solid gray 1.7px;
	text-decoration-style: soild black 2px;
	text-decoration: underline;
}

.contexts {
	width: 280px 280px;
	font-size: 36px;
}



.page-title {
	margin-bottom: 104px;
}

.page-title h3 {
	font-size: 30px;
	color: #333333;
	font-weight: 300;
	text-align: left;
	text-decoration: underline;
}

.listsicon {
	height: 40px;
	border: solid white 1px;
	cursor: pointer;
	width: 23px;
	height: 23px;
	cursor: pointer;
	background-color: rgb(255, 255, 10, 5);
}

#board-search .search-window {
	padding: 125px 0;
	background-color: #f9f7f9;
}

#board-search .search-window .search-wrap {
	position: relative;
	/*   padding-right: 124px; */
	margin: 0 auto;
	width: 80%;
	max-width: 564px;
}

#board-search .search-window .search-wrap {
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
	font-size: 16px;
}

.board-table {
	font-size: 14px;
	width: 100%;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.board-table2 {
	font-size: 14px;
	width: 55%;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.board-table3 {
	font-size: 17px;
	width: 30%;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	height: 50%;
}

.board-table a {
	color: #333;
	display: inline-block;
	line-height: 1.7;
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

.board-table tbody th p {
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
	white-space: nowrap;
	position: relative;
}

.blind {
	position: absolute;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	margin: -1px;
	width: 1px;
	height: 1px;
}

.attacher {
	background-color: rgb(30, 144, 255, 0.3);
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
	font-weight: bold;
	border: solid gray 0.01px;
	color: #e3d5d4;
}

* {
	padding: 0;
	margin: 0;
}

body, html {
	height: 100%;
}

.update {
	background-color: rgb(30, 144, 255, 5);
	border: black solid 0px;
	color: white;
	width: 100px;
	height: 50px;
	border-radius: 8px;
	cursor: pointer;
	font-weight: bolder;
	font-size: 1rem;
	margin-left: 1400px;
	padding: -480px;
}

.cancel {
	background-color: rgb(255, 70, 80, 5);
	border: black solid 0px;
	color: white;
	width: 100px;
	height: 50px;
	border-radius: 10px;
	cursor: pointer;
	font-weight: bolder;
	font-size: 1rem;
}

.modal .btn {
	cursor: pointer;
	border: 2px solid #999999;
	text-align: center;
	border-radius: 8px;
	outline: none;
	font-weight: 750;
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
	width: 460px;
	background: #ffffff;
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
	font-size: 23px;
	font-weight: 700;
}

.enroll_box p {
	padding-bottom: 40px;
}

.gray_btn {
	width: 140px;
	background: #808080;
	color: white;
	height: 45px;
	line-height: 37px;
	transition: 0.3s;
	font-size: 20px;
	font-weight: bolder;
	margin: 0 10px;
}

.blue_btn {
	width: 140px;
	background-color: rgb(30, 144, 255, 5);
	color: #fff;
	height: 45px;
	line-height: 37px;
	transition: 0.5s;
	font-size: 20px;
	border: none;
	border-radius: 11px;
	margin: 0 10px;
}

.modal modal-section type-alert {
	
}

.modal-headers {
	width: 250px;
	height: 45px;
	background-color: #FFA500;
	border: solid black 2px;
	width: 460px;
	position: relative;
	text-align: center;
	border: black solid 1.5px;
	margin-left: -30px;
	position: absolute;
	margin: -80px -32px;
}

.question-logo {
	width: 45px;
	height: 45px;
	position: absolute;
	margin: 0px -25px;
}

.buttonarrangement {
	margin-top: -150px;
	margin-right: 300px;
}

.buttonposition {
	margin-top: 40px;
	text-align: right;
	margin-left: -720px;
}

.contexts {
	padding: 84px;
}

.lists {
	background-color: rgb(0, 0, 0, 5);
}

.titles {
	border: 1px solid white;
	font-size: 14px;
}

.files-attacher {
	border: 1px solid white;
	width: 68px;
	height: 34px;
}

@font-face {
	font-family: 'YiSunShinDotumM';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/YiSunShinDotumM.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

html>body, html>body .toastui-editor-contents, html>body .ProseMirror,
	html>body .toastui-editor-md-code, html>body .toastui-editor-md-code-block
	{
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
	text-align: center;

}

.table td {
	text-align: center;
}

.modal-table>thead>tr>.th-1 {
	width: 32px;
}

.modal-table>thead>tr>.th-2 {
	width: 32px;
}

.tad-context-nno {
	font-size: 19px;
	background-color: rgb(40, 40, 40, 0.15);
	border: solid gray 1.7px;
	width: 100px;
	height: 95px;
}

.tad-context-viewcount {
	font-size: 19px;
	background-color: rgb(40, 40, 40, 0.15);
	border: solid gray 1.7px;
	width: 100px;
	height: 95px;
}

.tad-context-title {
	font-size: 19px;
	background-color: rgb(40, 40, 40, 0.15);
	border: solid gray 1.7px;
	width: 100px;
	height: 95px;
}

.tad-context-regDate {
	font-size: 19px;
	background-color: rgb(40, 40, 40, 0.15);
	border: solid gray 1.7px;
	width: 144px;
	height: 95px;
}

.tad-context-name {
	font-size: 19px;
	background-color: rgb(40, 40, 40, 0.15);
	border: solid gray 1.7px;
	width: 100px;
	height: 95px;
	text-align: center;
}

.tad-context-attach {
	font-size: 14px;
	background-color: rgb(40, 40, 40, 0.15);
	border: solid gray 1.7px;
	width: 100px;
	height: 95px;
	text-align: center;
}

.tad-context-content {
	font-size: 19px;
	background-color: rgb(40, 40, 40, 0.15);
	border: solid gray 1.7px;
	width: 100px;
	height: 95px;
}

.tabletype {
	padding: 17px;
	text-align: center;
}

.tah-context-regDate {
	width: 444px;
	height: 44px;
}










</style>



<script>
	$('#summernote').summernote(
			{
				placeholder : 'Hello stand alone ui',
				tabsize : 25,
				height : 614,
				toolbar : [ [ 'style', [ 'style' ] ],
						[ 'font', [ 'bold', 'underline', 'clear' ] ],
						[ 'color', [ 'color' ] ],
						[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
						[ 'table', [ 'table' ] ],
						[ 'insert', [ 'link', 'picture', 'video' ] ],
						[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ]
			});
</script>

<script>
	$(function() {
		$(document).on("click", "#confirm", function() {
			action_popup.confirm("게시글을 수정하시겠습니까?", function(res) {
				if (res) {
					action_popup.alert("게시글이 수정되었습니다.");
				}
			});
		});

		$(document).on("click", "#alert", function() {
			action_popup.alert("작업을 취소하시겠습니까?");
		});

		$(".modal_close").on("click", function() {
			action_popup.close(this);
		});
	});

	var action_popup = {
		timer : 500,
		confirm : function(txt, callback) {
			if (txt == null || txt.trim() == "") {
				console.warn("confirm message is empty.");
				return;
			} else if (callback == null || typeof callback != "function") {
				console.warn("callback is null or not function.");
				return;
			} else {
				$(".type-confirm .btn_ok").on("click", function() {
					$(this).unbind("click");
					callback(true);
					action_popup.close(this);
				});
				this.open("type-confirm", txt);
			}
		},

		alert : function(txt) {
			if (txt == null || txt.trim() == "") {
				console.warn("confirm message is empty.");
				return;
			} else {
				this.open("type-alert", txt);
			}
		},

		open : function(type, txt) {
			var popup = $("." + type);
			popup.find(".menu_msg").text(txt);
			$("body").append("<div class='dimLayer'></div>");
			$(".dimLayer").css("height", $(document).height()).attr("target",
					type);
			popup.fadeIn(this.timer);
		},

		close : function(target) {
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
			setTimeout(function() {
				dimLayer != null ? dimLayer.remove() : "";
			}, this.timer);
		}
	};
</script>
<%@include file="../common/foot.jspf" %>
</html>