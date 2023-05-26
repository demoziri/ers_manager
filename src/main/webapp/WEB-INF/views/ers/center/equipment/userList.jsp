<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/cheader.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="userList" value="${dataMap.userList }"/>
<c:set var="pageMaker" value="${dataMap.pageMaker}"/>
<c:set var="cri" value="${pageMaker.cri}"/>
<div style="height: 100%;">
<div class="pt-2 pb-2 pr-5 pl-5">
	<div class="row">
		<div class="col-12">
			<div class="center-header-font">
				<i class="fa-solid fa-wrench dashboard_icon pr-2"></i>
				대상자 장비 수신 현황
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<span class="pt-1"
				onclick="location.href='localList?lname=${param.lname}'">◀뒤로가기</span>
		</div>
	</div>
	<div class="row pt-2">
		<div class="col-12">
			<div class="mb-2">
			<div class="float-right mb-2">
				<div class="d-inline-block">
					<select name="m_name" onchange="javascript:getUserList(null,1);">
						<option ${param.m_name eq '게이트웨이' ? 'selected' : '' }>게이트웨이</option>
						<option ${param.m_name eq '출입문감지기' ? 'selected' : ''}>출입문감지기</option>
						<option ${param.m_name eq '화재감지기' ? 'selected' : ''}>화재감지기</option>
						<option ${param.m_name eq '활동감지기' ? 'selected' : ''}>활동감지기</option>
					</select>
				</div>
				<div class="d-inline-block">
					<select name="mstatus" onchange="javascript:getUserList(null,1);">
						<option ${param.mstatus eq '수신' ? 'selected' : ''}>수신</option>
						<option ${param.mstatus eq '미수신' ? 'selected' : ''}>미수신</option>
						<option ${param.mstatus eq '연결해제' ? 'selected' : ''}>연결해제</option>
					</select>
				</div>
				<div class="d-inline-block">
					<select name="lname" onchange="javascript:getUserList('lnum',1);">
						<option ${param.lname eq '서구' ? 'selected' : ''}>서구</option>
						<option ${param.lname eq '동구' ? 'selected' : ''}>동구</option>
						<option ${param.lname eq '중구' ? 'selected' : ''}>중구</option>
						<option ${param.lname eq '유성구' ? 'selected' : ''}>유성구</option>
						<option ${param.lname eq '대덕구' ? 'selected' : ''}>대덕구</option>
					</select>
				</div>
				<div class="d-inline-block mx-3" style="width:15rem;">
					<input type="text" name="center_name" placeholder="수행기관을 입력해주세요." class="w-100" value="${param.center_name}" onkeyup="if(window.event.keyCode==13){getUserList(null,1)}"/>
				</div>
				<i class="fa-solid fa-magnifying-glass" onclick="javascript:getUserList(null,1);"></i>
			</div>
			</div>
			<c:if test="${param.mstatus eq '미수신'}">
			<table class="table-bordered w-100" style="font-size: 0.3rem;">
				<colgroup>
					<col width="16%">
					<col>
					<col width="13%">
					<col width="8%">
					<col width="14%">
					<col width="10%">
				</colgroup>
					<tr class="btn-secondary active">
						<th class="text-center">대상자 이름</th>
						<th class="text-center pt-1 pb-1">주소</th>
						<th class="text-center">전화번호</th>
						<th class="text-center">장비상태</th>
						<th class="text-center">미수신 시간</th>
						<th class="text-center">담당 수행기관</th>
					</tr>
					<tbody>
					<c:forEach var="user" items="${userList}">
					<tr style="font-size: 0.73rem; font-weight: bold;"
						class="bg-skyblue">
						<th class="text-center pt-2 pb-2">${user.m_name}</th>
						<td class="pl-2">${user.address }</td>
						<td class="text-center">${user.phone }</td>
						<td class="text-center">${user.mstatus }</td>
						<td class="text-center">
							<fmt:formatDate value="${user.unconnecttime}" pattern="yyyy-MM-dd"/>
						</td>
						<td class="text-center">${user.c_name }</td>
					</tr>
					</c:forEach>
					<c:if test="${userList eq null || userList.size() eq 0 }">
						<tr style="font-size:1.1rem; font-weight: bold;">
							<td class="text-center py-2" colspan="5">조회된 리스트가 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			</c:if>
			<c:if test="${param.mstatus ne '미수신'}">
			<table class="table-bordered w-100" style="font-size: 0.3rem;">
				<colgroup>
					<col width="16%">
					<col>
					<col width="13%">
					<col width="10%">
					<col width="13%">
				</colgroup>
					<tr class="btn-secondary active">
						<th class="text-center">대상자 이름</th>
						<th class="text-center pt-1 pb-1">주소</th>
						<th class="text-center">전화번호</th>
						<th class="text-center">장비상태</th>
						<th class="text-center">담당 수행기관</th>
					</tr>
					<tbody>
					<c:forEach var="user" items="${userList}" varStatus="status">
					<tr style="font-size: 0.73rem; font-weight: bold;"
						class="${status.index % 2 eq 0 ? 'bg-skyblue' : ''}">
						<th class="text-center pt-2 pb-2">${user.m_name}</th>
						<td class="pl-2">${user.address }</td>
						<td class="text-center">${user.phone }</td>
						<td class="text-center">${user.mstatus}</td>
						<td class="text-center">${user.c_name }</td>
					</tr>
					</c:forEach>
					<c:if test="${userList eq null || userList.size() eq 0 }">
						<tr style="font-size: 1.1rem; font-weight: bold;">
							<td class="text-center py-2" colspan="5">조회된 리스트가 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			</c:if>
		</div>
	</div>
	<input type="hidden" id="gubunVal" value="center_userList"/>
</div>
	<%@ include file="/WEB-INF/views/module/centerPagination.jsp" %>
</div>
<script>
	function getUserList(val, page){
		var m_name = $('select[name="m_name"]').val();
		var mstatus = $('select[name="mstatus"]').val();
		var lname = $('select[name="lname"]').val();
		var center_name = "";
		if(val == null || val !='lnum'){
			center_name = $('input[name="center_name"]').val();
		}
		
		location.href="userList?m_name=" + m_name + "&mstatus=" + mstatus + "&lname=" + lname + "&center_name=" + center_name + "&page="+page; 
	}
</script>
<%@ include file="/WEB-INF/views/include/cfooter.jspf"%>