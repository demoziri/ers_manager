<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/lheader.jspf"%>
<div style="height: 100%; overflow-y: auto;">
<div class="pt-2 pb-2 pr-5 pl-5">
	<div class="row">
		<div class="col-12">
			<div class="center-header-font">
				<i class="fa-solid fa-wrench dashboard_icon pr-2"></i>
				${loginManager.depart } 장비현황
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<span class="pt-1"
				onclick="location.href='../main'">◀뒤로가기</span>
		</div>
	</div>
	<div class="row pt-2">
		<div class="col-12">
			<div class="mb-2">
			<span style="font-weight: bold">◎${loginManager.depart }</span>
			<div class="float-right mb-2">
				<div class="d-inline-block mx-3" style="width:15rem;">
					<input type="text" name="center_name" placeholder="수행기관을 입력해주세요." value="${center_name }" class="w-100" onkeyup="if(window.event.keyCode==13){centerToGo()}"/>
				</div>
				<i class="fa-solid fa-magnifying-glass" onclick="javascript:centerToGo();"></i>
			</div>
			</div>
			<table class="table-bordered w-100" style="font-size: 0.3rem;">
				<colgroup>
					<col>
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
				</colgroup>
					<tr class="btn-secondary active">
						<th class="text-center">수행기관</th>
						<th class="text-center pt-1 pb-1">장비</th>
						<th class="text-center">총 보유량</th>
						<th class="text-center">수신</th>
						<th class="text-center">미수신</th>
						<th class="text-center">연결해제</th>
						<th class="text-center">고장</th>
						<th class="text-center">재고</th>
						<th class="text-center">정상 가동률(%)</th>
					</tr>
					<c:forEach var="center" items="${centerList}">
				<tbody style="border-bottom: 2px solid rgb(160 161 162 / 80%);">
					<c:forEach var="equipment" items="${center.equipmentList }" varStatus="status">
					<tr style="font-size: 0.73rem; font-weight: bold;"
						class="${status.index % 2 eq 0 ? 'bg-skyblue' : ''}">
						<c:if test="${status.index eq 0 }">
							<th class="text-center" rowspan="4" style="word-break: break-word; font-size:1.3rem;">${center.c_name }</th>
						</c:if>
						<th class="text-center pt-2 pb-2">${equipment.m_name}</th>
						<td class="text-center">${equipment.totalCount}</td>
						<td style="cursor: pointer;" class="text-center text-green" onclick="location.href='userList?m_name=${equipment.m_name}&mstatus=수신&center_name=${center.c_name }'">${equipment.receive}</td>
						<td style="cursor: pointer;" class="text-center ${equipment.noreceive eq 0 ? '' : 'text-red' }" onclick="location.href='userList?m_name=${equipment.m_name}&mstatus=미수신&center_name=${center.c_name }'">${equipment.noreceive}</td>
						<td style="cursor: pointer;" class="text-center ${equipment.unconnect eq 0 ? '' : 'text-red' }" onclick="location.href='userList?m_name=${equipment.m_name}&mstatus=연결해제&center_name=${center.c_name }'">${equipment.unconnect}</td>
						<td class="text-center ${equipment.trouble eq 0 ? '' : 'text-red' }">${equipment.trouble}</td>
						<td class="text-center">${equipment.stock}</td>
						<td class="text-center text-blue">${equipment.equipmentPercent}</td>
					</tr>
					</c:forEach>
				</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
</div>
</div>
<script>
	function centerToGo(){
		
		var center_name = $('input[name="center_name"]').val();
		
		location.href="localList?center_name=" + center_name; 
	}
</script>
<%@ include file="/WEB-INF/views/include/lfooter.jspf"%>