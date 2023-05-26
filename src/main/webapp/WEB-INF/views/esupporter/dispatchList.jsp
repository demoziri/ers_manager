<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/esupporter/head.jspf"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="/resources/esupporter/css/esupporter.css" rel="stylesheet">

<style type="text/css">

</style>

<div class="row">
	<div class="title_name text--center mt-3">
		<h1>출동내역</h1>
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
				<option>파일첨부 여부</option>
			</select>
			
			<div class="search-bar ml-2 input_borderRadius">
				<input type="search" name="" class="search-bar__input input_date" >
				<button type="submit" >
					<i class="fas fa-search"></i>
				</button>
			</div>
		</div>
		
		<button class="btn btn-primary m-3">등록</button>
		
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
							<th class="tableHeadFont align-middle">상황 구분</th>
							<th class="tableHeadFont align-middle">대상자 명</th>
							<th class="tableHeadFont align-middle">대상자 주소</th>
							<th class="tableHeadFont">
								심장기기<br/><br/>
								부착여부
							</th>
							<th class="tableHeadFont align-middle">보고서 작성 상태</th>
							<th class="tableHeadFont align-middle">열람여부</th>
							<th class="tableHeadFont align-middle" >상황일자</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty rNo }">
							<c:forEach var="dispatch" items="${dispatchList}">
							<fmt:formatDate var="ocurTime" pattern="yyyy-MM-dd" value="${dispatch.ocurTime}"/>
								<tr class="tableBodyFont">
									<td>${dispatch.sType}</td>
									<td>${dispatch.name}</td>
									<td>${dispatch.address}</td>
									<td>${dispatch.pacemaker}</td>
									<td></td>
									<td></td>
									<td>${ocurTime}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${not empty rNo }">
							<c:forEach var="dispatchReport" items="${dispatchReortList}">
							<fmt:formatDate var="ocurTimeReport" pattern="yyyy-MM-dd" value="${dispatchReortList.ocurTime}"/>
								<tr class="tableBodyFont">
									<td>${dispatchReport.sType}</td>
									<td>${dispatchReport.name}</td>
									<td>${dispatchReport.address}</td>
									<td>${dispatchReport.pacemaker}</td>
									<td>${dispatchReport.reDone}</td>
									<td>
										<c:if test="${dispatchReport.viewCheck eq 0}">N</c:if>
										<c:if test="${dispatchReport.viewCheck ge 1}">Y</c:if>
									</td>
									<td>${ocurTimeReport}</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<div style="height: 700px;"></div>

<%@include file="../include/esupporter/foot.jspf"%>