<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/cheader.jspf"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="reportList" value="${dataMap.reportList }"/>
<c:set var="pageMaker" value="${dataMap.pageMaker}"/>
<c:set var="cri" value="${pageMaker.cri}"/>

<div style="height: 100%;">
	<div class="pt-2 pb-2 pr-5 pl-5">
		<div class="row">
			<div class="col-12">
				<div class="center-header-font">
					<i class="fa-solid fa-bell dashboard_icon pr-2"></i>
					응급발생처리현황
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<span class="pt-1" onclick="location.href='../main'">◀뒤로가기</span>
			</div>
		</div>
		<div class="row pt-2">
			<div class="col-12">
				<div class="mb-2">
				<form id="searchDateForm" action="list">
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
						</div>
					</div>
					<input type="hidden" id="perPageNum" value="8"/>
				</form>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="card">
	
						<div class="card-body p-0">
							<table class="table table-striped">
							<colgroup>
								<col width="13%">
								<col width="11%">
								<col width="11%">
								<col width="16%">
								<col>
								<col width="14%">
								<col width="15%">
							</colgroup>
								<thead>
									<tr>
										<th>보고서번호</th>
										<th>대상자 구분</th>
										<th>대상자 이름</th>
										<th>발생구분</th>
										<th>발생시간</th>
										<th>보고서 작성자</th>
										<th class="text-center">상세보기</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="report" items="${reportList}">
									<tr>
										<td>${report.changeRno}</td>
										<td>${report.memType}</td>
										<td>${report.m_name}</td>
										<td class="text-red">${report.occurType}</td>
										<td><fmt:formatDate value="${report.occurTime}" pattern="MM월dd일 HH시MM분"/> </td>
										<td>${report.e_name}</td>
										<td>
											<button type="button" class="btn btn-block btn-outline-info m-auto p-0" style="width:50%;" onclick="popOpen('${report.rno}');">보기</button>
										</td>
									</tr>
								</c:forEach>
								<c:if test="${reportList eq null || reportList.size() lt 1 }">
									<tr>
										<td colspan="7" class="text-center">해당 날짜에 작성된 보고서는 없습니다</td>
									</tr>
								</c:if>	
								</tbody>
							</table>
						</div>
					
					</div>
				</div>
		</div>
			<%@ include file="/WEB-INF/views/module/centerPagination.jsp" %>
		
	</div>
</div>

<div class="modal_bg" onClick="javascript:popClose();"></div>
<div class="modal_wrap" style="width:800px;">
	<div class="modal-content">
	<div class="modal-header bg-info p-1">
	<h4 class="modal-title pl-2">ERS</h4><h4 class="modal-title m-auto modal-title-right">응급상황 보고서</h4>
	<button type="button" class="close ml-0" data-dismiss="modal" aria-label="Close" onClick="javascript:popClose();">
	<span aria-hidden="true">×</span>
	</button>
	</div>
	<div class="modal-body">
		<div class="row" style="height: 300px;">
			<div class="col-6">
				<div class="row my-1">
					<div class="col-6 modal-content-title">보고서 번호</div>
					<div class="col-6 modal-content-content" id="changeRno"></div>
				</div>
				<div class="row my-1">
					<div class="col-6 modal-content-title">작성자 이름</div>
					<div class="col-6 modal-content-content" id="e_name"></div>
				</div>
				<div class="row my-1">
					<div class="col-6 modal-content-title">대상자 이름</div>
					<div class="col-6 modal-content-content" id="m_name"></div>
				</div>
				<div class="row my-1">
					<div class="col-6 modal-content-title">발생시간</div>
					<div class="col-6 modal-content-content"><div><div id="occurTime1"></div><div id="occurTime2"></div></div></div>
				</div>
				<div class="row my-1">
					<div class="col-6 modal-content-title">발생구분</div>
					<div class="col-6 modal-content-content" id="occurType"></div>
				</div>
				<div class="row my-1">
					<div class="col-6 modal-content-title">보고서 작성 날짜</div>
					<div class="col-6 modal-content-content" id="r_regDate"><div><div id="r_regDate1"></div><div id="r_regDate2"></div></div></div>
				</div>
				
			</div>
			<div class="col-6 h-100">
					<div class="modal-textarea" id="content"></div>
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


function popOpen(rno) {
    var modalPop = $('.modal_wrap');
    var modalBg = $('.modal_bg'); 
	
    $.ajax({
    	url:'detail',
    	method:'get',
    	data:"rno="+rno,
    	contentType:'application/json',
    	success:function(data){
    		
    		$('#changeRno').text(data.changeRno);
    		$('#e_name').text(data.e_name);
    		$('#m_name').text("["+data.memType+"] " + data.m_name);
    		$('#occurType').text(data.occurType);
    		$('#content').text(data.content);
    		
    		var dateObj1=new Date(data.occurTime);
    		
   			var year1=dateObj1.getFullYear();
   			var month1=dateObj1.getMonth()+1;
   			var date1=dateObj1.getDate();
			var hour1=dateObj1.getHours();
			var minute1 = dateObj1.getMinutes();
   			
    		var dateObj2=new Date(data.r_regDate);
   			var year2=dateObj2.getFullYear();
   			var month2=dateObj2.getMonth()+1;
   			var date2=dateObj2.getDate();
			var hour2=dateObj2.getHours();
			var minute2 = dateObj2.getMinutes();
			
    		$('#occurTime1').text(year1+"년"+month1+"월"+date1+"분");
    		$('#occurTime2').text(hour1+"시 "+minute1+"분");
    		$('#r_regDate1').text(year2+"년"+month2+"월"+date2+"분");
    		$('#r_regDate2').text(hour2+"시 "+minute2+"분");
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
<%@ include file="/WEB-INF/views/include/cfooter.jspf"%>