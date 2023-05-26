<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/esupporter/head.jspf"%>
<link href="/resources/esupporter/css/noticeList.css" rel="stylesheet">

<div class="title_name text-center" style="margin-top: 10%">
	<h1>공지사항</h1>
</div>

<div class="row mt-12">
	<div class="col-12 d-flex justify-content-between align-items-center mb-1">
	
		<button class="btn btn-dark m-3">뒤로가기</button>
			
		<div class="div_group flex--center" style="margin-right: 20%">
			<select class="input_date input_borderRadius mr-2">
				<option>선택</option>
				<option>보고서 상태</option>
				<option>열람여부</option>
				<option>파일첨부 여부</option>
			</select>
			
			<div class="search-bar ml-2 input_borderRadius">
				<input type="search" name="" class="search-bar__input input_date" >
				<button type="submit" >
					<i class="fas fa-search"></i>
				</button>
			</div>
		</div>
	</div>
	<div class="col-12 mt-20">
		<div class="card">
			<div class="card-body table-responsive p-0">
				<table class="table table-hover text-nowrap">
					<colgroup>
						<col width="50px" />
					    <col width="70px" />
					    <col width="110px" />
					    <col width="50px" />
					</colgroup>
					
					<thead>
						<tr>
							<th class="tableHeadFont ">번호</th>
							<th class="tableHeadFont ">글제목</th>
							<th class="tableHeadFont ">작성날짜</th>
							<th class="tableHeadFont ">파일첨부</th>
						</tr>
					</thead>
					<tbody>
						<tr class="tableBodyFont">
							<td>1</td>
							<td>현장직 분들의 기본 예절에 관한 공지</td>
							<td>2023-05-04</td>
							<td>Y</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<div style="height: 680px;"></div>

<%@include file="../include/esupporter/foot.jspf"%>