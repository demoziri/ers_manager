<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/lheader.jspf"%>
<div style="height: 100%;">
<div class="pt-2 pb-2 pr-5 pl-5">
	<div class="row">
		<div class="col-12">
			<div class="center-header-font">
				<i class="fa-solid fa-wrench dashboard_icon pr-2"></i>
				장비 점검 보고
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<span class="pt-1"
				onclick="location.href='${pageContext.request.contextPath}/ers/local/main'">◀뒤로가기</span>
		</div>
	</div>
	<div class="row pt-2">
		<div class="col-12">
			<div class="mb-2">
			<div class="float-right mb-2">
				<div class="d-inline-block searchDate_text">
							검색 시작일
						</div>
						<div class="d-inline-block">
							<input type="date" class="form-control float-right" name="startDate" onchange="javascript:check_startDate();" value="${startDate}" id="startDate">
						</div>
						<div class="d-inline-block searchDate_text">
							검색 종료일
						</div>
						<div class="d-inline-block">
							<input type="date" class="form-control float-right" name="endDate" onchange="javascript:check_endDate();" value="${endDate}" id="endDate">
						</div>
				<div class="d-inline-block">
					<select class="form-control float-right">
						<option>게이트웨이</option>
						<option>출입문감지기</option>
						<option>화재감지기</option>
						<option>활동감지기</option>
					</select>
				</div>
			</div>
			</div>
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
					<tr style="font-size: 0.73rem; font-weight: bold;"
						class="bg-skyblue" onclick="popOpen();">
						<th class="text-center pt-2 pb-2">[독거노인]홍길동</th>
						<td class="pl-2">대선 서구 둔산동 한마루@ 101동 101호</td>
						<td class="text-center">010-1234-1234</td>
						<td class="text-center">23-05-04 11:23</td>
						<td class="text-center">80</td>
						<td class="text-center">둔산</td>
					</tr>
					<tr style="font-size: 0.73rem; font-weight: bold;">
						<th class="text-center pt-2 pb-2">[독거노인]홍길동</th>
						<td class="text-center">대선 서구 둔산동 한마루@ 101동 101호</td>
						<td class="text-center">010-1234-1234</td>
						<td class="text-center">23-05-04 11:23</td>
						<td class="text-center">80</td>
						<td class="text-center">둔산</td>
					</tr>
					<tr style="font-size: 0.73rem; font-weight: bold;"
						class="bg-skyblue">
						<th class="text-center pt-2 pb-2">[독거노인]홍길동</th>
						<td class="text-center">대선 서구 둔산동 한마루@ 101동 101호</td>
						<td class="text-center">010-1234-1234</td>
						<td class="text-center">23-05-04 11:23</td>
						<td class="text-center">80</td>
						<td class="text-center">둔산</td>
					</tr>
					<tr style="font-size: 0.73rem; font-weight: bold;">
						<th class="text-center pt-2 pb-2">[독거노인]홍길동</th>
						<td class="text-center">대선 서구 둔산동 한마루@ 101동 101호</td>
						<td class="text-center">010-1234-1234</td>
						<td class="text-center">23-05-04 11:23</td>
						<td class="text-center">80</td>
						<td class="text-center">둔산</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</div>

<div class="modal_bg" onClick="javascript:popClose();"></div>
<div class="modal_wrap" style="width:800px;">
	<div class="modal-content">
	<div class="modal-header bg-info p-1">
	<h4 class="modal-title pl-2">ERS</h4><h4 class="modal-title m-auto modal-title-right">장비 점검 보고서</h4>
	<button type="button" class="close ml-0" data-dismiss="modal" aria-label="Close" onClick="javascript:popClose();">
	<span aria-hidden="true">×</span>
	</button>
	</div>
	<div class="modal-body">
		<div class="row" style="height: 400px;">
			<div class="col-6">
				<div class="row my-1">
					<div class="col-6 modal-content-title">보고서 번호</div>
					<div class="col-6 modal-content-content">R001234</div>
				</div>
				<div class="row my-1">
					<div class="col-6 modal-content-title">작성자 이름</div>
					<div class="col-6 modal-content-content">[응급] 박제성</div>
				</div>
				<div class="row my-1">
					<div class="col-6 modal-content-title">대상자 이름</div>
					<div class="col-6 modal-content-content">[독거노인] 박제성</div>
				</div>
				<div class="row my-1">
					<div class="col-6 modal-content-title">장비 이름</div>
					<div class="col-6 modal-content-content">게이트웨이</div>
				</div>
				<div class="row my-1">
					<div class="col-6 modal-content-title">점검 날짜</div>
					<div class="col-6 modal-content-content"><div><div>2023년 05월 15일</div><div>12시 23분</div></div></div>
				</div>
				<div class="row my-1">
					<div class="col-6 modal-content-title">지역구</div>
					<div class="col-6 modal-content-content">서구</div>
				</div>
			</div>
			<div class="col-6 h-100">
					<div class="modal-textarea">22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222</div>
			</div>
		</div>
	</div>
	<div class="modal-footer justify-content-center">
	<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="popClose();">확인</button>
	</div>
	</div>
</div>
<script>
function check_startDate(){
	if(!$('input#endDate').val())return;
	if($('input#startDate').val()>$('input#endDate').val()){
		alert("검색 시작일은 종료일 보다 빨라야 합니다.");
		$('input#startDate').val('${param.startDate}');
		$('input#startDate').focus();
		return;
	}
	$('#searchDateForm').submit();
}
function check_endDate(){
	if(!$('input#startDate').val())return;
	if($('input#startDate').val()>$('input#endDate').val()){
		alert("검색 종료일은 시작일 보다 빨라야 합니다.");
		$('input#endDate').val('${param.endDate}');
		$('input#endDate').focus();
		return;
	}
	$('#searchDateForm').submit();
}

function popOpen() {
    var modalPop = $('.modal_wrap');
    var modalBg = $('.modal_bg'); 

    $(modalPop).show();
    $(modalBg).show();

}

 function popClose() {
   var modalPop = $('.modal_wrap');
   var modalBg = $('.modal_bg');

   $(modalPop).hide();
   $(modalBg).hide();

}
</script>
<%@ include file="/WEB-INF/views/include/lfooter.jspf"%>