<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/esupporter/head.jspf"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="/resources/esupporter/css/report.css" rel="stylesheet">

<div class="row">
	<div class="title_name text--center mt-3">
		<h1>보고서</h1>
	</div>
</div>

<div class="row mb-2">
	<div class="col-12">
		<div class="report-buttons mb-2">
			<button type="button" class="btn btn-dark report-buttonLeft button-border" onclick="">뒤로가기</button>
			<button type="button" class="btn btn-secondary" onclick="temporaryStorage();">임시 저장</button>
			<button type="button" class="btn btn-primary" onclick="reportRegist();">제출</button>
		</div>
		<div class="div-gather">
			<table class="tg ">
				<thead>
					<tr>
				    	<th class="tg-aur8 tableHeadFont">보고서 작성일자</th>
				    	<th class="tg-0lax">
				    		<span class="regDate report_regdate"><fmt:formatDate value="" pattern="yyyy-MM-dd" /></span>
				    	</th>
				  	</tr>
				</thead>
				<tbody>
				  	<tr>
				    	<td class="tg-aur8 tableHeadFont">대상자명</td>
				    	<td class="tg-0lax">
				    		<div class="search-bar ml-2 input_borderRadius">
								<input type="text"  name="" value="" class="search-bar__input input_date tableBodyFont" >
								<button type="submit" class="" >
									<i class="fas fa-search mr-1"></i>
								</button>
							</div>
				    	</td>
				  	</tr>
				  	<tr>
				    	<td class="tg-aur8 tableHeadFont">처리요원</td>
				    	<td class="tg-0lax">
				    		<input class="tableBodyFont" value="${loginUser.name}" />
				    	</td>
				  	</tr>
				  	<tr>
				    	<td class="tg-aur8 tableHeadFont">보고서 구분</td>
				    	<td class="tg-0lax">
				    		<select style="text-align:center;" id="reType" name="reType" class="reportmenu" onchange="toggleReport(this.value)">
								<option value="====">선택</option>
								<option value="1">응급상황보고서</option>
								<option value="7">장비점검보고서</option>
						    </select>
				    	</td>
				  	</tr>
				  	
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-12">
		<div class="wrapper">
			<div id="emergencyReport" class="card card-primary report-div" style="display: none;">
				<div class="card-header">
					<h3 class="card-title ">응급상황 보고서</h3>
					<div class="card-tools">
						<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
							<i class="fas fa-minus"></i>
						</button>
					</div>
				</div>
				<div class="card-body" style="display: block;">
					<form id="emergencyReportForm" action="report" method="post">
						<input type="hidden" name="id" value="1" />
						<input type="hidden" name="wCode" value="${wCode}">
						<input type="hidden" name="afterUrl" value="2">
						<%-- <input type="hidden" name="sCode" value="${sCode}"> --%>
						<input type="hidden" name="reType" value="1">
						<input type="hidden" name="reDone" value="">
						<input type="hidden" name="viewCheck" value="0">
						<input type="hidden" name="occurTime" value="2023/05/23">
						<table class="tg">
							<thead>
								<tr>
							    	<th class="tg-aur8 tableHeadFont">전화유무</th>
							    	<th class="tg-0lax">
							    		<input class="tableBodyFont" type="radio" name="callCheck" value="전화 함" > <label>전화 함</label>
										<input class="tableBodyFont" type="radio" name="callCheck" value="전화 안함" > <label>전화 안함</label>
							    	</th>
							  	</tr>
							</thead>
							<tbody>
							  	<tr>
							    	<td class="tg-aur8 tableHeadFont">발생구분</td>
							    	<td class="tg-0lax">
							    		<input class="tableBodyFont" type="radio" name="occurType" value="응급"> <label>응급</label>
							    		<input class="tableBodyFont" type="radio" name="occurType" value="화재"> <label>화재</label>
							    	</td>
							  	</tr>
							  	<tr>
							    	<td class="tg-aur8 tableHeadFont">처리내용</td>
							    	<td class="tg-0lax">
							    		<textarea name="content" class="tableBodyFont" rows="" cols="">
	
										</textarea>
							    	</td>
							  	</tr>
							  	<tr>
							    	<td class="tg-aur8 tableHeadFont">파일첨부</td>
							    	<td class="tg-0lax"></td>
							  	</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-12">
		<div class="wrapper">
			<div id="equipmentReport" class="card card-primary report-div" style="display: none;">
				<div class="card-header">
					<h3 class="card-title">장비점검 보고서</h3>
					<div class="card-tools">
						<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
								<i class="fas fa-minus"></i>
						</button>
					</div>
				</div>
				<div class="card-body" style="display: block;">
					<form id="equipmentReportForm" action="report" method="post">
						<input type="hidden" name="id" value="1" />
						<input type="hidden" name="wCode" value="${wCode}">
						<input type="hidden" name="afterUrl" value="2">
						<%-- <input type="hidden" name="sCode" value="${sCode}"> --%>
						<input type="hidden" name="reType" value="7">
						<input type="hidden" name="reDone" value="">
						<input type="hidden" name="viewCheck" value="0">
						<input type="hidden" name="occurTime" value="2023/05/23">
						<table class="table">
							<tbody>
								<tr>
									<th class="tableHeadFont">게이트웨이</th>
								  	<td>
									    <input type="radio" name="mstatus" value="normal" onchange="toggleDetails(this);" /> <label>정상</label>
									    <input type="radio" name="mstatus" value="failure" onchange="toggleDetails(this);" /> <label>고장</label>
									    <input type="radio" name="mstatus" value="no-reception" onchange="toggleDetails(this);" /> <label>미수신</label>
									    <input type="radio" name="mstatus" value="low-battery" onchange="toggleDetails(this);" /> <label>배터리 부족</label>
									    <input type="radio" name="mstatus" value="etc" onchange="toggleDetails(this);" /> <label>기타</label>
									</td>
								</tr>
								<tr id="gateway-details" style="display: none;">
								  <th class="tableHeadFont">처리내용</th>
								  <td>
								    <textarea name="content" rows="" cols=""></textarea>
								  </td>
								</tr>
								<tr>
									<th class="tableHeadFont">화재감지기</th>
								  	<td>
									    <input type="radio" name="mstatus" value="normal" onchange="toggleDetails(this);" /> <label>정상</label>
									    <input type="radio" name="mstatus" value="failure" onchange="toggleDetails(this);" /> <label>고장</label>
									    <input type="radio" name="mstatus" value="no-reception" onchange="toggleDetails(this);" /> <label>미수신</label>
									    <input type="radio" name="mstatus" value="low-battery" onchange="toggleDetails(this);" /> <label>배터리 부족</label>
									    <input type="radio" name="mstatus" value="etc" onchange="toggleDetails(this);" /> <label>기타</label>
									</td>
								</tr>
								<tr id="gateway-details" style="display: none;">
								  <th class="tableHeadFont">처리내용</th>
								  <td>
								    <textarea name="content" rows="" cols=""></textarea>
								  </td>
								</tr>
								<tr>
									<th class="tableHeadFont">활동감지기</th>
								  	<td>
									    <input type="radio" name="mstatus" value="normal" onchange="toggleDetails(this);" /> <label>정상</label>
									    <input type="radio" name="mstatus" value="failure" onchange="toggleDetails(this);" /> <label>고장</label>
									    <input type="radio" name="mstatus" value="no-reception" onchange="toggleDetails(this);" /> <label>미수신</label>
									    <input type="radio" name="mstatus" value="low-battery" onchange="toggleDetails(this);" /> <label>배터리 부족</label>
									    <input type="radio" name="mstatus" value="etc" onchange="toggleDetails(this);" /> <label>기타</label>
									</td>
								</tr>
								<tr id="gateway-details" style="display: none;">
								  <th class="tableHeadFont">처리내용</th>
								  <td>
								    <textarea name="content" rows="" cols=""></textarea>
								  </td>
								</tr>
								<tr>
									<th class="tableHeadFont">출입문감지기</th>
								  	<td>
									    <input type="radio" name="mstatus" value="normal" onchange="toggleDetails(this);" /> <label>정상</label>
									    <input type="radio" name="mstatus" value="failure" onchange="toggleDetails(this);" /> <label>고장</label>
									    <input type="radio" name="mstatus" value="no-reception" onchange="toggleDetails(this);" /> <label>미수신</label>
									    <input type="radio" name="mstatus" value="low-battery" onchange="toggleDetails(this);" /> <label>배터리 부족</label>
									    <input type="radio" name="mstatus" value="etc" onchange="toggleDetails(this);" /> <label>기타</label>
									</td>
								</tr>
								<tr id="gateway-details" style="display: none;">
									<th class="tableHeadFont">처리내용</th>
								    <td>
								    	<textarea name="content" rows="" cols=""></textarea>
								  	</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


<div style="height: 20px;"></div>

<script>
	function toggleDetails(element) {
		  var detailsRow = element.parentNode.parentNode.nextElementSibling;
		  var textarea = detailsRow.querySelector('textarea');
		  if (element.value === 'etc' || element.value === 'failure') {
		    detailsRow.style.display = 'table-row';
		    textarea.focus();
		  } else {
		    detailsRow.style.display = 'none';
		    textarea.value = '';
		  }
		}
	
	function toggleReport(value) {
	    var emergencyReport = document.getElementById("emergencyReport");
	    var equipmentReport = document.getElementById("equipmentReport");

	    if (value === "1") {
	      emergencyReport.style.display = "block";
	      equipmentReport.style.display = "none";
	    } else if (value === "7") {
	      emergencyReport.style.display = "none";
	      equipmentReport.style.display = "block";
	    } else {
	      emergencyReport.style.display = "none";
	      equipmentReport.style.display = "none";
	    }
	  }
	
	var replyValue = null;
	$(document).ready(function() {
		$("#reType").change(function() {
			var selectedValue = $(this).val();
			replyValue = selectedValue;
		});
	});
	
	function temporaryStorage() {
		if(replyValue == "1"){
			var form = $('#emergencyReportForm');
			$('input[name=reDone]').val('0');
			form.submit();
		}else{
			var form = $('#equipmentReportForm');
			$('input[name=reDone]').val('0');
			form.submit();
		}
	}
	
	function reportRegist() {
		if(replyValue == "1"){
			var form = $('#emergencyReportForm');
			$('input[name=reDone]').val('1');
			form.submit();
		}else{
			var form = $('#equipmentReportForm');
			$('input[name=reDone]').val('1');
			form.submit();
		}
	}
</script>

<%@include file="../include/esupporter/foot.jspf"%>