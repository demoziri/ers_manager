<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/esupporter/head.jspf"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="/resources/esupporter/css/emergencyList.css" rel="stylesheet">
<c:set var="emergencyReportList" value="${dataMap.emergencyReportList }"/>
<c:set var="pageMaker" value="${dataMap.pageMaker}"/>
<c:set var="cri" value="${pageMaker.cri }"/>

<div class="row">
	<div class="title_name text--center mt-3">
		<h1>응급상황 보고서 내역</h1>
	</div>
</div>

<div class="row">
	<div class="col-12 d-flex justify-content-between align-items-center">
		<div class="div_date text--center mt-3">
			<input class="input_date date_width mr-3" type="date" name="keyword"  value="${cri.keyword}"/>
			<span class="dashbar">-</span>
			<input class="input_date date_width ml-3" type="date" name="keyword" value="${cri.keyword}"/>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-12 d-flex justify-content-between align-items-center">
	
		<button class="btn btn-dark m-3">뒤로가기</button>
			
		<div class="div_group flex--center mt-3 ">
			<select name="searchType" class="input_date input_borderRadius mr-2">
				<option value="nrvf">선택</option>
				<option value="n">대상자 명</option>
				<option value="r">보고서 상태</option>
				<option value="v">열람여부</option>
				<option value="f">파일첨부 여부</option>
			</select>
			
			<div class="search-bar ml-2 input_borderRadius">
				<input type="search" name="keyword" value="${cri.keyword}" class="search-bar__input input_date" >
				<button type="button" onclick="list_go(1);" >
					<i class="fas fa-search"></i>
				</button>
			</div>
		</div>
		
		<div class="justify-end">
			<button class="btn btn-primary">등록</button>
			<button class="btn btn-danger m-3">삭제</button>
		</div>
		
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
							<th class="tableHeadFont ">보고서 작성 상태</th>
							<th class="tableHeadFont ">열람여부</th>
							<th class="tableHeadFont ">대상자상태</th>
							<th class="tableHeadFont " >파일첨부여부</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="emergencyReport" items="${emergencyReportList}">
							<fmt:formatDate var="occurTime" pattern="yyyy-MM-dd" value="${emergencyReport.occurTime}"/>
							<tr class="tableBodyFont">
								<td>${emergencyReport.occurType}</td>
								<td class="reportname" onclick="emergencyReportDetail(${emergencyReport.RNo});">${emergencyReport.name}</td>
								<td>${emergencyReport.address}</td>
								<td>
									
								</td>
								<td>
									<c:if test="${emergencyReport.reDone eq 0 }">임시저장</c:if>
									<c:if test="${emergencyReport.reDone eq 1 }">제출</c:if>
								</td>
								<td>
									<c:if test="${emergencyReport.viewCheck eq 0 }">열람안함</c:if>
									<c:if test="${emergencyReport.viewCheck ne 0 }">열람함</c:if>
								</td>
								<td>${occurTime}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<%@include file="../include/esupporter/pagination.jsp"%>

<script>
	function emergencyReportDetail(rNo) {
		location.href = "/ers/esupporter/emergencyDetail?rNo="+rNo;
	}
	
	function list_go(page,url){
		
		if(!url) url="emergencyList";
		
		$("form#jobForm input[name='page']").val(page);
		$("form#jobForm input[name='perPageNum']").val($('select[name="perPageNum"]').val());
		$("form#jobForm input[name='searchType']").val($('select[name="searchType"]').val());
		$("form#jobForm input[name='keyword']").val($('input[name="keyword"]').val());
		
		$('form#jobForm').attr({
			action:url,
			method:'get'
		}).submit();
	}
</script>

<div style="height: 700px;"></div>

<%@include file="../include/esupporter/foot.jspf"%>