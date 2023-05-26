<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/head.jspf" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="nno" value="${notice.nno}" scope="page" />
<c:set var="title" value="${notice.title}" scope="page" />
<c:set var="content" value="${notice.content}" scope="page" />
<c:set var="regDate" value="${notice.regDate}" scope="page" />
<c:set var="updateDate" value="${notice.updateDate}" scope="page" />
<c:set var="manId" value="${notice.manId}" scope="page" />



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

</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>

		<section class="notice">
				<div class="page-title">
						<div class="container">
								<h3 class="titlename">공지사항 리스트</h3>
						</div>
				</div>

				<!-- board seach area -->
				<div id="board-search">
						<div class="container">
								<div class="search-window">
										<form action="">
												<div class="search-wrap">

														<div class="search_form">

																<input class="search-bar_input" type="search" placeholder="Search" /> <select name="language"
																		class="selectbox">
																		<option value="nno" class="lang-option">번호</option>
																		<option value="title" class="lang-option">제목</option>
																		<option value="content" class="lang-option">내용</option>
																</select>



														</div>

												</div>
										</form>
								</div>
						</div>
				</div>

				<!-- board list area -->
				<div id="board-list">
						<div class="container">
								<table class="board-table">



										<thead>
												<tr>
														<th scope="col" class="th-num" onclick="location.href='#'">번호</th>
														<th scope="col" class="th-title" onclick="location.href='#'">제목</th>
														<th scope="col" class="th-date" onclick="location.href='#'">등록일자</th>
														<th scope="col" class="th-date" onclick="location.href='#'">첨부파일</th>
												</tr>
										</thead>


										<tbody>
												<!-- Start Top Nav -->


												<!-- Close Top Nav -->

												<!-- Header -->


												<c:forEach items="${noticeList}" var="notice">
														<tr>
																<td class="click-button">${notice.nno}</td>
																<th class="click-button"><a href="../notice/detail?nno=${notice.nno}" value="${notice.nno}">${notice.title}</a></th>
																<td class="click-button"><fmt:formatDate value="${notice.regDate }" pattern="yyyy-MM-dd" /></td>
																<td class="click-button"><img class="attachimg"
																		src="https://cdn-icons-png.flaticon.com/512/6583/6583130.png"></td>
														</tr>
												</c:forEach>
										</tbody>
								</table>
						</div>
				</div>
				<br />

				<ul class="pagenationposition">


						<img
								src="https://cdn.icon-icons.com/icons2/3936/PNG/512/direction_play_backward_arrow_next_previous_back_icon_250674.png">
						<li class="prev"><a href="#">이전</a></li>

						<c:forEach items="${noticeList}" var="notice">
								<li class="listss" data-card-widget="search"><a class="singlebutton" href="#"
										onclick="location.href='noticeDetail?nno='" +${notice.nno}>${notice.nno}</a>
										</button>
						</c:forEach>

						<li class="next"><a href="#">다음</a></li>
						<img
								src="https://cdn.icon-icons.com/icons2/3936/PNG/512/next_right_play_arrow_arrows_fast_forward_icon_250672.png">
						<button class="write">
								<a href="../notice/noticeWriteForm" type="button" >글쓰기 </a>
						</button>


				</ul>




		</section>
</body>
</html>

<style>
.th-num {
	background-color: #dfdfdf;
	border: solid gray 0.5px;
	cursor: pointer;
}

.th-title {
	background-color: #dfdfdf;
	border: solid gray 0.5px;
	cursor: pointer;
	padding: -20px;
}

.th-date {
	background-color: #dfdfdf;
	border: solid gray 0.5px;
	cursor: pointer;
	margin-right: 160px;
}

#board-search .search-window .search-wrap {
	position: relative;
	/*   padding-right: 124px; */
	width: 80%;
	max-width: 295px;
}

#board-search .search-window .search-wrap input {
	height: 40px;
	width: 77%;
	font-size: 17px;
	padding: 10px 14px;
	border: 1.5px solid #ccd;
}

.board-table {
	font-size: 12px;
	width: 100%;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.board-table a {
	color: #333;
	display: inline-block;
	line-height: 3.4;
	word-break: break-all;
	vertical-align: middle;
}

.board-table a:hover {
	text-decoration: underline;
}

.board-table th {
	text-align: center;
}

.board-table .th-num {
	width: 66px;
	text-align: center;
}

.board-table .th-date {
	width: 190px;
}

.board-table th, .board-table td {
	padding: 8px 4px;
}

.board-table tbody td {
	border-top: 1px solid #e7e7e7;
	text-align: center;
}

.board-table tbody th {
	padding-left: 4px;
	padding-right: 3px;
	border-top: 1px solid #e7e7e7;
	text-align: left;
}

.board-table tbody th p {
	display: none;
}

.bi bi-search {
	margin-bottom: 50px;
}

.btn {
	display: inline-block;
	padding: 0 120px;
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
	box-sizing: border-box;
}

.clearfix:after {
	content: '';
	display: block;
	clear: both;
}

.container {
	width: 800px;
	height: 80px;
	margin-bottom: -30px;
	font-size: 1rem;
}

img {
	width: 30px;
}

.click-button {
	border: solid gray 1px;
}

.click-button:hover {
	background-color: rgb(30, 145, 220, 0.53);
}

ul li {
	float: left;
}

ul li a {
	float: right;
	color: #000;
	font: bold 12px tahoma;
	border: 1px solid #eee;
	text-align: center;
	text-decoration: none;
}

ul {
	list-style: none;
	display: inline;
}

ul li a:hover, ul li a:focus {
	color: #fff;
	background-color: rgb(30, 145, 220, 0.9);
}

.pagenationposition {
	margin-left: 424px 195px;
	display: flex;
	margin-top: 615px;
	justify-content: center;
	padding: -15px;
	height: 45px;
	text-align: center;
}

.prev {
	margin-top: 14px;
	margin-right: 30px;
}

.next {
	margin-top: 14px;
	margin-left: 30px;
}

.write {
	width: 95px;
	height: 39px;
	border-radius: 10px;
	font-weight: bolder;
	color: gray;
	border: solid 1px white;
	margin: -57px;
	margin-top: -124px 177px;
	cursor: pointer;
	margin-right: 4.6px;
}

.search-bar_input {
	width: 10px;
	border: 3px solid #dbdbdb;
	text-align: left;
	margin-left: 525px;
	margin-top: 1.22px;
	margin-bottom: 30px;
	overflow: auto;
	z-index: -1;
	font-size: 12px;
	font-family: 'BookkMyungjo-Bd';
	font-weight: 700;
	font-style: default;
	padding: 145px;
}

.search-bar_input:focus {
	width: 40px;
	text-align: left;
	background-image: none;
}

.search_form input {
	width: 15px;
	height: 100px;
	font-size: 0.5rem;
	font-weight: 400;
	padding: 20px 34px 28px 14px;
	border: solid black 1px;
	border-radius: 8px;
	background-color: rgb(255, 255, 255, 0.4);
	margin-bottom: 3px;

	/* search icon */
}

.selectbox {
	width: 80px;
	height: 40px;
	border-radius: 10px 10px 10px 10px;
	background-color: rgb(255, 255, 255, 0.3);
	border: solid gray 0.5px;
	float: right;
	margin: 97px -220px;
	margin-top: -44px;
	padding: -20px;
}

.listss {
	padding: 8px;
}

.filebutton {
	cursor: pointer;
	text-align: center;
	display: inline;
}

.singlebutton {
	padding: 10px;
	text-decoration: none;
	color: black;
	font-weight: bolder;
	background-color: white;
	border: 1.5px solid gray;
	width: 35px;
	height: 35px;
}

.attachimg {
	cursor: pointer;
}

.titlename {
	margin-top: 122px;
}
</style>

<%@include file="../common/foot.jspf" %>
</html>


