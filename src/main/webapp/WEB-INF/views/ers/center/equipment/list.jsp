<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/cheader.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="height: 100%; overflow-y: auto;">
<div class="pt-2 pb-2 pr-5 pl-5">
	<div class="row">
		<div class="col-12">
			<div class="center-header-font">
				<i class="fa-solid fa-wrench dashboard_icon pr-2"></i>
				장비현황
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<span class="pt-1"
				onclick="location.href='${pageContext.request.contextPath}/ers/center/main'">◀뒤로가기</span>
		</div>
	</div>
	<c:forEach var="local" items="${localList}">
	<div class="row pt-2">
		<div class="col-12">
			<span style="font-weight: bold">◎${local.name }</span>
			<span style="font-weight: bold" class="float-right" onclick="location.href='localList?lname=${local.name}'">＋ 상세보기</span>
			<table class="table-bordered w-100" style="font-size: 0.3rem;">
				<colgroup>
					<col width="12.5%">
					<col width="12.5%">
					<col width="12.5%">
					<col width="12.5%">
					<col width="12.5%">
					<col width="12.5%">
					<col width="12.5%">
					<col width="12.5%">
				</colgroup>
				<tbody>
					<tr class="btn-secondary active">
						<th class="text-center pt-1 pb-1">장비</th>
						<th class="text-center">총 보유량</th>
						<th class="text-center">수신</th>
						<th class="text-center">미수신</th>
						<th class="text-center">연결해제</th>
						<th class="text-center">고장</th>
						<th class="text-center">재고</th>
						<th class="text-center">정상 가동률(%)</th>
					</tr>
					<c:forEach var="equipment" items="${local.equipmentList }" varStatus="status">
					<tr style="font-size: 0.73rem; font-weight: bold;"
						class="${status.index % 2 eq 0 ? 'bg-skyblue' : ''}">
						<th class="text-center pt-2 pb-2">${equipment.m_name}</th>
						<td class="text-center">${equipment.totalCount}</td>
						<td class="text-center text-green">${equipment.receive}</td>
						<td class="text-center ${equipment.noreceive eq 0 ? '' : 'text-red' }">${equipment.noreceive}</td>
						<td class="text-center ${equipment.unconnect eq 0 ? '' : 'text-red' }">${equipment.unconnect}</td>
						<td class="text-center ${equipment.trouble eq 0 ? '' : 'text-red' }">${equipment.trouble}</td>
						<td class="text-center">${equipment.stock}</td>
						<td class="text-center text-blue">${equipment.equipmentPercent}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</c:forEach>
</div>
</div>
<%@ include file="/WEB-INF/views/include/cfooter.jspf"%>