<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/lheader.jspf"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="reportList" value="${dataMap.reportList }"/>
<c:set var="pageMaker" value="${dataMap.pageMaker}"/>
<c:set var="cri" value="${pageMaker.cri}"/>
<div style="height: 100%;">
<div class="pt-2 pb-2 pr-5 pl-5">
	<div class="row">
		<div class="col-12">
			<div class="center-header-font">
				<i class="fa-solid fa-check-to-slot dashboard_icon pr-2"></i>
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
			<form id="searchDateForm" action="list">
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
				<input type="hidden" id="perPageNum" value="10"/>
				</form>
			</div>
			</div>
			<table class="table-bordered w-100" style="font-size: 0.3rem;">
				<colgroup>
					<col width="16%">
					<col>
					<col width="13%">
					<col width="13%">
					<col width="14%">
					<col width="17%">
				</colgroup>
					<tr class="btn-secondary active">
						<th class="text-center">보고서번호</th>
						<th class="text-center pt-1 pb-1">대상자 이름</th>
						<th class="text-center">작성자</th>
						<th class="text-center">작성자 전화번호</th>
						<th class="text-center">담당 수행기관</th>
						<th class="text-center">점검일</th>
					</tr>
					<tbody>
					<c:forEach var="report" items="${reportList}">
						<tr style="font-size: 0.73rem; font-weight: bold;"
							class="bg-skyblue" onclick="popOpen('${report.rno}');">
							<th class="text-center pt-2 pb-2">${report.rno }</th>
							<td class="pl-2">[${report.memType}] ${report.m_name}</td>
							<td class="text-center">${report.f_name}</td>
							<td class="text-center">${report.e_phone}</td>
							<td class="text-center">${report.c_name}</td>
							<td class="text-center"><fmt:formatDate value="${report.regDate}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
					<c:if test="${reportList eq null || reportList.size() < 1 }">
						<tr>
							<td class="text-center py-2" style="font-size:1rem;" colspan="6">
								해당 날짜에 조회된 장비 점검 보고서는 없습니다.
							</td>
						</tr>
					</c:if>
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
		<div class="row" style="height: 450px;">
			<div class="col-6">
				<div class="row my-1">
					<div class="col-6 modal-content-title">보고서 번호</div>
					<div class="col-6 modal-content-content" id="report_rno"></div>
				</div>
				<div class="row my-1">
					<div class="col-6 modal-content-title">작성자 이름</div>
					<div class="col-6 modal-content-content" id="report_e_name"></div>
				</div>
				<div class="row my-1">
					<div class="col-6 modal-content-title">대상자 이름</div>
					<div class="col-6 modal-content-content" id="report_m_name"></div>
				</div>
				<div class="row my-1">
					<div class="col-6 modal-content-title">점검 날짜</div>
					<div class="col-6 modal-content-content"><div><div id="report_regDate1"></div><div id="report_regDate2"></div></div></div>
				</div>
				<div class="row my-1">
					<div class="col-6 modal-content-title">수행기관</div>
					<div class="col-6 modal-content-content" id="report_c_name"></div>
				</div>
					<div class="row my-1 mt-3">
						<div class="card w-100">
							<div class="card-header">
							<h3 class="card-title">점검 장비 리스트</h3>
							</div>
							
							<div class="card-body p-0">
							<table class="table table-sm" style="font-size:0.5rem;">
							<colgroup>
								<col width="45%">
								<col width="30%">
								<col width="25%">
							</colgroup>
							<thead>
							<tr>
							<th style="width: 10px">장비 일련번호</th>
							<th>장비 이름</th>
							<th>장비상태</th>
							</tr>
							</thead>
							<tbody id="machineListView">
							
							</tbody>
							</table>
							</div>
						</div>
					</div>
				</div>
			<div class="col-6 h-100">
					<div class="modal-textarea"  id="report_content"></div>
			</div>
		</div>
	</div>
	<div class="modal-footer justify-content-center">
	<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="popClose();">확인</button>
	</div>
	</div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>

<script type="text/x-handlebars-template" id="machine-list-template">
{{#each .}}
	<tr>
							<td>{{mcode}}{{mnum}}</td>
							<td>{{name}}</td>
							<td>{{mstatus}}</td>
							</tr>
{{/each}}
</script>

<script>
function printData(replyArr, target, templateObject) {
	var template = Handlebars.compile(templateObject.html());
	var html = template(replyArr);
	target.html(html);
}

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

function popOpen(rno) {
    var modalPop = $('.modal_wrap');
    var modalBg = $('.modal_bg'); 

    $.ajax({
    	url:'detail?rno='+rno,
    	success:function(data){
    		console.log(data);
    		$('#report_rno').text(data.rno);
    		$('#report_e_name').text("[응급] " + data.f_name);
    		$('#report_m_name').text(data.m_name);
    		
    		$('#report_c_name').text(data.c_name);
    		$('#report_content').text(data.content);
    		
    		var dateObj=new Date(data.regDate);
   			var year=dateObj.getFullYear();
   			var month=dateObj.getMonth()+1;
   			var date=dateObj.getDate();
   			var hour=dateObj.getHours();
   			var minute=dateObj.getMinutes();
   			
   			$('#report_regDate1').text(year+"년"+month+"월"+date+"일");
    		$('#report_regDate2').text(hour+"시"+minute+"분");
    		
    		printData(data.machineList, $('#machineListView'), $('#machine-list-template'));
    		
    		
    	},error:function(error){
			alert(error.status);
		}
    });
    
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