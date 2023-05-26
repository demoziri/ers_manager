<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/esupporter/head.jspf"%>

<link href="/resources/esupporter/css/emergencyList.css" rel="stylesheet">

<div class="row">
	<div class="title_name text--center mt-3">
		<h1>장비점검 보고서 내역</h1>
	</div>
</div>

<div class="row">
	<div class="col-12 d-flex justify-content-between align-items-center">
		<div class="div_date text--center mt-3">
			<input class="input_date date_width mr-3" type="date" name="startday" />
			<span class="dashbar">-</span>
			<input class="input_date date_width ml-3" type="date" name="endday" />
		</div>
	</div>
</div>

<div class="row">
	<div class="col-12 d-flex justify-content-between align-items-center">
	
		<button class="btn btn-dark m-3">뒤로가기</button>
			
		<div class="div_group flex--center mt-3 ">
			<select class="input_date input_borderRadius mr-2">
				<option>선택</option>
				<option>보고서 상태</option>
				<option>열람여부</option>
			</select>
			
			<div class="search-bar ml-2 input_borderRadius">
				<input type="search" name="" class="search-bar__input input_date" >
				<button type="submit" >
					<i class="fas fa-search"></i>
				</button>
			</div>
		</div>
		
		<button class="btn btn-primary">등록</button>
		<button class="btn btn-danger m-3">삭제</button>
		
	</div>
</div>

<div class="row m-1">
	<div class="col-12">
		<div class="card">
			<div class="card-body table-responsive p-0">
				<table class="table table-hover text-nowrap">
					<colgroup>
						<col width="50px" />
					    <col width="70px" />
					    <col width="110px" />
					    <col width="50px" />
					    <col width="50px" />
					    <col width="70px" />
					    <col width="200px"/>
					</colgroup>
					
					<thead>
						<tr>
							<th class="tableHeadFont "></th>
							<th class="tableHeadFont ">대상자 명</th>
							<th class="tableHeadFont ">대상자 주소</th>
							<th class="tableHeadFont" >장비구분</th>
							<th class="tableHeadFont ">보고서 작성 상태</th>
							<th class="tableHeadFont ">열람여부</th>
							<th class="tableHeadFont " >장비점검 요청일자</th>
						</tr>
					</thead>
					<tbody>
						<tr class="tableBodyFont">
							<td></td>
							<td>홍길동</td>
							<td>용두동 어덕마을로 111-7</td>
							<td>Y</td>
							<td>임시저장</td>
							<td>N</td>
							<td>2023-05-04</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<div style="height: 700px;"></div>

<%@include file="../include/esupporter/foot.jspf"%>